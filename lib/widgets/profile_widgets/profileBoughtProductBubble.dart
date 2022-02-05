import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

class ProfileScreenBoughtProductBubble extends StatelessWidget {
  const ProfileScreenBoughtProductBubble(
      {Key? key, this.productName, this.image, this.purchaseDate, this.price, this.color})
      : super(key: key);
  final String? productName;
  final String? image;
  final String? purchaseDate;
  final String? price;
  final String? color;

  Color? getColor() {
    if (color == 'black') return Colors.black;
    if (color == 'maroon') return const Color(0xff800000);
    if (color == 'candyApple') return const Color(0xffff0800);
    if (color == 'orange') return Colors.deepOrange;
    if (color == 'pink') return Colors.pink[200];
    if (color == 'green') return Colors.green;
    if (color == 'navy') return const Color(0xff000080);
    if (color == 'blue') return Colors.blue;
    if (color == 'babyBlue') return const Color(0xff89cfef);
    if (color == 'white') return Colors.white60;
    if (color == 'brown') return Colors.brown[700];
    if (color == 'cream') return const Color(0xff997950);
    if (color == 'yellow') return const Color(0xfffce205);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: '$imageURL/$image',
              imageBuilder: (context, imageProvider) => Container(
                height: 70,
                width: 70,
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
            //   borderRadius: BorderRadius.circular(12.0),
            //   child: Image.network(
            //     '$imageURL/$image',
            //     width: 70,
            //     height: 70,
            //     fit: BoxFit.fill,
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        color: blackColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          purchaseDate!.substring(1, 10),
                          style: const TextStyle(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Card(
                            shape: const CircleBorder(),
                            color: getColor(),
                          ),
                        ),
                        Text(
                          "$price T",
                          style: const TextStyle(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
