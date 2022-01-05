import 'package:flutter/material.dart';
import '../../const.dart';

class ProductSizeTextFields extends StatelessWidget {
  const ProductSizeTextFields({Key? key, this.minSize, this.maxSize}) : super(key: key);
  final void Function(String?)? minSize;
  final void Function(String?)? maxSize;

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
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                'Size',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 20),
              child: Row(
                children: <Widget>[
                  const Text(
                    'From',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: blackColor,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blackColor),
                        ),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      onChanged: minSize,
                      onSubmitted: minSize,
                    ),
                  ),
                  const Text(
                    'To',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: blackColor,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blackColor),
                        ),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      onChanged: maxSize,
                      onSubmitted: maxSize,
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
