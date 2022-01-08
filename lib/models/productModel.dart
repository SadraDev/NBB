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
  });
}
