import 'package:flutter/cupertino.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/shared.dart';

class OnLiked extends ChangeNotifier {
  List<String>? likedProductsListId = [];

  Product onLiked(Product product) {
    if (product.liked == false) {
      product.liked = true;
      likedProductsListId!.add(product.id.toString());
      Shared.setLikedProducts(likedProductsListId!);
    } else if (product.liked == true) {
      likedProductsListId!.remove(product.id.toString());
      Shared.setLikedProducts(likedProductsListId!);
      product.liked = false;
    }
    return product;
  }
}
