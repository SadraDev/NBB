import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

bool black = false;
bool maroon = false;
bool candyApple = false;
bool red = false;
bool pink = false;
bool green = false;
bool navy = false;
bool blue = false;
bool babyBlue = false;
bool white = false;
bool brown = false;
bool cream = false;
bool yellow = false;

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
    this.colors,
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
  final Map<String, dynamic>? colors;
  final bool? isShoe;
  final int? minSize;
  final int? maxSize;

  @override
  State<ModalBottomSheetForShoeAndCloth> createState() => _ModalBottomSheetForShoeAndClothState();
}

class _ModalBottomSheetForShoeAndClothState extends State<ModalBottomSheetForShoeAndCloth> {
  getColorsLength() {
    int length = 0;
    if (widget.colors!['black'] == true) length++;
    if (widget.colors!['maroon'] == true) length++;
    if (widget.colors!['candyApple'] == true) length++;
    if (widget.colors!['red'] == true) length++;
    if (widget.colors!['pink'] == true) length++;
    if (widget.colors!['green'] == true) length++;
    if (widget.colors!['navy'] == true) length++;
    if (widget.colors!['blue'] == true) length++;
    if (widget.colors!['babyBlue'] == true) length++;
    if (widget.colors!['white'] == true) length++;
    if (widget.colors!['brown'] == true) length++;
    if (widget.colors!['cream'] == true) length++;
    if (widget.colors!['yellow'] == true) length++;
    return length;
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
                    image: NetworkImage('$imageURL/${widget.image}'),
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
                getColorsLength() > 4
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'select a color : ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: widget.colors!['black'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.black87,
                                    child: InkWell(
                                      child: black
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = true;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['maroon'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xff800000),
                                    child: InkWell(
                                      child: maroon
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = true;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['candyApple'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xffff0800),
                                    child: InkWell(
                                      child: candyApple
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = true;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['red'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.red,
                                    child: InkWell(
                                      child: red
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = true;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['pink'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.pink[600],
                                    child: InkWell(
                                      child: pink
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = true;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: widget.colors!['green'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.green,
                                    child: InkWell(
                                      child: green
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = true;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['navy'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xff000080),
                                    child: InkWell(
                                      child: navy
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = true;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['blue'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.blue,
                                    child: InkWell(
                                      child: blue
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = true;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['babyBlue'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xff89cfef),
                                    child: InkWell(
                                      child: babyBlue
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = true;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['white'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.white60,
                                    child: InkWell(
                                      child: white
                                          ? const Icon(Icons.check, color: Colors.black, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = true;
                                        brown = false;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: widget.colors!['brown'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: Colors.brown[700],
                                    child: InkWell(
                                      child: brown
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = true;
                                        cream = false;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['cream'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xff997950),
                                    child: InkWell(
                                      child: cream
                                          ? const Icon(Icons.check, color: Colors.white, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = true;
                                        yellow = false;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.colors!['yellow'] ?? false,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const CircleBorder(),
                                    color: const Color(0xfffce205),
                                    child: InkWell(
                                      child: yellow
                                          ? const Icon(Icons.check, color: Colors.black, size: 10)
                                          : Container(),
                                      onTap: () => setState(() {
                                        black = false;
                                        maroon = false;
                                        candyApple = false;
                                        red = false;
                                        pink = false;
                                        green = false;
                                        navy = false;
                                        blue = false;
                                        babyBlue = false;
                                        white = false;
                                        brown = false;
                                        cream = false;
                                        yellow = true;
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Row(
                        children: [
                          const Text(
                            'select a color : ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['black'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.black87,
                                child: InkWell(
                                  child: black
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = true;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['maroon'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xff800000),
                                child: InkWell(
                                  child: maroon
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = true;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['candyApple'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xffff0800),
                                child: InkWell(
                                  child: candyApple
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = true;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['red'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.red,
                                child: InkWell(
                                  child: red
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = true;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['pink'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.pink[600],
                                child: InkWell(
                                  child: pink
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = true;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['green'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.green,
                                child: InkWell(
                                  child: green
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = true;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['navy'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xff000080),
                                child: InkWell(
                                  child: navy
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = true;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['blue'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.blue,
                                child: InkWell(
                                  child: blue
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = true;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['babyBlue'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xff89cfef),
                                child: InkWell(
                                  child: babyBlue
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = true;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['white'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.white60,
                                child: InkWell(
                                  child: white
                                      ? const Icon(Icons.check, color: Colors.black, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = true;
                                    brown = false;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['brown'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: Colors.brown[700],
                                child: InkWell(
                                  child: brown
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = true;
                                    cream = false;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['cream'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xff997950),
                                child: InkWell(
                                  child: cream
                                      ? const Icon(Icons.check, color: Colors.white, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = true;
                                    yellow = false;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.colors!['yellow'] ?? false,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const CircleBorder(),
                                color: const Color(0xfffce205),
                                child: InkWell(
                                  child: yellow
                                      ? const Icon(Icons.check, color: Colors.black, size: 10)
                                      : Container(),
                                  onTap: () => setState(() {
                                    black = false;
                                    maroon = false;
                                    candyApple = false;
                                    red = false;
                                    pink = false;
                                    green = false;
                                    navy = false;
                                    blue = false;
                                    babyBlue = false;
                                    white = false;
                                    brown = false;
                                    cream = false;
                                    yellow = true;
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
    if (black) return 'black';
    if (maroon) return 'maroon';
    if (candyApple) return 'candyApple';
    if (red) return 'red';
    if (pink) return 'pink';
    if (green) return 'green';
    if (navy) return 'navy';
    if (blue) return 'blue';
    if (babyBlue) return 'babyBlue';
    if (white) return 'white';
    if (brown) return 'brown';
    if (cream) return 'cream';
    if (yellow) return 'yellow';
  }
}
