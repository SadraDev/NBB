import 'package:flutter/material.dart';
import '../../const.dart';

class ProductPriceTextField extends StatelessWidget {
  const ProductPriceTextField({Key? key, this.onDoneEditing}) : super(key: key);
  final void Function(String?)? onDoneEditing;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20).copyWith(bottom: 0),
              child: const Text(
                'Price',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 40),
              child: Center(
                child: SizedBox(
                  width: 120,
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
                    onChanged: onDoneEditing,
                    onSubmitted: onDoneEditing,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
