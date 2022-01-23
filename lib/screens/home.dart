import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/home_widgets/MainRowProducts.dart';
import 'package:nbb/widgets/home_widgets/bottomRowProducts.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  List<String> likedProducts = [];

  Future<void> getProducts() async {
    this.products = [];
    List<dynamic> products = await Api.selectAllProducts();
    setState(() {
      for (var product in products) {
        Product newProduct = Product.fromJson(product);
        if (product[10] != 1) this.products.add(newProduct);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    likedProducts = Shared.getLikedProducts() ?? [];
  }

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
                bool? pink = products[index].colors!['pink'] ?? false;
                bool? blue = products[index].colors!['blue'] ?? false;
                bool? green = products[index].colors!['green'] ?? false;
                bool? red = products[index].colors!['red'] ?? false;
                bool? black = products[index].colors!['black'] ?? false;
                if (onLikedProvider.likedProductsListId!.isNotEmpty) {
                  onLikedProvider.likedProductsListId!.forEach((element) {
                    if (products[index].id.toString() == element) {
                      products[index] = Product(
                        id: products[index].id,
                        productName: products[index].productName,
                        productType: products[index].productType,
                        productSubtype: products[index].productSubtype,
                        minSize: products[index].minSize,
                        maxSize: products[index].maxSize,
                        price: products[index].price,
                        colors: products[index].colors,
                        image: products[index].image,
                        description: products[index].description,
                        deleted: products[index].deleted,
                        liked: true,
                      );
                    }
                  });
                }
                var newHolder = MainRowProductsContainer(
                  productName: products[index].productName,
                  productSubtype: products[index].productSubtype,
                  price: products[index].price,
                  image: products[index].image,
                  onLiked: () {
                    Product newProduct = onLikedProvider.onLiked(products[index]);
                    setState(() => products[index] = newProduct);
                  },
                  onDelete: () async {
                    Navigator.pop(context);
                    await Api.delete(products[index]);
                    setState(() => getProducts());
                  },
                  liked: products[index].liked,
                  pink: pink,
                  blue: blue,
                  green: green,
                  red: red,
                  black: black,
                  modalBuilder: (context) {
                    return ModalBottomSheetForShoeAndCloth(
                      name: products[index].productName,
                      subtype: products[index].productSubtype,
                      image: products[index].image,
                      price: products[index].price,
                      minSize: products[index].minSize,
                      maxSize: products[index].maxSize,
                      description: products[index].description,
                      isShoe: products[index].productType == 'Shoe',
                      pink: pink,
                      blue: blue,
                      green: green,
                      red: red,
                      black: black,
                      onBuy: () {},
                    );
                  },
                );
                if (products[index].homeProduct == 1) productHolders.add(newHolder);
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
                GestureDetector(
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'show all',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(EvaIcons.arrowIosForwardOutline),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          BottomRowProducts(
            builder: (context) {
              List<Widget> bottomProductHolders = [];
              for (int index = 0; index < products.length; index++) {
                var newBottomProduct = BottomRowProductsContainer(
                  image: products[index].image,
                );
                if (products[index].productType == 'Shoe') {
                  if (bottomProductHolders.length < 10) bottomProductHolders.add(newBottomProduct);
                }
              }
              if (products.isEmpty) {
                bottomProductHolders = [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
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
