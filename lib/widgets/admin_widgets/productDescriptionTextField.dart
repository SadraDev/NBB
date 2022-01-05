import 'package:flutter/material.dart';
import '../../const.dart';

class ProductDescriptionTextField extends StatelessWidget {
  const ProductDescriptionTextField({Key? key, this.onDoneEditing}) : super(key: key);
  final void Function(String)? onDoneEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
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
                'Description',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 30),
              child: TextField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: blackColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  hintText: 'Description',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 4,
                cursorColor: blackColor,
                onChanged: onDoneEditing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
