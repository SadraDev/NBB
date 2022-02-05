import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nbb/models/sellsModel.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const.dart';

class ArchivesView extends StatelessWidget {
  const ArchivesView({Key? key, this.onRefresh, required this.builder}) : super(key: key);
  final Future<void> Function()? onRefresh;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: blackColor,
        strokeWidth: 2,
        onRefresh: onRefresh!,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Builder(
            builder: builder,
          ),
        ),
      ),
    );
  }
}

class ArchiveViewHolderCard extends StatelessWidget {
  const ArchiveViewHolderCard({Key? key, required this.archive, this.onTap}) : super(key: key);
  final Sells archive;
  final void Function()? onTap;

  getColorName() {
    if (archive.productColor == 'black') return 'مشکی';
    if (archive.productColor == 'maroon') return 'زرشکی';
    if (archive.productColor == 'candyApple') return 'قرمز';
    if (archive.productColor == 'orange') return 'نارنجی';
    if (archive.productColor == 'pink') return 'صورتی';
    if (archive.productColor == 'green') return 'سبز';
    if (archive.productColor == 'navy') return 'سرمه‌ای';
    if (archive.productColor == 'blue') return 'آبی';
    if (archive.productColor == 'babyBlue') return 'آبی آسمانی';
    if (archive.productColor == 'white') return 'سفید';
    if (archive.productColor == 'brown') return 'قهوه‌ای';
    if (archive.productColor == 'cream') return 'کرمی';
    if (archive.productColor == 'yellow') return 'زرد';
  }

  getColor() {
    if (archive.productColor == 'black') return Colors.black87;
    if (archive.productColor == 'maroon') return const Color(0xff800000);
    if (archive.productColor == 'candyApple') return const Color(0xffff0800);
    if (archive.productColor == 'orange') return Colors.deepOrange;
    if (archive.productColor == 'pink') return Colors.pink[200];
    if (archive.productColor == 'green') return Colors.green;
    if (archive.productColor == 'navy') return const Color(0xff000080);
    if (archive.productColor == 'blue') return Colors.blue;
    if (archive.productColor == 'babyBlue') return const Color(0xff89cfef);
    if (archive.productColor == 'white') return Colors.white60;
    if (archive.productColor == 'brown') return Colors.brown[700];
    if (archive.productColor == 'cream') return const Color(0xff997950);
    if (archive.productColor == 'yellow') return const Color(0xfffce205);
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
                                archive.receiverName!,
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
                                  archive.receiverPhone!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                var url = 'tel:${archive.receiverPhone}';
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
                                archive.productName!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CachedNetworkImage(
                          imageUrl: '$imageURL/${archive.productImage}',
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
                        //     '$imageURL/${archive.productImage}',
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
                            archive.productType!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            '${archive.productSize}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              getColorName(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: blackColor,
                              ),
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
                            archive.productSubtype!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            '${archive.productBrand}',
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
                                  archive.receiverAddress!,
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
                                  archive.receiverPostalCode!,
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
                                  archive.userDescription!,
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
                                archive.userName!,
                                style: const TextStyle(
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                archive.userPhone!,
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
                  imageUrl: '$imageURL/${archive.productImage}',
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
                //     '$imageURL/${archive.productImage}',
                //     width: 100,
                //     height: 100,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      archive.receiverName!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        archive.receiverPhone!,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onTap: () async {
                        String url = 'tel:${archive.receiverPhone!}';
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
                    GestureDetector(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'archive',
                          style: TextStyle(
                            color: archive.archived == 0 ? Colors.grey : Colors.black,
                            fontSize: 16,
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
