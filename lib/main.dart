import 'package:nbb/login_screens/register.dart';
import 'package:nbb/login_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nbb/screens/admin.dart';
import 'package:nbb/screens/flow.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => OnLiked())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'poppins'),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          FlowScreen.id: (context) => const FlowScreen(),
          AdminScreen.id: (context) => const AdminScreen(),
        },
      ),
    );
  }
}
