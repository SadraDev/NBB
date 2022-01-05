import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

bool active1 = true;
bool active2 = false;
bool active3 = false;
bool active4 = false;
bool active5 = false;

class ProductSubTypeSelector extends StatefulWidget {
  const ProductSubTypeSelector({
    Key? key,
    required this.subType1,
    required this.subType2,
    required this.subType3,
    required this.subType4,
    required this.subType5,
  }) : super(key: key);
  final String subType1;
  final String subType2;
  final String subType3;
  final String subType4;
  final String subType5;

  @override
  State<ProductSubTypeSelector> createState() => _ProductSubTypeSelectorState();
}

class _ProductSubTypeSelectorState extends State<ProductSubTypeSelector> {
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
        child: Wrap(
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.subType1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: active1 ? blackColor : Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  active1 = true;
                  active2 = false;
                  active3 = false;
                  active4 = false;
                  active5 = false;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.subType2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: active2 ? blackColor : Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  active1 = false;
                  active2 = true;
                  active3 = false;
                  active4 = false;
                  active5 = false;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.subType3,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: active3 ? blackColor : Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  active1 = false;
                  active2 = false;
                  active3 = true;
                  active4 = false;
                  active5 = false;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.subType4,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: active4 ? blackColor : Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  active1 = false;
                  active2 = false;
                  active3 = false;
                  active4 = true;
                  active5 = false;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.subType5,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: active5 ? blackColor : Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  active1 = false;
                  active2 = false;
                  active3 = false;
                  active4 = false;
                  active5 = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GetSubtype {
  static subtype() {
    if (active1 == true) return 'first';
    if (active2 == true) return 'second';
    if (active3 == true) return 'third';
    if (active4 == true) return 'forth';
    if (active5 == true) return 'fifth';
  }
}
