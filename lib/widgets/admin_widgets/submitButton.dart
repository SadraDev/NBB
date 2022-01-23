import 'package:flutter/material.dart';
import '../../const.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, this.onTap, this.loading}) : super(key: key);
  final void Function()? onTap;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        color: blackColor,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: !loading!
                ? const Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.4),
                    child: const CircularProgressIndicator(
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
