import 'package:flutter/material.dart';
import '../../const.dart';

bool pink = false;
bool blue = false;
bool red = false;
bool green = false;
bool black = false;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
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
                        color: Colors.black,
                        child: black ? const Icon(Icons.check, color: Colors.white) : Container(),
                      ),
                      onTap: () => setState(() => black = !black),
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
    return {"pink": pink, "blue": blue, "green": green, "red": red, "black": black};
  }
}
