import 'package:nbb/screens/archives.dart';
import 'package:nbb/screens/register.dart';
import 'package:nbb/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nbb/screens/admin.dart';
import 'package:nbb/screens/flow.dart';
import 'package:nbb/screens/sells.dart';
import 'package:nbb/screens/splash.dart';
import 'package:nbb/utils/onLiked.dart';
import 'package:nbb/utils/shared.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => OnLiked())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'poppins'),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          FlowScreen.id: (context) => const FlowScreen(),
          AdminScreen.id: (context) => const AdminScreen(),
          SplashScreen.id: (context) => const SplashScreen(),
          SellsScreen.id: (context) => const SellsScreen(),
          ArchivesScreen.id: (context) => const ArchivesScreen(),
        },
      ),
    );
  }
}
