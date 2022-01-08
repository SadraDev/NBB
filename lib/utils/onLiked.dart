import 'package:flutter/cupertino.dart';
import 'package:nbb/models/productModel.dart';

class OnLiked extends ChangeNotifier {
  List<Product> likedProductsList = [];

  Product onLiked(Product product) {
    if (product.liked == false) {
      product = Product(
        id: product.id,
        productName: product.productName,
        productType: product.productType,
        productSubtype: product.productSubtype,
        minSize: product.minSize,
        maxSize: product.maxSize,
        price: product.price,
        colors: product.colors,
        image: product.image,
        description: product.description,
        deleted: product.deleted,
        liked: true,
      );
      likedProductsList.add(product);
      return product;
    } else if (product.liked == true) {
      likedProductsList.remove(product);
      product = Product(
        id: product.id,
        productName: product.productName,
        productType: product.productType,
        productSubtype: product.productSubtype,
        minSize: product.minSize,
        maxSize: product.maxSize,
        price: product.price,
        colors: product.colors,
        image: product.image,
        description: product.description,
        deleted: product.deleted,
        liked: false,
      );
      return product;
    }
    return product;
  }
}
