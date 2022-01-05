import 'package:flutter/material.dart';
import 'dart:io';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, this.image, this.onTap}) : super(key: key);
  final File? image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30).copyWith(top: 0),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: FileImage(image!),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
