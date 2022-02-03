import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nbb/const.dart';
import 'package:nbb/models/productModel.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/brand_widgets/brandSelector.dart';
import 'package:nbb/widgets/brand_widgets/grids.dart';
import 'package:nbb/widgets/buyer.dart';
import 'package:nbb/widgets/shoe_cloth_widgets/modalBottomSheet.dart';
import 'package:provider/provider.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  List<String> likedProducts = [];

  @override
  void initState() {
    super.initState();
    likedProducts = Shared.getLikedProducts() ?? [];
  }

  bool? brand1 = true;
  bool? brand2 = false;
  bool? brand3 = false;
  bool? brand4 = false;
  bool? brand5 = false;
  bool? brand6 = false;
  bool? brand7 = false;
  bool? brand8 = false;
  bool? brand9 = false;
  bool? brand10 = false;
  bool? brand11 = false;
  bool? brand12 = false;

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
        BrandSelector(
          brand1Name: 'zara',
          brand1Color: brand1! ? Colors.white : greyColor,
          onTapForBrand1: () => setState(() {
            brand1 = true;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand2Name: 'mango',
          brand2Color: brand2! ? Colors.white : greyColor,
          onTapForBrand2: () => setState(() {
            brand1 = false;
            brand2 = true;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand3Name: 'bershka',
          brand3Color: brand3! ? Colors.white : greyColor,
          onTapForBrand3: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = true;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand4Name: 'kotton',
          brand4Color: brand4! ? Colors.white : greyColor,
          onTapForBrand4: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = true;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand5Name: 'stradivarius',
          brand5Color: brand5! ? Colors.white : greyColor,
          onTapForBrand5: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = true;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand6Name: 'H&M',
          brand6Color: brand6! ? Colors.white : greyColor,
          onTapForBrand6: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = true;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand7Name: 'nike',
          brand7Color: brand7! ? Colors.white : greyColor,
          onTapForBrand7: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = true;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand8Name: 'adidas',
          brand8Color: brand8! ? Colors.white : greyColor,
          onTapForBrand8: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = true;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand9Name: 'rebook',
          brand9Color: brand9! ? Colors.white : greyColor,
          onTapForBrand9: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = true;
            brand10 = false;
            brand11 = false;
            brand12 = false;
          }),
          brand10Name: 'new balance',
          brand10Color: brand10! ? Colors.white : greyColor,
          onTapForBrand10: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = true;
            brand11 = false;
            brand12 = false;
          }),
          brand11Name: 'LV',
          brand11Color: brand11! ? Colors.white : greyColor,
          onTapForBrand11: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = true;
            brand12 = false;
          }),
          brand12Name: 'GUCCI',
          brand12Color: brand12! ? Colors.white : greyColor,
          onTapForBrand12: () => setState(() {
            brand1 = false;
            brand2 = false;
            brand3 = false;
            brand4 = false;
            brand5 = false;
            brand6 = false;
            brand7 = false;
            brand8 = false;
            brand9 = false;
            brand10 = false;
            brand11 = false;
            brand12 = true;
          }),
        ),
        BrandGridView(
          future: Api.selectAllProducts(),
          builder: (context, snapshot) {
            List<Product> products = [];
            if (snapshot.hasData) {
              List<dynamic> getProducts = snapshot.data!;
              for (var product in getProducts) {
                Product newProduct = Product.fromJson(product);
                if (brand1! && newProduct.brand == 'zara') products.add(newProduct);
                if (brand2! && newProduct.brand == 'mango') products.add(newProduct);
                if (brand3! && newProduct.brand == 'bershka') products.add(newProduct);
                if (brand4! && newProduct.brand == 'kotton') products.add(newProduct);
                if (brand5! && newProduct.brand == 'stradivarius') products.add(newProduct);
                if (brand6! && newProduct.brand == 'H&M') products.add(newProduct);
                if (brand7! && newProduct.brand == 'nike') products.add(newProduct);
                if (brand8! && newProduct.brand == 'adidas') products.add(newProduct);
                if (brand9! && newProduct.brand == 'rebook') products.add(newProduct);
                if (brand10! && newProduct.brand == 'new balance') products.add(newProduct);
                if (brand11! && newProduct.brand == 'LV') products.add(newProduct);
                if (brand12! && newProduct.brand == 'GUCCI') products.add(newProduct);
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
                  return BrandGrid(
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
                            }
                            if (products[index].liked == true) {
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
                                await Api.buy(receiverName, receiverPhone, receiverAddress, receiverPostalCode,
                                    userDescription, products[index], '$size', color!);
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
