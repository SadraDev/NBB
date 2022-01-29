import 'package:flutter/cupertino.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/shared.dart';

class OnLiked extends ChangeNotifier {
  List<String>? likedProductsListId = [];

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
        brand: product.brand,
        liked: true,
      );
      likedProductsListId!.add(product.id.toString());
      Shared.setLikedProducts(likedProductsListId!);
      return product;
    } else if (product.liked == true) {
      likedProductsListId!.remove(product.id.toString());
      Shared.setLikedProducts(likedProductsListId!);
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
        brand: product.brand,
        liked: false,
      );
      return product;
    }
    return product;
  }
}
