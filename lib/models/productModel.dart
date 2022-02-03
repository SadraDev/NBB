import 'dart:convert';

class Product {
  final int? id;
  final String? productName;
  final String? productType;
  final String? productSubtype;
  final int? minSize;
  final int? maxSize;
  final String? price;
  final Map<String, dynamic>? colors;
  final String? image;
  final String? description;
  final String? brand;
  final int? homeProduct;
  final bool? liked;

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
