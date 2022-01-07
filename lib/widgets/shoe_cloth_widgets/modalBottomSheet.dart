import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

class ModalBottomSheetForShoeAndCloth extends StatelessWidget {
  const ModalBottomSheetForShoeAndCloth({
    Key? key,
    this.name,
    this.image,
    this.price,
    this.subtype,
    this.description,
    this.onLiked,
    this.onBuy,
    this.pink,
    this.blue,
    this.green,
    this.red,
    this.black,
    this.minSize,
    this.maxSize,
    this.isShoe,
  }) : super(key: key);
  final String? name;
  final String? image;
  final String? price;
  final String? subtype;
  final String? description;
  final void Function()? onLiked;
  final void Function()? onBuy;
  final bool? pink;
  final bool? blue;
  final bool? green;
  final bool? red;
  final bool? black;
  final bool? isShoe;
  final int? minSize;
  final int? maxSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(image!),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50)
                        .copyWith(bottom: 0),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        EvaIcons.close,
                        size: 30,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onLiked,
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20).copyWith(bottom: 0),
            child: Text(
              name!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              subtype!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  price!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'colors : ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Visibility(
                      visible: pink!,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          shape: const CircleBorder(),
                          color: Colors.pink[600],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: blue!,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          shape: CircleBorder(),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: green!,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          shape: CircleBorder(),
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: red!,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          shape: CircleBorder(),
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: black!,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                        child: Card(
                          shape: CircleBorder(),
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
            child: const Text(
              'Select a size',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 10),
            child: Builder(builder: (context) {
              List<SizedBox> sizes = [];
              if (isShoe!) {
                var length = maxSize! - minSize! + 1;
                for (int i = 0; i < length; i++) {
                  var newSize = SizedBox(
                    height: 55,
                    width: 55,
                    child: Card(
                      shape: const CircleBorder(side: BorderSide(color: blackColor, width: 1)),
                      child: Center(child: Text('${minSize! + i}')),
                    ),
                  );
                  sizes.add(newSize);
                }
              } else {
                var length = (maxSize! - minSize! + 1) / 2;
                for (int i = 0; i < length; i++) {
                  var newSize = SizedBox(
                    height: 55,
                    width: 55,
                    child: Card(
                      shape: const CircleBorder(side: BorderSide(color: blackColor, width: 1)),
                      child: Center(child: Text('${minSize! + 2 * i}')),
                    ),
                  );
                  sizes.add(newSize);
                }
              }
              return Wrap(
                children: sizes,
              );
            }),
          ),
          const Divider(indent: 20, endIndent: 20, color: greyColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).copyWith(top: 30),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.zero,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              color: blackColor,
              child: InkWell(
                onTap: onBuy,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Buy Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
