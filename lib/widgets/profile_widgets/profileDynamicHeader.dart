import 'package:flutter/material.dart';
import 'package:nbb/const.dart';
import 'package:nbb/screens/admin.dart';
import 'package:nbb/screens/login.dart';
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
          adminScreen()!
              ? TextButton(
                  child: const Text(
                    ' Admin\nSettings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, AdminScreen.id),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text(
                          'You are about to Logout and your liked products will be deleted. Are you sure?',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'no',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'yes',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Shared.setUserName('');
                              Shared.setLikedProducts([]);
                              Shared.setUserPhone('');
                              Shared.setUserEmail('');
                              Shared.setUserPassword('');
                              Navigator.popAndPushNamed(context, LoginScreen.id);
                            },
                          )
                        ],
                      ),
                    );
                  },
                )
              : TextButton(
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text(
                          'You are about to Logout and your liked products will be deleted. Are you sure?',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'no',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'yes',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Shared.setUserName('');
                              Shared.setLikedProducts([]);
                              Shared.setUserPhone('');
                              Shared.setUserEmail('');
                              Shared.setUserPassword('');
                              Navigator.popAndPushNamed(context, LoginScreen.id);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
