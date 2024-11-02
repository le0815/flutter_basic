class Shoe {
  final String nameShoe;
  final String imgPathShoe;
  final double priceShoe;

  const Shoe({
    required this.nameShoe,
    required this.imgPathShoe,
    required this.priceShoe,
  });

  @override
  String toString() {
    var shoe = {
      "name": nameShoe,
      "price": priceShoe,
      "imgPath": imgPathShoe,
    };
    return shoe.toString();
  }
}
