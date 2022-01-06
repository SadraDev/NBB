import 'package:flutter/material.dart';

class RegisterPasswordTextField extends StatelessWidget {
  const RegisterPasswordTextField({
    Key? key,
    this.obscureText,
    this.iconOnPressed,
    this.onDoneEditing,
    this.onSubmitted,
    this.suffixIcon,
    this.iconColor,
  }) : super(key: key);
  final bool? obscureText;
  final void Function()? iconOnPressed;
  final void Function(String?)? onDoneEditing;
  final void Function(String?)? onSubmitted;
  final IconData? suffixIcon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText!,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xbb111015), width: 2),
          ),
          suffixIcon: IconButton(
            onPressed: iconOnPressed,
            icon: Icon(
              suffixIcon,
              color: iconColor,
            ),
          ),
          labelText: 'Password',
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: const TextStyle(color: Color(0xbb111015)),
        ),
        onChanged: onDoneEditing,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
