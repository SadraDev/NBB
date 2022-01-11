import 'package:flutter/material.dart';

class LoginPhoneTextField extends StatelessWidget {
  const LoginPhoneTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.iconOnPressed,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);
  final String? hintText;
  final String? labelText;
  final void Function()? iconOnPressed;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xbb111015), width: 2),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Color(0xbb111015)),
          suffixIcon: IconButton(
            onPressed: iconOnPressed,
            icon: Icon(
              suffixIcon,
              color: const Color(0xbb111015),
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
