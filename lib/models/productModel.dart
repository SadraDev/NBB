import 'dart:convert';

class Product {
  int? id;
  String? productName;
  String? productType;
  String? productSubtype;
  int? minSize;
  int? maxSize;
  String? price;
  Map<String, dynamic>? colors;
  String? image;
  String? description;
  String? brand;
  int? homeProduct;
  bool? liked;

  Product({
    this.id,
    this.productName,
    this.productType,
    this.productSubtype,
    this.minSize,
    this.maxSize,
    this.price,
    this.colors,
    this.image,
    this.description,
    this.brand,
    this.liked,
    this.homeProduct,
  });

  factory Product.fromJson(List<dynamic> parsedJson) {
    return Product(
      id: parsedJson[0],
      productName: parsedJson[1],
      productType: parsedJson[2],
      productSubtype: parsedJson[3],
      brand: parsedJson[4],
      description: parsedJson[5],
      homeProduct: parsedJson[6],
      minSize: parsedJson[7],
      maxSize: parsedJson[8],
      price: parsedJson[9],
      colors: jsonDecode(parsedJson[10]),
      image: parsedJson[11],
      liked: false,
    );
  }
}
