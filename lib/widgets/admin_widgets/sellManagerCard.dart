import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nbb/models/sellsModel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const.dart';

class SellsManagerCard extends StatelessWidget {
  const SellsManagerCard({Key? key, required this.sell, this.checker1, this.checker2, this.checker3, this.archiver})
      : super(key: key);
  final Sells sell;
  final void Function(bool?)? checker1;
  final void Function(bool?)? checker2;
  final void Function(bool?)? checker3;
  final void Function()? archiver;

  getColorName() {
    if (sell.productColor == 'black') return 'مشکی';
    if (sell.productColor == 'maroon') return 'زرشکی';
    if (sell.productColor == 'candyApple') return 'قرمز';
    if (sell.productColor == 'orange') return 'نارنجی';
    if (sell.productColor == 'pink') return 'صورتی';
    if (sell.productColor == 'green') return 'سبز';
    if (sell.productColor == 'navy') return 'سرمه‌ای';
    if (sell.productColor == 'blue') return 'آبی';
    if (sell.productColor == 'babyBlue') return 'آبی آسمانی';
    if (sell.productColor == 'white') return 'سفید';
    if (sell.productColor == 'brown') return 'قهوه‌ای';
    if (sell.productColor == 'cream') return 'کرمی';
    if (sell.productColor == 'yellow') return 'زرد';
  }

  getColor() {
    if (sell.productColor == 'black') return Colors.black87;
    if (sell.productColor == 'maroon') return const Color(0xff800000);
    if (sell.productColor == 'candyApple') return const Color(0xffff0800);
    if (sell.productColor == 'orange') return Colors.deepOrange;
    if (sell.productColor == 'pink') return Colors.pink[200];
    if (sell.productColor == 'green') return Colors.green;
    if (sell.productColor == 'navy') return const Color(0xff000080);
    if (sell.productColor == 'blue') return Colors.blue;
    if (sell.productColor == 'babyBlue') return const Color(0xff89cfef);
    if (sell.productColor == 'white') return Colors.white60;
    if (sell.productColor == 'brown') return Colors.brown[700];
    if (sell.productColor == 'cream') return const Color(0xff997950);
    if (sell.productColor == 'yellow') return const Color(0xfffce205);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                scrollable: true,
                contentPadding: const EdgeInsets.all(20),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 160,
                              child: Text(
                                sell.receiverName!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: blackColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  sell.receiverPhone!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                var url = 'tel:${sell.receiverPhone}';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                            SizedBox(
                              width: 125,
                              child: Text(
                                sell.productName!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CachedNetworkImage(
                          imageUrl: '$imageURL/${sell.productImage}',
                          imageBuilder: (context, imageProvider) => Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: imageProvider,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          placeholder: (_, __) => const Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(color: blackColor),
                            ),
                          ),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(8.0),
                        //   child: Image.network(
                        //     '$imageURL/${sell.productImage}',
                        //     width: 100,
                        //     height: 100,
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            sell.productType!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            '${sell.productSize}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            getColorName(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            sell.productSubtype!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            '${sell.productBrand}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Card(
                              shape: const CircleBorder(),
                              color: getColor()!,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Receiver Address',
                          style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Card(
                            elevation: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(
                                width: 1,
                                color: blackColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Text(
                                  sell.receiverAddress!,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Postal Code',
                          style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Card(
                            elevation: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(
                                width: 1,
                                color: blackColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Text(
                                  sell.receiverPostalCode!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Client Description',
                          style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Card(
                            elevation: 0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(
                                width: 1,
                                color: blackColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Text(
                                  sell.userDescription!,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                sell.userName!,
                                style: const TextStyle(
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                sell.userPhone!,
                                style: const TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: '$imageURL/${sell.productImage}',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  placeholder: (_, __) => const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(color: blackColor),
                    ),
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8.0),
                //   child: Image.network(
                //     '$imageURL/${sell.productImage}',
                //     width: 100,
                //     height: 100,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      sell.receiverName!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        sell.receiverPhone!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onTap: () async {
                        String url = 'tel:${sell.receiverPhone!}';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Checkbox(
                      value: sell.check1 == 0 ? false : true,
                      activeColor: blackColor,
                      onChanged: checker1,
                    ),
                    Checkbox(
                      value: sell.check2 == 0 ? false : true,
                      activeColor: blackColor,
                      onChanged: checker2,
                    ),
                    Checkbox(
                      value: sell.check3 == 0 ? false : true,
                      activeColor: blackColor,
                      onChanged: checker3,
                    ),
                    Visibility(
                      visible: sell.check1 == 1 && sell.check2 == 1 && sell.check3 == 1,
                      child: GestureDetector(
                        onTap: archiver,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'archive',
                            style: TextStyle(
                              color: sell.archived == 0 ? Colors.grey : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
