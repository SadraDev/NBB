import 'package:flutter/material.dart';

class RegisterPhoneTextField extends StatelessWidget {
  const RegisterPhoneTextField({Key? key, this.validator}) : super(key: key);
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: '09123456789',
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xbb111015), width: 2),
          ),
          labelText: 'phone number',
          labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color(0xbb111015)),
        ),
        validator: validator,
      ),
    );
  }
}
