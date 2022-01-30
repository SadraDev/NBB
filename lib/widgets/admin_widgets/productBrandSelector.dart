import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

bool active0 = true;
bool active1 = false;
bool active2 = false;
bool active3 = false;
bool active4 = false;
bool active5 = false;
bool active6 = false;
bool active7 = false;
bool active8 = false;
bool active9 = false;
bool active10 = false;
bool active11 = false;
bool active12 = false;

class ProductBrandSelector extends StatefulWidget {
  const ProductBrandSelector({
    Key? key,
    required this.brand1,
    required this.brand2,
    required this.brand3,
    required this.brand4,
    required this.brand5,
    required this.brand6,
    required this.brand7,
    required this.brand8,
    required this.brand9,
    required this.brand10,
    required this.brand11,
    required this.brand12,
  }) : super(key: key);
  final String brand1;
  final String brand2;
  final String brand3;
  final String brand4;
  final String brand5;
  final String brand6;
  final String brand7;
  final String brand8;
  final String brand9;
  final String brand10;
  final String brand11;
  final String brand12;

  @override
  State<ProductBrandSelector> createState() => _ProductBrandSelectorState();
}

class _ProductBrandSelectorState extends State<ProductBrandSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 30),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                        .copyWith(bottom: 0),
                    child: const Text(
                      'Brand',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                          .copyWith(bottom: 0),
                      child: Text(
                        'NOT_BRAND',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: active0 ? blackColor : Colors.grey,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        active0 = true;
                        active1 = false;
                        active2 = false;
                        active3 = false;
                        active4 = false;
                        active5 = false;
                        active6 = false;
                        active7 = false;
                        active8 = false;
                        active9 = false;
                        active10 = false;
                        active11 = false;
                        active12 = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Wrap(
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active1 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = true;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active2 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = true;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand3,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active3 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = true;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand4,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active4 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = true;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand5,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active5 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = true;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand6,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active6 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = true;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand7,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active7 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = true;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand8,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active8 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = true;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand9,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active9 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = true;
                      active10 = false;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand10,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active10 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = true;
                      active11 = false;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand11,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active11 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = true;
                      active12 = false;
                    });
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.brand12,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: active12 ? blackColor : Colors.grey,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      active0 = false;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                      active5 = false;
                      active6 = false;
                      active7 = false;
                      active8 = false;
                      active9 = false;
                      active10 = false;
                      active11 = false;
                      active12 = true;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GetBrand {
  static brand() {
    if (active0 == true) return 'NOT_BRAND';
    if (active1 == true) return 'first';
    if (active2 == true) return 'second';
    if (active3 == true) return 'third';
    if (active4 == true) return 'forth';
    if (active5 == true) return 'fifth';
    if (active6 == true) return 'sixth';
    if (active7 == true) return 'seventh';
    if (active8 == true) return 'eighth';
    if (active9 == true) return 'ninth';
    if (active10 == true) return 'tenth';
    if (active11 == true) return 'eleventh';
    if (active12 == true) return 'twelfth';
  }
}
