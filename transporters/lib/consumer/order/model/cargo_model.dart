class CargoModel {
  final String cargoName;
  final int to;
  final int from;
  final int userId;
  final bool isDel;

  CargoModel({
    required this.cargoName,
    required this.to,
    required this.from,
    required this.userId,
    required this.isDel,
  });
}
