import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bill.dart';
import '../services/bill_service.dart';
import '../widgets/bill_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.billService,
    this.startupError,
  });

  final BillService billService;
  final String? startupError;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _recentSearchesKey = 'recent_bill_searches_v1';
  static const int _maxRecentSearches = 10;

  final TextEditingController _queryController = TextEditingController();
  final FocusNode _queryFocusNode = FocusNode();

  BillSearchType _searchType = BillSearchType.connectionNumber;
  List<_RecentSearchEntry> _recentSearches = const [];
  List<Bill> _results = const [];
  bool _isLoading = false;
  bool _hasSearched = false;
  bool _showSuggestions = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _errorMessage = widget.startupError;
    _queryFocusNode.addListener(_onSearchFieldFocusChanged);
    _loadRecentSearches();
  }

  @override
  void dispose() {
    _queryFocusNode.removeListener(_onSearchFieldFocusChanged);
    _queryController.dispose();
    _queryFocusNode.dispose();
    super.dispose();
  }

  void _onSearchFieldFocusChanged() {
    if (!mounted) {
      return;
    }

    setState(() {
      _showSuggestions = _queryFocusNode.hasFocus;
    });
  }

  Future<void> _loadRecentSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = prefs.getStringList(_recentSearchesKey) ?? const [];
      final parsed = encoded
          .map(_RecentSearchEntry.decode)
          .whereType<_RecentSearchEntry>()
          .toList(growable: false);

      if (!mounted) {
        return;
      }

      setState(() {
        _recentSearches = parsed.take(_maxRecentSearches).toList(growable: false);
      });
    } catch (_) {
      // Ignore cache read errors so search still works.
    }
  }

  Future<void> _rememberSearch({
    required BillSearchType type,
    required String query,
  }) async {
    final normalized = query.trim();
    if (normalized.isEmpty) {
      return;
    }

    final updated = _recentSearches.toList(growable: true)
      ..removeWhere(
        (entry) =>
            entry.type == type &&
            entry.query.toLowerCase() == normalized.toLowerCase(),
      )
      ..insert(0, _RecentSearchEntry(type: type, query: normalized));

    if (updated.length > _maxRecentSearches) {
      updated.removeRange(_maxRecentSearches, updated.length);
    }

    final recent = updated.toList(growable: false);

    if (mounted) {
      setState(() {
        _recentSearches = recent;
      });
    } else {
      _recentSearches = recent;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _recentSearchesKey,
      recent.map((entry) => entry.encode()).toList(growable: false),
    );
  }

  List<_RecentSearchEntry> _filteredSuggestions() {
    final input = _queryController.text.trim().toLowerCase();
    final matches = _recentSearches
        .where(
          (entry) =>
              entry.type == _searchType &&
              (input.isEmpty || entry.query.toLowerCase().contains(input)),
        )
        .toList(growable: false);

    return matches.take(_maxRecentSearches).toList(growable: false);
  }

  Future<void> _onSuggestionTap(_RecentSearchEntry entry) async {
    _queryController
      ..text = entry.query
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: entry.query.length),
      );

    setState(() {
      _searchType = entry.type;
      _showSuggestions = false;
    });

    FocusScope.of(context).unfocus();
    await _search();
  }

  Future<void> _search() async {
    final query = _queryController.text.trim();
    if (query.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a value to search.';
      });
      return;
    }

    if (widget.startupError != null) {
      setState(() {
        _errorMessage = widget.startupError;
      });
      return;
    }

    try {
      await _rememberSearch(type: _searchType, query: query);
    } catch (_) {
      // Ignore cache write errors so search still runs.
    }

    setState(() {
      _isLoading = true;
      _hasSearched = true;
      _errorMessage = null;
      _results = const [];
    });

    try {
      final bills = await widget.billService.searchBills(
        type: _searchType,
        query: query,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _results = bills;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
        _errorMessage = error.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WSBills'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchTypeSelector(),
              const SizedBox(height: 12),
              TextField(
                key: ValueKey(_searchType),
                controller: _queryController,
                focusNode: _queryFocusNode,
                keyboardType: _keyboardTypeFor(_searchType),
                textInputAction: TextInputAction.search,
                onChanged: (_) {
                  if (!mounted) {
                    return;
                  }

                  setState(() {
                    _showSuggestions = _queryFocusNode.hasFocus;
                  });
                },
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: _hintFor(_searchType),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              _buildSuggestions(),
              if (_errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isLoading ? null : _search,
                  child: const Text('Search'),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(child: _buildStateBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTypeSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildSearchChip(
            type: BillSearchType.connectionNumber,
            label: 'Connection Number',
            icon: Icons.electrical_services_outlined,
          ),
          const SizedBox(width: 8),
          _buildSearchChip(
            type: BillSearchType.mobileNumber,
            label: 'Mobile Number',
            icon: Icons.phone_outlined,
          ),
          const SizedBox(width: 8),
          _buildSearchChip(
            type: BillSearchType.name,
            label: 'Name',
            icon: Icons.person_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchChip({
    required BillSearchType type,
    required String label,
    required IconData icon,
  }) {
    final isSelected = _searchType == type;
    return ChoiceChip(
      selected: isSelected,
      onSelected: (_) {
        if (isSelected) {
          return;
        }

        FocusScope.of(context).unfocus();
        setState(() {
          _searchType = type;
          _showSuggestions = false;
        });
      },
      avatar: Icon(
        icon,
        size: 18,
        color: const Color(0xFF0A2463),
      ),
      label: Text(
        label,
        softWrap: false,
      ),
      labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: const Color(0xFF0A2463),
            fontWeight: FontWeight.w700,
          ),
      selectedColor: const Color(0xFFD7E6F7),
      backgroundColor: Colors.white,
      side: BorderSide(
        color: const Color(0xFF0A2463).withValues(alpha: 0.35),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }

  Widget _buildSuggestions() {
    final suggestions = _filteredSuggestions();
    if (!_showSuggestions || suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxHeight = suggestions.length * 56.0;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight.clamp(56.0, 280.0)),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: suggestions.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return ListTile(
                dense: true,
                leading: const Icon(Icons.history_rounded),
                title: Text(
                  suggestion.query,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(_labelFor(suggestion.type)),
                onTap: () => _onSuggestionTap(suggestion),
              );
            },
          ),
        ),
      ),
    );
  }

  String _labelFor(BillSearchType type) {
    switch (type) {
      case BillSearchType.connectionNumber:
        return 'Connection Number';
      case BillSearchType.mobileNumber:
        return 'Mobile Number';
      case BillSearchType.name:
        return 'Name';
    }
  }

  Widget _buildStateBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_hasSearched) {
      return const _StateMessage(
        icon: Icons.receipt_long_outlined,
        title: 'Find Your Utility Bill',
        subtitle: 'Choose a search type and tap Search to see bill details.',
      );
    }

    if (_results.isEmpty) {
      return const _StateMessage(
        icon: Icons.search_off_rounded,
        title: 'No bill found',
        subtitle: 'Try a different search value or search type.',
      );
    }

    final cards = _results
        .map(
          (bill) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: BillCard(bill: bill),
          ),
        )
        .toList(growable: false)
        .animate(interval: 70.ms)
        .fadeIn(duration: 280.ms)
        .slideY(begin: 0.1, end: 0, duration: 280.ms);

    return ListView(
      children: [
        Text(
          '${_results.length} result(s)',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 12),
        ...cards,
      ],
    );
  }

  String _hintFor(BillSearchType type) {
    switch (type) {
      case BillSearchType.connectionNumber:
        return 'Enter connection number';
      case BillSearchType.mobileNumber:
        return 'Enter mobile number';
      case BillSearchType.name:
        return 'Enter customer name';
    }
  }

  TextInputType _keyboardTypeFor(BillSearchType type) {
    switch (type) {
      case BillSearchType.connectionNumber:
        return TextInputType.number;
      case BillSearchType.mobileNumber:
        return TextInputType.phone;
      case BillSearchType.name:
        return TextInputType.text;
    }
  }
}

class _RecentSearchEntry {
  const _RecentSearchEntry({
    required this.type,
    required this.query,
  });

  final BillSearchType type;
  final String query;

  String encode() {
    return jsonEncode({
      'type': type.name,
      'query': query,
    });
  }

  static _RecentSearchEntry? decode(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }

      final typeName = decoded['type'] as String?;
      final query = decoded['query'] as String?;
      if (typeName == null || query == null || query.trim().isEmpty) {
        return null;
      }

      final type = BillSearchType.values.firstWhere(
        (value) => value.name == typeName,
        orElse: () => BillSearchType.name,
      );
      return _RecentSearchEntry(type: type, query: query.trim());
    } catch (_) {
      return null;
    }
  }
}

class _StateMessage extends StatelessWidget {
  const _StateMessage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: const Color(0xFF3E92CC)),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
