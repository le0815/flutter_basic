class Shoe {
  final String name;
  final double price;
  final String imgPath;

  Shoe({
    required this.name,
    required this.price,
    required this.imgPath,
  });

  @override
  String toString() {
    var shoe = {
      'name': name,
      'price': price,
    };
    // TODO: implement toString
    return shoe.toString();
  }
}
