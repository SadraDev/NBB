import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

bool pinkSelector = false;
bool blueSelector = false;
bool redSelector = false;
bool greenSelector = false;
bool blackSelector = false;
int selectedSize = -1;

class ModalBottomSheetForShoeAndCloth extends StatefulWidget {
  const ModalBottomSheetForShoeAndCloth({
    Key? key,
    this.name,
    this.image,
    this.price,
    this.subtype,
    this.description,
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
  State<ModalBottomSheetForShoeAndCloth> createState() => _ModalBottomSheetForShoeAndClothState();
}

class _ModalBottomSheetForShoeAndClothState extends State<ModalBottomSheetForShoeAndCloth> {
  oneLineOrTowLines() {
    if (widget.red! && widget.blue! && widget.green! && widget.pink! && widget.black!) return true;
    if (widget.blue! && widget.green! && widget.pink! && widget.black!) return true;
    if (widget.red! && widget.green! && widget.pink! && widget.black!) return true;
    if (widget.red! && widget.blue! && widget.pink! && widget.black!) return true;
    if (widget.red! && widget.blue! && widget.green! && widget.black!) return true;
    if (widget.red! && widget.blue! && widget.green! && widget.pink!) return true;
    return false;
  }

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
                    image: NetworkImage(widget.image!),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50).copyWith(bottom: 0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    EvaIcons.close,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20).copyWith(bottom: 0),
            child: Text(
              widget.name!,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.subtype!,
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
                  "${widget.price!} T",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                oneLineOrTowLines()
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'select a color : ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Visibility(
                                visible: widget.pink!,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.pink[600],
                                    child: InkWell(
                                      child: pinkSelector
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        pinkSelector = true;
                                        blueSelector = false;
                                        greenSelector = false;
                                        redSelector = false;
                                        blackSelector = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.blue!,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.blue,
                                    child: InkWell(
                                      child: blueSelector
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        pinkSelector = false;
                                        blueSelector = true;
                                        greenSelector = false;
                                        redSelector = false;
                                        blackSelector = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.green!,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.green,
                                    child: InkWell(
                                      child: greenSelector
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        pinkSelector = false;
                                        blueSelector = false;
                                        greenSelector = true;
                                        redSelector = false;
                                        blackSelector = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.red!,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.red,
                                    child: InkWell(
                                      child: redSelector
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        pinkSelector = false;
                                        blueSelector = false;
                                        greenSelector = false;
                                        redSelector = true;
                                        blackSelector = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.black!,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.black87,
                                    child: InkWell(
                                      child: blackSelector
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        pinkSelector = false;
                                        blueSelector = false;
                                        greenSelector = false;
                                        redSelector = false;
                                        blackSelector = true;
                                      }),
                                    ),
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
                            'select a color : ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Visibility(
                            visible: widget.pink!,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.pink[600],
                                child: InkWell(
                                  child: pinkSelector
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    pinkSelector = true;
                                    blueSelector = false;
                                    greenSelector = false;
                                    redSelector = false;
                                    blackSelector = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.blue!,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.blue,
                                child: InkWell(
                                  child: blueSelector
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    pinkSelector = false;
                                    blueSelector = true;
                                    greenSelector = false;
                                    redSelector = false;
                                    blackSelector = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.green!,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: const CircleBorder(),
                                  color: Colors.green,
                                  child: InkWell(
                                    child: greenSelector
                                        ? const Icon(Icons.check, color: Colors.white, size: 10)
                                        : Container(),
                                    onTap: () => setState(() {
                                      pinkSelector = false;
                                      blueSelector = false;
                                      greenSelector = true;
                                      redSelector = false;
                                      blackSelector = false;
                                    }),
                                  )),
                            ),
                          ),
                          Visibility(
                            visible: widget.red!,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: const CircleBorder(),
                                  color: Colors.red,
                                  child: InkWell(
                                    child: redSelector
                                        ? const Icon(Icons.check, color: Colors.white, size: 10)
                                        : Container(),
                                    onTap: () => setState(() {
                                      pinkSelector = false;
                                      blueSelector = false;
                                      greenSelector = false;
                                      redSelector = true;
                                      blackSelector = false;
                                    }),
                                  )),
                            ),
                          ),
                          Visibility(
                            visible: widget.black!,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.black87,
                                child: InkWell(
                                  child: blackSelector
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    pinkSelector = false;
                                    blueSelector = false;
                                    greenSelector = false;
                                    redSelector = false;
                                    blackSelector = true;
                                  }),
                                ),
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
              if (widget.isShoe!) {
                var length = widget.maxSize! - widget.minSize! + 1;
                for (int i = 0; i < length; i++) {
                  var newSize = SizedBox(
                    height: 55,
                    width: 55,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      shape: const CircleBorder(side: BorderSide(color: blackColor, width: 1)),
                      child: InkWell(
                        child: Center(child: Text('${widget.minSize! + i}')),
                        onTap: () {
                          setState(() {
                            selectedSize = i;
                          });
                        },
                      ),
                    ),
                  );
                  if (selectedSize != i) sizes.add(newSize);
                  if (selectedSize == i) {
                    sizes.add(SizedBox(
                      height: 55,
                      width: 55,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.black,
                        shape: const CircleBorder(side: BorderSide(color: whiteColor, width: 1)),
                        child: InkWell(
                          child: Center(
                            child: Text(
                              '${widget.minSize! + i}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ));
                  }
                }
              } else {
                var length = (widget.maxSize! - widget.minSize! + 1) / 2;
                for (int i = 0; i < length; i++) {
                  var newSize = SizedBox(
                    height: 55,
                    width: 55,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      shape: const CircleBorder(side: BorderSide(color: blackColor, width: 1)),
                      child: InkWell(
                        child: Center(child: Text('${widget.minSize! + 2 * i}')),
                        onTap: () {
                          setState(() {
                            selectedSize = i;
                          });
                        },
                      ),
                    ),
                  );
                  if (selectedSize != i) sizes.add(newSize);
                  if (selectedSize == i) {
                    sizes.add(SizedBox(
                      height: 55,
                      width: 55,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.black,
                        shape: const CircleBorder(side: BorderSide(color: whiteColor, width: 1)),
                        child: InkWell(
                          child: Center(
                            child: Text(
                              '${widget.minSize! + 2 * i}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ));
                  }
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
              widget.description!,
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
                onTap: widget.onBuy,
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

class GetSizeAndColor {
  static int? getSize(bool isShoe, int minSize) {
    if (isShoe) return selectedSize + minSize;
    if (!isShoe) return selectedSize * 2 + minSize;
  }

  static String? getColor() {
    if (pinkSelector) return 'pink';
    if (blueSelector) return 'blue';
    if (greenSelector) return 'green';
    if (redSelector) return 'red';
    if (blackSelector) return 'black';
  }
}
