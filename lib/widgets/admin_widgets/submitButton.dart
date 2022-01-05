import 'package:flutter/material.dart';
import '../../const.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        color: blackColor,
        child: InkWell(
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
