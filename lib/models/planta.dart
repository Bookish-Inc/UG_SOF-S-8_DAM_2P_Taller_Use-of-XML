class Planta {
  final String common;
  final String botanical;
  final String zone;
  final String light;
  final double price;
  final String availability;
  final String? image;

  Planta({
    required this.common,
    required this.botanical,
    required this.zone,
    required this.light,
    required this.price,
    required this.availability,
    this.image,
  });
}
