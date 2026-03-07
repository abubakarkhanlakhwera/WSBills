import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/bill.dart';

enum BillSearchType {
  connectionNumber,
  mobileNumber,
  name,
}

class BillService {
  BillService({
    SupabaseClient? client,
    String tableName = 'bills',
  })  : _client = client ?? Supabase.instance.client,
        _tableName = tableName;

  final SupabaseClient _client;
  final String _tableName;

  Future<List<Bill>> searchBills({
    required BillSearchType type,
    required String query,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return const [];
    }

    try {
      dynamic request = _client
          .from(_tableName)
          .select('consumer_name,address,locality,total_bill,status');

      switch (type) {
        case BillSearchType.connectionNumber:
          request = request.eq('connection_no', trimmed);
          break;
        case BillSearchType.mobileNumber:
          request = request.eq('consumer_mobile', trimmed);
          break;
        case BillSearchType.name:
          request = request.ilike('consumer_name', '%${_escapeForIlike(trimmed)}%');
          break;
      }

      final data = await request.limit(100);
      final rows = List<Map<String, dynamic>>.from(data as List<dynamic>);
      return rows.map(Bill.fromJson).toList(growable: false);
    } on PostgrestException catch (error) {
      throw Exception(error.message);
    } catch (_) {
      throw Exception('Unexpected error while searching bills.');
    }
  }

  // Escape wildcard characters so plain text searches do not over-match.
  String _escapeForIlike(String value) {
    return value.replaceAll('%', r'\%').replaceAll('_', r'\_');
  }
}
