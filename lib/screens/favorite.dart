import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/buyer.dart';
import 'package:nbb/widgets/favorite_widgets/favoriteBuyAll.dart';
import 'package:nbb/widgets/favorite_widgets/favoriteProductHolderBubble.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../const.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> products = [];
  List<String> likedProducts = [];
  bool? loading;

  Future<void> getProducts() async {
    loading = true;
    List<dynamic> products = await Api.selectAllProducts();
    setState(() {
      for (var product in products) {
        Product newProduct = Product.fromJson(product);
        if (product[10] != 1) this.products.add(newProduct);
      }
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    likedProducts = Shared.getLikedProducts() ?? [];
  }

  String receiverName = '';
  String receiverPhone = '';
  String receiverAddress = '';
  String receiverPostalCode = '';
  String userDescription = '';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    OnLiked onLikedProvider = Provider.of<OnLiked>(context, listen: false);
    onLikedProvider.likedProductsListId = likedProducts;
    return Builder(
      builder: (context) {
        List<Widget> favorites = [
          Row(
            children: [
              FavoriteHeader('Shopping Cart', buyAll: () {}),
              FavoriteHeader('buy all', buyAll: () {}),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator(color: blackColor)),
          ),
        ];
        if (!loading!) favorites.removeAt(1);
        for (var favorite in products) {
          if (onLikedProvider.likedProductsListId!.isNotEmpty) {
            onLikedProvider.likedProductsListId!.forEach((element) {
              if (favorite.id.toString() == element) {
                favorite.liked = true;
              }
            });
          }
          if (favorite.liked == true) {
            var newFavorite = FavoriteProductHolderBubble(
              product: favorite,
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
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              onBuy: () {
                showMaterialModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return ModalBottomSheetForShoeAndCloth(
                      product: favorite,
                      onLike: () {
                        setState(() {
                          if (favorite.liked == false) {
                            onLikedProvider.onLiked(favorite);
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text('added to cart.', textAlign: TextAlign.center),
                              ),
                            );
                          } else if (favorite.liked == true) {
                            onLikedProvider.onLiked(favorite);
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text('removed from cart.', textAlign: TextAlign.center),
                              ),
                            );
                          }
                        });
                      },
                      onBuy: () {
                        int? size = GetSizeAndColor.getSize(favorite.productType == 'Shoe', favorite.minSize!);
                        String? color = GetSizeAndColor.getColor();
                        showDialog(
                          context: context,
                          builder: (context) => Buyer(
                            onDoneEditingReceiverName: (value) => receiverName = value,
                            onDoneEditingReceiverPhone: (value) => receiverPhone = value,
                            onDoneEditingReceiverAddress: (value) => receiverAddress = value,
                            onDoneEditingReceiverPostalCode: (value) => receiverPostalCode = value,
                            onDoneEditingComment: (value) => userDescription = value,
                            product: favorite,
                            color: color,
                            size: size,
                            formKey: formKey,
                            onBuy: () async {
                              if (formKey.currentState!.validate()) {
                                int sellId = await Api.buy(receiverName, receiverPhone, receiverAddress,
                                    receiverPostalCode, userDescription, favorite, '$size', color!);

                                String? price = '${favorite.price}0000';
                                String? url = 'https://phloxco.ir/test/view/buy.php?price=$price&sellId=$sellId';

                                if (await canLaunch(url) && sellId != -1) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
            favorites.add(newFavorite);
          }
        }
        return ListView(
          padding: const EdgeInsets.only(bottom: 90),
          physics: const BouncingScrollPhysics(),
          children: favorites,
        );
      },
    );
  }
}
