import 'package:flutter/material.dart';
import 'package:nbb/screens/login.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/shared.dart';
import 'package:url_launcher/url_launcher.dart';
import '../const.dart';
import 'flow.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? phone = Shared.getUserPhone() ?? '';
  String? password = Shared.getUserPassword() ?? '';

  login() async {
    bool? loggedIn = await Api.login(phone!, password!);

    if (loggedIn) {
      Future.delayed(
          const Duration(seconds: 1), () => Navigator.popAndPushNamed(context, FlowScreen.id));
    }
    if (!loggedIn) {
      Future.delayed(
          const Duration(seconds: 1), () => Navigator.popAndPushNamed(context, LoginScreen.id));
    }
  }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 120,
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Image.asset('assets/images/logo.jpeg', height: 120, width: 120),
              ),
            ),
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'Developed by :       ',
                    style: TextStyle(
                      color: greyColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'SadraDev',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch(Uri.encodeFull(personalUrl))) {
                  await launch(Uri.encodeFull(personalUrl));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
