class OrderDetail {
  final int id;
  final String name;
  final String to;
  final String from;
  final bool isDel;

  OrderDetail({
    required this.isDel,
    required this.id,
    required this.name,
    required this.to,
    required this.from,
  });
}
