class Sells {
  int? id;
  String? userName;
  String? userPhone;
  String? receiverName;
  String? receiverPhone;
  String? receiverAddress;
  String? receiverPostalCode;
  String? userDescription;
  int? productId;
  String? productName;
  String? productBrand;
  String? productType;
  String? productSubtype;
  int? productSize;
  String? productColor;
  String? productPrice;
  String? productImage;
  int? check1;
  int? check2;
  int? check3;
  int? archived;

  Sells({
    this.id,
    this.userName,
    this.userPhone,
    this.receiverName,
    this.receiverPhone,
    this.receiverAddress,
    this.receiverPostalCode,
    this.userDescription,
    this.productId,
    this.productName,
    this.productBrand,
    this.productType,
    this.productSubtype,
    this.productSize,
    this.productColor,
    this.productPrice,
    this.productImage,
    this.check1,
    this.check2,
    this.check3,
    this.archived,
  });

  factory Sells.fromJson(Map<String, dynamic> parsedJson) {
    return Sells(
      id: parsedJson['id'],
      userName: parsedJson['user_name'],
      userPhone: parsedJson['user_phone'],
      receiverName: parsedJson['receiver_name'],
      receiverPhone: parsedJson['receiver_phone'],
      receiverAddress: parsedJson['receiver_address'],
      receiverPostalCode: parsedJson['receiver_postal_code'],
      userDescription: parsedJson['user_description'],
      productId: parsedJson['product_id'],
      productName: parsedJson['product_name'],
      productBrand: parsedJson['product_brand'],
      productType: parsedJson['product_type'],
      productSubtype: parsedJson['product_subtype'],
      productSize: parsedJson['product_size'],
      productColor: parsedJson['product_color'],
      productPrice: parsedJson['product_price'],
      productImage: parsedJson['product_image'],
      check1: 0,
      check2: 0,
      check3: 0,
      archived: 0,
    );
  }
}
