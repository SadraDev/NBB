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

class ProductColorsSelector extends StatefulWidget {
  const ProductColorsSelector({
    Key? key,
  }) : super(key: key);

  @override
  _ProductColorsSelectorState createState() => _ProductColorsSelectorState();
}

class _ProductColorsSelectorState extends State<ProductColorsSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Colors',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
              child: Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                spacing: 8,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.black,
                        child: black ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => black = !black),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xff800000),
                        child: maroon ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => maroon = !maroon),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xffff0800),
                        child:
                            candyApple ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => candyApple = !candyApple),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.red,
                        child: red ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => red = !red),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.pink[600],
                        child: pink ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => pink = !pink),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.green,
                        child: green ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => green = !green),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xff000080),
                        child: navy ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => navy = !navy),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.blue,
                        child: blue ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => blue = !blue),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xff89cfef),
                        child:
                            babyBlue ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => babyBlue = !babyBlue),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.white60,
                        child: white ? const Icon(Icons.check, color: Colors.black) : Container(),
                      ),
                      onTap: () => setState(() => white = !white),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: Colors.brown[700],
                        child: brown ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => brown = !brown),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xff997950),
                        child: cream ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => cream = !cream),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: InkWell(
                      child: Card(
                        shape: const CircleBorder(),
                        color: const Color(0xfffce205),
                        child: yellow ? const Icon(Icons.check, color: Colors.black) : Container(),
                      ),
                      onTap: () => setState(() => yellow = !yellow),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetColors {
  static colors() {
    return {
      "black": black,
      "maroon": maroon,
      "candyApple": candyApple,
      "red": red,
      "pink": pink,
      "green": green,
      "navy": navy,
      "blue": blue,
      "babyBlue": babyBlue,
      "white": white,
      "brown": brown,
      "cream": cream,
      "yellow": yellow
    };
  }
}
