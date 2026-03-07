import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
  final TextEditingController _queryController = TextEditingController();

  BillSearchType _searchType = BillSearchType.connectionNumber;
  List<Bill> _results = const [];
  bool _isLoading = false;
  bool _hasSearched = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _errorMessage = widget.startupError;
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
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
                controller: _queryController,
                keyboardType: _keyboardTypeFor(_searchType),
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _search(),
                decoration: InputDecoration(
                  hintText: _hintFor(_searchType),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
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
    return SegmentedButton<BillSearchType>(
      segments: const [
        ButtonSegment<BillSearchType>(
          value: BillSearchType.connectionNumber,
          label: Text('Connection Number'),
          icon: Icon(Icons.electrical_services_outlined),
        ),
        ButtonSegment<BillSearchType>(
          value: BillSearchType.mobileNumber,
          label: Text('Mobile Number'),
          icon: Icon(Icons.phone_outlined),
        ),
        ButtonSegment<BillSearchType>(
          value: BillSearchType.name,
          label: Text('Name'),
          icon: Icon(Icons.person_outline),
        ),
      ],
      selected: {_searchType},
      showSelectedIcon: false,
      onSelectionChanged: (selection) {
        setState(() {
          _searchType = selection.first;
        });
      },
    );
  }

  Widget _buildStateBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_hasSearched) {
      return _StateMessage(
        icon: Icons.receipt_long_outlined,
        title: 'Find Your Utility Bill',
        subtitle: 'Choose a search type and tap Search to see bill details.',
      );
    }

    if (_results.isEmpty) {
      return _StateMessage(
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
