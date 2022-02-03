import 'package:flutter/material.dart';
import 'package:nbb/models/productModel.dart';
import '../../const.dart';

class FavoriteProductHolderBubble extends StatelessWidget {
  const FavoriteProductHolderBubble({
    Key? key,
    this.product,
    this.onLiked,
    this.onBuy,
  }) : super(key: key);
  final Product? product;
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
              offset: Offset(0, 10),
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
                  image: NetworkImage('$imageURL/${product!.image}'),
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
                      product!.productName!,
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
                          "${product!.price} T",
                          style: const TextStyle(
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                        IconButton(
                          onPressed: onLiked!,
                          icon: product!.liked!
                              ? const Icon(Icons.delete, color: blackColor)
                              : const Icon(Icons.favorite_outline_rounded),
                        ),
                        Card(
                          margin: EdgeInsets.zero,
                          color: blackColor,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
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
