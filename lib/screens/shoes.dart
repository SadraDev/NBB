import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/grids.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/subTypeSelector.dart';
import 'package:provider/provider.dart';

class ShoeScreen extends StatefulWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  List<String> likedProducts = [];

  @override
  void initState() {
    super.initState();
    likedProducts = Shared.getLikedProducts() ?? [];
  }

  bool? subType1 = true;
  bool? subType2 = false;
  bool? subType3 = false;
  bool? subType4 = false;
  bool? subType5 = false;

  @override
  Widget build(BuildContext context) {
    OnLiked onLikedProvider = Provider.of<OnLiked>(context, listen: false);
    onLikedProvider.likedProductsListId = likedProducts;
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
          }),
          subtype2Name: '12 cm',
          subtype2Color: subType2! ? Colors.white : greyColor,
          onTapForSubtype2: () => setState(() {
            subType1 = false;
            subType2 = true;
            subType3 = false;
            subType4 = false;
            subType5 = false;
          }),
          subtype3Name: 'sport',
          subtype3Color: subType3! ? Colors.white : greyColor,
          onTapForSubtype3: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = true;
            subType4 = false;
            subType5 = false;
          }),
          subtype4Name: 'High-Heels',
          subtype4Color: subType4! ? Colors.white : greyColor,
          onTapForSubtype4: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = true;
            subType5 = false;
          }),
          subtype5Name: 'boots',
          subtype5Color: subType5! ? Colors.white : greyColor,
          onTapForSubtype5: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = true;
          }),
        ),
        ShoeAndClothGridView(
          future: Api.selectAllProductsByType('shoe'),
          builder: (context, snapshot) {
            List<Product> products = [];
            if (snapshot.hasData) {
              List<dynamic> getProducts = snapshot.data!;
              for (var product in getProducts) {
                Product newProduct = Product.fromJson(product);

                if (subType1! && newProduct.productSubtype == '10 cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType2! && newProduct.productSubtype == '12 cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType3! && newProduct.productSubtype == 'sport') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType4! && newProduct.productSubtype == 'highHeels') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType5! && newProduct.productSubtype == 'boots') {
                  if (product[10] != 1) products.add(newProduct);
                }
              }
              return StaggeredGridView.countBuilder(
                padding: const EdgeInsets.only(bottom: 90, top: 30),
                shrinkWrap: true,
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
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
                  return ShoeAndClothGrid(
                    name: products[index].productName,
                    image: products[index].image,
                    price: products[index].price,
                    liked: products[index].liked,
                    onLiked: () {
                      Product newProduct = onLikedProvider.onLiked(products[index]);
                      setState(() => products[index] = newProduct);
                    },
                    onDelete: () {
                      setState(() async => await Api.delete(products[index]));
                      Navigator.pop(context);
                    },
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
                        colors: products[index].colors,
                        onBuy: () {},
                      );
                    },
                  );
                },
              );
            }
            if (!snapshot.hasData) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: const Center(child: CircularProgressIndicator(color: blackColor)),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('something went wrong!'));
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
