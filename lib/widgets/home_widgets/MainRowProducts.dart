import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

class MainRowProducts extends StatelessWidget {
  const MainRowProducts({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Builder(builder: builder),
      ),
    );
  }
}

class MainRowProductsContainer extends StatelessWidget {
  const MainRowProductsContainer({
    Key? key,
    this.onLiked,
    this.onTap,
    this.image,
    this.productName,
    this.productSubtype,
    this.price,
    this.pink,
    this.blue,
    this.green,
    this.red,
    this.black,
  }) : super(key: key);
  final void Function()? onLiked;
  final void Function()? onTap;
  final String? image;
  final String? productName;
  final String? productSubtype;
  final String? price;
  final bool? pink;
  final bool? blue;
  final bool? green;
  final bool? red;
  final bool? black;

  oneLineOrTowLines() {
    if (red! && blue! && green! && pink! && black!) return true;
    if (blue! && green! && pink! && black!) return true;
    if (red! && green! && pink! && black!) return true;
    if (red! && blue! && pink! && black!) return true;
    if (red! && blue! && green! && black!) return true;
    if (red! && blue! && green! && pink!) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: 4,
            offset: Offset(2, 15),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 50, left: 30, top: 50),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15).copyWith(bottom: 0),
              child: IconButton(
                onPressed: onLiked,
                icon: const Icon(Icons.favorite_border_rounded),
                alignment: Alignment.topRight,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '$imageURL/$image',
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(bottom: 0),
              child: Text(
                productName!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                productSubtype!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      price!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  oneLineOrTowLines()
                      ? Column(
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
                            Row(
                              children: <Widget>[
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
                        )
                      : Row(
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
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
