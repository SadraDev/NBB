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
    if (color == 'pink') return Colors.pink[600];
    if (color == 'blue') return Colors.blue;
    if (color == 'green') return Colors.green;
    if (color == 'red') return Colors.red;
    if (color == 'black') return Colors.black;
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
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image!),
                ),
              ),
            ),
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
