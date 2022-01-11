import 'package:flutter/material.dart';
import '../../const.dart';

class FavoriteProductHolderBubble extends StatelessWidget {
  const FavoriteProductHolderBubble({
    Key? key,
    this.productName,
    this.productPrice,
    this.image,
    this.liked,
    this.onLiked,
    this.onBuy,
  }) : super(key: key);
  final String? productName;
  final String? productPrice;
  final String? image;
  final bool? liked;
  final void Function()? onLiked;
  final void Function()? onBuy;

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
        child: Row(
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
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
                      children: [
                        Text(
                          productPrice!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: onLiked!,
                          icon: liked!
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_outline_rounded),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          color: blackColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                              child: Text(
                                'buy',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: onBuy!,
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
