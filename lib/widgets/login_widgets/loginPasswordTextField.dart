import 'package:flutter/material.dart';

class LoginPasswordTextFiled extends StatelessWidget {
  const LoginPasswordTextFiled({
    Key? key,
    this.obscureText,
    this.iconOnPressed,
    this.onDoneEditing,
    this.onSubmitted,
    this.onTapForgotPassword,
    this.suffixIcon,
    this.iconColor,
  }) : super(key: key);
  final bool? obscureText;
  final void Function()? iconOnPressed;
  final void Function(String?)? onDoneEditing;
  final void Function(String?)? onSubmitted;
  final void Function()? onTapForgotPassword;
  final IconData? suffixIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
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
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25, top: 10),
          child: GestureDetector(
            child: const Text(
              'Forgot your password',
              style: TextStyle(
                color: Color(0xbb111015),
              ),
            ),
            onTap: onTapForgotPassword,
          ),
        ),
      ],
    );
  }
}
