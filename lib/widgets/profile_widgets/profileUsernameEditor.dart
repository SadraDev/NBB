import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

class ProfileScreenUsernameEditor extends StatelessWidget {
  const ProfileScreenUsernameEditor({Key? key, this.username, this.onSubmitted}) : super(key: key);
  final String? username;
  final void Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            cursorColor: blackColor,
            cursorHeight: 30,
            textAlign: TextAlign.center,
            expands: false,
            style: const TextStyle(
              fontSize: 24,
              color: blackColor,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
              hintText: username!,
              hintStyle: const TextStyle(
                fontSize: 24,
                color: blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onSubmitted: onSubmitted!,
          ),
          const Text(
            'Type to edit',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
