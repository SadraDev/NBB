import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

class ProductTypeSelector extends StatelessWidget {
  const ProductTypeSelector({
    Key? key,
    this.switcher,
    this.shoeColor,
    this.clothColor,
    this.isSwitched,
    this.sameSwitcher,
  }) : super(key: key);
  final void Function()? switcher;
  final void Function(bool?)? sameSwitcher;
  final Color? shoeColor;
  final Color? clothColor;
  final bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: switcher,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Shoe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: shoeColor,
                  ),
                ),
                Transform.scale(
                  scale: 1.6,
                  child: CupertinoSwitch(
                    value: isSwitched!,
                    onChanged: sameSwitcher,
                    activeColor: Colors.grey[200],
                    thumbColor: blackColor,
                    trackColor: Colors.grey[200],
                  ),
                ),
                Text(
                  'Cloth',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: clothColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
