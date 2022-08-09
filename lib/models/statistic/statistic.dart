class Statistic {
  Statistic({
    this.orderId,
    this.storeId,
    this.date,
    this.seconds,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        orderId: json['orderId'],
        storeId: json['storeId'],
        date: json['date'],
        seconds: json['seconds'],
      );

  final int? orderId;
  final int? storeId;
  final String? date;
  final int? seconds;
}
