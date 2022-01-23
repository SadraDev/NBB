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
  final int? deleted;
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
    this.deleted,
    this.liked,
    this.homeProduct,
  });

  factory Product.fromJson(List<dynamic> parsedJson) {
    return Product(
      id: parsedJson[0],
      productName: parsedJson[1],
      productType: parsedJson[2],
      productSubtype: parsedJson[3],
      minSize: parsedJson[4],
      maxSize: parsedJson[5],
      price: parsedJson[6],
      colors: jsonDecode(parsedJson[7]),
      image: parsedJson[8],
      description: parsedJson[9],
      deleted: parsedJson[10],
      homeProduct: parsedJson[11],
      liked: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productType': productType,
      'productSubtype': productSubtype,
      'minSize': minSize,
      'maxSize': maxSize,
      'price': price,
      'colors': colors,
      'image': image,
      'description': description,
      'deleted': deleted,
      'liked': false,
    };
  }
}
