import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/buyer.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/grids.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/subTypeSelector.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool? subType6 = false;
  bool? subType7 = false;
  bool? subType8 = false;
  bool? subType9 = false;

  String receiverName = '';
  String receiverPhone = '';
  String receiverAddress = '';
  String receiverPostalCode = '';
  String userDescription = '';

  @override
  Widget build(BuildContext context) {
    OnLiked onLikedProvider = Provider.of<OnLiked>(context, listen: false);
    onLikedProvider.likedProductsListId = likedProducts;
    return Column(
      children: <Widget>[
        SubTypeSelector(
          subtype1Name: 'all',
          subtype1Color: subType1! ? Colors.white : greyColor,
          onTapForSubtype1: () => setState(() {
            subType1 = true;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype2Name: '3cm',
          subtype2Color: subType2! ? Colors.white : greyColor,
          onTapForSubtype2: () => setState(() {
            subType1 = false;
            subType2 = true;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype3Name: '4cm',
          subtype3Color: subType3! ? Colors.white : greyColor,
          onTapForSubtype3: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = true;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype4Name: '5cm',
          subtype4Color: subType4! ? Colors.white : greyColor,
          onTapForSubtype4: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = true;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype5Name: '7cm',
          subtype5Color: subType5! ? Colors.white : greyColor,
          onTapForSubtype5: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = true;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype6Name: '9cm',
          subtype6Color: subType6! ? Colors.white : greyColor,
          onTapForSubtype6: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = true;
            subType7 = false;
            subType8 = false;
            subType9 = false;
          }),
          subtype7Name: '10cm',
          subtype7Color: subType7! ? Colors.white : greyColor,
          onTapForSubtype7: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = true;
            subType8 = false;
            subType9 = false;
          }),
          subtype8Name: '12cm',
          subtype8Color: subType8! ? Colors.white : greyColor,
          onTapForSubtype8: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = true;
            subType9 = false;
          }),
          subtype9Name: 'babet',
          subtype9Color: subType9! ? Colors.white : greyColor,
          onTapForSubtype9: () => setState(() {
            subType1 = false;
            subType2 = false;
            subType3 = false;
            subType4 = false;
            subType5 = false;
            subType6 = false;
            subType7 = false;
            subType8 = false;
            subType9 = true;
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
                if (subType1!) {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType2! && newProduct.productSubtype == '3cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType3! && newProduct.productSubtype == '4cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType4! && newProduct.productSubtype == '5cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType5! && newProduct.productSubtype == '7cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType6! && newProduct.productSubtype == '9cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType7! && newProduct.productSubtype == '10cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType8! && newProduct.productSubtype == '12cm') {
                  if (product[10] != 1) products.add(newProduct);
                }
                if (subType9! && newProduct.productSubtype == 'babet') {
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
                        products[index].liked = true;
                      }
                    });
                  }
                  return ShoeAndClothGrid(
                    product: products[index],
                    onLiked: () {
                      Product newProduct = onLikedProvider.onLiked(products[index]);
                      setState(() => products[index] = newProduct);
                    },
                    onDelete: () {
                      setState(() async {
                        await Api.delete(products[index]);
                        Navigator.pop(context);
                      });
                    },
                    modalBuilder: (context) {
                      return ModalBottomSheetForShoeAndCloth(
                        product: products[index],
                        onLike: () {
                          setState(() {
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
                          });
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
                              onBuy: () async {
                                int sellId = await Api.buy(receiverName, receiverPhone, receiverAddress,
                                    receiverPostalCode, userDescription, products[index], '$size', color!);

                                String? price = '${products[index].price}0000';
                                String? url = 'https://phloxco.ir/test/view/buy.php?price=$price&sellId=$sellId';

                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
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
