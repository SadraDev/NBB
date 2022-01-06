import 'package:flutter/material.dart';

class RegisterUsernameTextField extends StatelessWidget {
  const RegisterUsernameTextField({Key? key, this.onDoneEditing}) : super(key: key);
  final void Function(String?)? onDoneEditing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'John Doe',
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xbb111015), width: 2),
          ),
          labelText: 'username',
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color(0xbb111015)),
        ),
        onChanged: onDoneEditing,
      ),
    );
  }
}
