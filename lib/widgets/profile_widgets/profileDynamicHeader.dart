import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nbb/const.dart';
import 'package:nbb/screens/admin.dart';
import 'package:nbb/screens/login.dart';
import 'package:nbb/screens/sells.dart';
import 'package:nbb/utils/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDynamicHeader extends StatelessWidget {
  const ProfileDynamicHeader({Key? key}) : super(key: key);

  bool? adminScreen() {
    if (Shared.getUserPhone() == adminNumber) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35).copyWith(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          adminScreen()!
              ? GestureDetector(
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, SellsScreen.id),
                )
              : const Text(
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
                    'Contact Us',
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
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20),
                        scrollable: true,
                        content: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Card(
                                  color: Colors.grey[100],
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape:
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                  child: InkWell(
                                    child: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 50,
                                        color: Colors.green,
                                      ),
                                    ),
                                    onTap: () async {
                                      const url = 'https://api.whatsapp.com/send/?phone=%2B989370603580';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                  ),
                                ),
                                Card(
                                  color: Colors.grey[100],
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape:
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                  child: InkWell(
                                    child: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Icon(
                                        FontAwesomeIcons.instagram,
                                        size: 50,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    onTap: () async {
                                      const url = 'https://www.instagram.com/SadraDev/';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Card(
                                    color: Colors.grey[100],
                                    margin: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                    child: InkWell(
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          FontAwesomeIcons.telegram,
                                          size: 50,
                                          color: Colors.blue[700],
                                        ),
                                      ),
                                      onTap: () async {
                                        const url = 'https://t.me/SadiDev';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                  ),
                                  Card(
                                    color: Colors.grey[100],
                                    margin: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12))),
                                    child: InkWell(
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Icon(
                                          FontAwesomeIcons.phone,
                                          size: 40,
                                          color: Colors.lightGreen,
                                        ),
                                      ),
                                      onTap: () async {
                                        const url = 'tel:$adminNumber';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
