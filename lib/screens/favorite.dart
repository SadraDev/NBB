import 'package:flutter/material.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/favorite_widgets/favoriteProductHolderBubble.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> products = [];
  List<String> likedProducts = [];

  Future<void> getProducts() async {
    List<dynamic> products = await Api.selectAllProducts();
    setState(() {
      for (var product in products) {
        Product newProduct = Product.fromJson(product);
        this.products.add(newProduct);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    //getLikedProductsList();
    likedProducts = Shared.getLikedProducts() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    OnLiked onLikedProvider = Provider.of<OnLiked>(context, listen: false);
    onLikedProvider.likedProductsListId = likedProducts;
    return Builder(
      builder: (context) {
        List<Widget> favorites = [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 35).copyWith(bottom: 20),
            child: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ];
        for (var favorite in products) {
          if (onLikedProvider.likedProductsListId!.isNotEmpty) {
            onLikedProvider.likedProductsListId!.forEach((element) {
              if (favorite.id.toString() == element) {
                favorite = Product(
                  id: favorite.id,
                  productName: favorite.productName,
                  productType: favorite.productType,
                  productSubtype: favorite.productSubtype,
                  minSize: favorite.minSize,
                  maxSize: favorite.maxSize,
                  price: favorite.price,
                  colors: favorite.colors,
                  image: favorite.image,
                  description: favorite.description,
                  deleted: favorite.deleted,
                  liked: true,
                );
              }
            });
          }
          if (favorite.liked == true) {
            var newFavorite = FavoriteProductHolderBubble(
              productName: favorite.productName,
              productPrice: favorite.price,
              image: favorite.image,
              liked: favorite.liked,
              onLiked: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('Are You Sure?'),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                      IconButton(
                        onPressed: () {
                          Product likedFav = onLikedProvider.onLiked(favorite);
                          setState(() => favorite = likedFav);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              onBuy: () {},
            );
            favorites.add(newFavorite);
          }
        }
        return ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: favorites,
        );
      },
    );
  }
}
