class Bill {
  const Bill({
    required this.consumerName,
    required this.address,
    required this.locality,
    required this.totalBill,
    required this.status,
  });

  final String consumerName;
  final String address;
  final String locality;
  final double totalBill;
  final String status;

  String get name => consumerName;
  String get areaName => locality;
  double get amount => totalBill;
  bool get isPaid {
    final normalized = status.trim().toLowerCase();
    return normalized == 'paid' || normalized == 'cleared';
  }

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      consumerName: (json['consumer_name'] ?? '') as String,
      address: (json['address'] ?? '') as String,
      locality: (json['locality'] ?? '') as String,
      totalBill: _parseAmount(json['total_bill']),
      status: (json['status'] ?? '') as String,
    );
  }

  static double _parseAmount(dynamic value) {
    if (value is num) {
      return value.toDouble();
    }

    if (value is String) {
      return double.tryParse(value) ?? 0;
    }

    return 0;
  }
}
