import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/widgets/home_widgets/MainRowProducts.dart';
import 'package:nbb/widgets/home_widgets/bottomRowProducts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  Future<void> getProducts() async {
    List<dynamic> products = await Api.selectAllProducts();
    for (var product in products) {
      Product newProduct = Product(
        productName: product[1],
        productType: product[2],
        productSubtype: product[3],
        minSize: product[4],
        maxSize: product[5],
        price: product[6],
        colors: jsonDecode(product[7]),
        image: product[8],
        description: product[9],
        deleted: product[10],
      );
      this.products.add(newProduct);
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: blackColor,
      strokeWidth: 2,
      onRefresh: getProducts,
      child: ListView(
        padding: EdgeInsets.zero,
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
                bool? pink = products[index].colors!['pink'];
                bool? blue = products[index].colors!['blue'];
                bool? green = products[index].colors!['green'];
                bool? red = products[index].colors!['red'];
                bool? black = products[index].colors!['black'];
                var newHolder = MainRowProductsContainer(
                  productName: products[index].productName,
                  productSubtype: products[index].productSubtype,
                  price: products[index].price,
                  image: products[index].image,
                  onLiked: () {},
                  onTap: () {},
                  pink: pink,
                  blue: blue,
                  green: green,
                  red: red,
                  black: black,
                );
                if (productHolders.length < 5) productHolders.add(newHolder);
              }
              if (products.isEmpty) {
                productHolders = [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.85,
                    child: const Center(child: Text('something went wrong')),
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
                    child: const Center(child: Text('something went wrong')),
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
