import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/screens/admin.dart';
import 'package:nbb/utils/shared.dart';

class ProfileDynamicHeader extends StatelessWidget {
  const ProfileDynamicHeader({Key? key}) : super(key: key);

  bool? adminScreen() {
    if (Shared.getUserPhone() == adminNumber) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 35).copyWith(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Visibility(
            visible: adminScreen()!,
            child: TextButton(
              child: const Text(
                ' Admin\nSettings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, AdminScreen.id),
            ),
          ),
        ],
      ),
    );
  }
}
