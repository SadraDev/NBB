import 'package:flutter/material.dart';

class RegisterEmailTextField extends StatelessWidget {
  const RegisterEmailTextField({Key? key, this.onDoneEditing}) : super(key: key);
  final void Function(String)? onDoneEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'JohnDoe@example.io',
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xbb111015), width: 2),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color(0xbb111015)),
        ),
        onChanged: onDoneEditing,
      ),
    );
  }
}
