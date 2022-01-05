import 'package:flutter/material.dart';
import '../../const.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30).copyWith(top: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: blackColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.white,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
