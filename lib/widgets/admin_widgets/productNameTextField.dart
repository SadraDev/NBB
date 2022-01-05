import 'package:flutter/material.dart';
import '../../const.dart';

class ProductNameTextField extends StatelessWidget {
  const ProductNameTextField({Key? key, this.onDoneEditing}) : super(key: key);
  final void Function(String)? onDoneEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hintText: 'Product Name',
            hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          cursorColor: blackColor,
          onChanged: onDoneEditing,
          onSubmitted: onDoneEditing,
        ),
      ),
    );
  }
}
