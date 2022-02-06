import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/buyer.dart';
import 'package:nbb/widgets/home_widgets/MainRowProducts.dart';
import 'package:nbb/widgets/home_widgets/bottomRowProducts.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

//todo implement search

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  List<Product> bottomProducts = [];
  List<String> likedProducts = [];

  Future<void> getProducts() async {
    this.products = [];
    bottomProducts = [];
    List<dynamic> products = await Api.selectAllProducts();
    setState(() {
      for (var product in products) {
        Product newProduct = Product.fromJson(product);
        if (product[6] == 1) this.products.add(newProduct);
        bottomProducts.add(newProduct);
      }
    });
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
    return RefreshIndicator(
      color: blackColor,
      strokeWidth: 2,
      onRefresh: getProducts,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 80),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 70, 35, 0),
            child: Text(
              'NBB',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          MainRowProducts(
            builder: (context) {
              List<Widget> productHolders = [];
              for (int index = 0; index < products.length; index++) {
                if (onLikedProvider.likedProductsListId!.isNotEmpty) {
                  onLikedProvider.likedProductsListId!.forEach((element) {
                    if (products[index].id.toString() == element) {
                      products[index].liked = true;
                    }
                  });
                }
                var newHolder = MainRowProductsContainer(
                  product: products[index],
                  onLiked: () {
                    Product newProduct = onLikedProvider.onLiked(products[index]);
                    setState(() => products[index] = newProduct);
                  },
                  onDelete: () {
                    setState(() async {
                      await Api.delete(products[index]);
                      getProducts();
                      Navigator.pop(context);
                    });
                  },
                  liked: products[index].liked,
                  colors: products[index].colors,
                  modalBuilder: (context) {
                    return ModalBottomSheetForShoeAndCloth(
                      product: products[index],
                      onLike: () {
                        if (products[index].liked == false) {
                          onLikedProvider.onLiked(products[index]);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              content: Text('added to cart.', textAlign: TextAlign.center),
                            ),
                          );
                        } else if (products[index].liked == true) {
                          onLikedProvider.onLiked(products[index]);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              content: Text('removed from cart.', textAlign: TextAlign.center),
                            ),
                          );
                        }
                        getProducts();
                      },
                      onBuy: () {
                        int? size =
                            GetSizeAndColor.getSize(products[index].productType == 'Shoe', products[index].minSize!);
                        String? color = GetSizeAndColor.getColor();
                        showDialog(
                          context: context,
                          builder: (context) => Buyer(
                            onDoneEditingReceiverName: (value) => receiverName = value,
                            onDoneEditingReceiverPhone: (value) => receiverPhone = value,
                            onDoneEditingReceiverAddress: (value) => receiverAddress = value,
                            onDoneEditingReceiverPostalCode: (value) => receiverPostalCode = value,
                            onDoneEditingComment: (value) => userDescription = value,
                            product: products[index],
                            color: color,
                            size: size,
                            formKey: formKey,
                            onBuy: () async {
                              if (formKey.currentState!.validate()) {
                                int sellId = await Api.buy(receiverName, receiverPhone, receiverAddress,
                                    receiverPostalCode, userDescription, products[index], '$size', color!);

                                String? price = '${products[index].price}0000';
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
                productHolders.add(newHolder);
              }
              if (products.isEmpty) {
                productHolders = [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.85,
                    child: const Center(child: CircularProgressIndicator(color: blackColor)),
                  )
                ];
              }
              return Row(
                children: productHolders,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Latest products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Text(
                      'see all',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(EvaIcons.arrowIosForwardOutline),
                  ],
                ),
              ],
            ),
          ),
          BottomRowProducts(
            builder: (context) {
              List<Widget> bottomProductHolders = [];
              for (int index = 0; index < bottomProducts.length; index++) {
                var newBottomProduct = BottomRowProductsContainer(
                  image: bottomProducts[index].image,
                  modalBuilder: (context) {
                    return ModalBottomSheetForShoeAndCloth(
                      product: products[index],
                      onLike: () {
                        if (products[index].liked == false) {
                          onLikedProvider.onLiked(products[index]);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              content: Text('added to cart.', textAlign: TextAlign.center),
                            ),
                          );
                        } else if (products[index].liked == true) {
                          onLikedProvider.onLiked(products[index]);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              content: Text('removed from cart.', textAlign: TextAlign.center),
                            ),
                          );
                        }
                        getProducts();
                      },
                      onBuy: () {
                        int? size =
                            GetSizeAndColor.getSize(products[index].productType == 'Shoe', products[index].minSize!);
                        String? color = GetSizeAndColor.getColor();
                        showDialog(
                          context: context,
                          builder: (context) => Buyer(
                            onDoneEditingReceiverName: (value) => receiverName = value,
                            onDoneEditingReceiverPhone: (value) => receiverPhone = value,
                            onDoneEditingReceiverAddress: (value) => receiverAddress = value,
                            onDoneEditingReceiverPostalCode: (value) => receiverPostalCode = value,
                            onDoneEditingComment: (value) => userDescription = value,
                            product: products[index],
                            color: color,
                            size: size,
                            formKey: formKey,
                            onBuy: () async {
                              if (formKey.currentState!.validate()) {
                                int sellId = await Api.buy(receiverName, receiverPhone, receiverAddress,
                                    receiverPostalCode, userDescription, products[index], '$size', color!);

                                String? price = '${products[index].price}0000';
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
                if (bottomProductHolders.length < 10) bottomProductHolders.add(newBottomProduct);
              }
              if (bottomProducts.isEmpty) {
                bottomProductHolders = [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: const Center(child: CircularProgressIndicator(color: blackColor)),
                  )
                ];
              }
              return Row(
                children: bottomProductHolders,
              );
            },
          ),
        ],
      ),
    );
  }
}
