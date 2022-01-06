import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: InkWell(
        child: Ink(
          child: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff111015),
                Color(0xbb111015),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
