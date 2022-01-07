import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/grids.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/subTypeSelector.dart';

class ShoeScreen extends StatefulWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  List<Product> products = [];

  Future<void> getProducts() async {
    List<dynamic> products = await Api.selectAllProducts();
    setState(() {
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

        if (subType1! && newProduct.productSubtype == '10 cm') {
          this.products.add(newProduct);
        }
        if (subType2! && newProduct.productSubtype == '12 cm') {
          this.products.add(newProduct);
        }
        if (subType3! && newProduct.productSubtype == 'sport') {
          this.products.add(newProduct);
        }
        if (subType3! && newProduct.productSubtype == 'highHeels') {
          this.products.add(newProduct);
        }
        if (subType4! && newProduct.productSubtype == 'boots') {
          this.products.add(newProduct);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  bool? subType1 = true;
  bool? subType2 = false;
  bool? subType3 = false;
  bool? subType4 = false;
  bool? subType5 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SubTypeSelector(
          subtype1Name: '10 cm',
          subtype1Color: subType1! ? Colors.white : greyColor,
          onTapForSubtype1: () => setState(() {
            subType1 = true;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            products = [];
            getProducts();
          }),
          subtype2Name: '12 cm',
          subtype2Color: subType2! ? Colors.white : greyColor,
          onTapForSubtype2: () => setState(() {
            subType1 = false;
            subType2 = true;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            products = [];
            getProducts();
          }),
          subtype3Name: 'sport',
          subtype3Color: subType3! ? Colors.white : greyColor,
          onTapForSubtype3: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = true;
            subType4 = false;
            subType5 = false;
            products = [];
            getProducts();
          }),
          subtype4Name: 'High-Heels',
          subtype4Color: subType4! ? Colors.white : greyColor,
          onTapForSubtype4: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = true;
            subType5 = false;
            products = [];
            getProducts();
          }),
          subtype5Name: 'boots',
          subtype5Color: subType5! ? Colors.white : greyColor,
          onTapForSubtype5: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = true;
            products = [];
            getProducts();
          }),
        ),
        ShoeAndClothGridView(
          count: products.length,
          builder: (context, index) {
            bool? pink = products[index].colors!['pink'];
            bool? blue = products[index].colors!['blue'];
            bool? green = products[index].colors!['green'];
            bool? red = products[index].colors!['red'];
            bool? black = products[index].colors!['black'];
            if (products[index].productType == 'Shoe') {
              return ShoeAndClothGrid(
                name: products[index].productName,
                image: products[index].image,
                price: products[index].price,
                onLiked: () {},
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
                    onLiked: () {},
                    onBuy: () {},
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
