import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class HomeProductsOrNotSelector extends StatelessWidget {
  const HomeProductsOrNotSelector(
      {Key? key, this.isHomeProduct, this.homeProductSwitcher, this.sameHomeProductSwitcher})
      : super(key: key);
  final bool? isHomeProduct;
  final void Function(bool?)? homeProductSwitcher;
  final void Function()? sameHomeProductSwitcher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: GestureDetector(
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
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Home\nProduct?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Transform.scale(
                  scale: 1.6,
                  child: CupertinoSwitch(
                    value: isHomeProduct!,
                    onChanged: homeProductSwitcher,
                    activeColor: blackColor,
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: sameHomeProductSwitcher!,
      ),
    );
  }
}
