import 'package:flutter/material.dart';

class FavoriteHeader extends StatelessWidget {
  const FavoriteHeader(this.text, {Key? key, this.buyAll}) : super(key: key);
  final String text;
  final void Function()? buyAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35).copyWith(bottom: 20),
      child: GestureDetector(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: buyAll,
      ),
    );
  }
}
