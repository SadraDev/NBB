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

//todo add : buy => edit database to name address number code-posti tozihat(درخواست های اضافی)
//todo save user info in shared
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
                        brand: products[index].brand,
                        homeProduct: products[index].homeProduct,
                        liked: true,
                      );
                    }
                  });
                }
                var newHolder = MainRowProductsContainer(
                  productName: products[index].productName,
                  productSubtype: products[index].productSubtype,
                  brand: products[index].brand,
                  price: products[index].price,
                  image: products[index].image,
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
                      name: products[index].productName,
                      brand: products[index].brand,
                      subtype: products[index].productSubtype,
                      image: products[index].image,
                      price: products[index].price,
                      minSize: products[index].minSize,
                      maxSize: products[index].maxSize,
                      description: products[index].description,
                      isShoe: products[index].productType == 'Shoe',
                      colors: products[index].colors,
                      onBuy: () {},
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
              for (int index = 0; index < bottomProducts.length; index++) {
                var newBottomProduct = BottomRowProductsContainer(
                  image: bottomProducts[index].image,
                  modalBuilder: (context) {
                    return ModalBottomSheetForShoeAndCloth(
                      name: products[index].productName,
                      brand: products[index].brand,
                      subtype: products[index].productSubtype,
                      image: products[index].image,
                      price: products[index].price,
                      minSize: products[index].minSize,
                      maxSize: products[index].maxSize,
                      description: products[index].description,
                      isShoe: products[index].productType == 'Shoe',
                      colors: products[index].colors,
                      onBuy: () {},
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
