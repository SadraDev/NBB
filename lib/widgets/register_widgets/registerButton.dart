import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key, this.onTap, this.loading}) : super(key: key);
  final void Function()? onTap;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: InkWell(
        child: Ink(
          child: !loading!
              ? const Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              : const CircularProgressIndicator(color: Colors.white),
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
