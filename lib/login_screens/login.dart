import 'package:flutter/material.dart';
import 'package:nbb/login_screens/register.dart';
import 'package:nbb/screens/home.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/widgets/login_widgets/backGround.dart';
import 'package:nbb/widgets/login_widgets/loginEmailAndPhoneTextField.dart';
import 'package:nbb/widgets/login_widgets/loginButton.dart';
import 'package:nbb/widgets/login_widgets/loginPasswordTextField.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool obscure = true;
  bool emailOrPhoneChecker = false;
  String? _emailOrPhone = '';
  String? _password = '';

  String? validator(String? value) {
    if (emailOrPhoneChecker == true) {
      return !isEmail(value!) ? 'please enter a valid email address' : _emailOrPhone = value;
    } else {
      if (value!.length == 11 &&
          RegExp(r'^[0-9]+$').hasMatch(value) &&
          value.substring(0, 2) == '09') {
        _emailOrPhone = '+98' + value.substring(1);
      } else if (value.length == 13 &&
          RegExp(r'^[+]{1}[0-9]{12}$').hasMatch(value) &&
          value.substring(0, 4) == '+989') {
        _emailOrPhone = value;
      } else if (value.length == 10 &&
          RegExp(r'^[0-9]+$').hasMatch(value) &&
          value.substring(0, 1) == '9') {
        _emailOrPhone = '+98' + value;
      } else {
        return 'please enter a valid phone number';
      }
    }
  }

  BoxDecoration decoration = const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 5,
        color: Colors.black26,
      ),
    ],
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          const BackGround(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: decoration,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xff111015),
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      LoginEmailAndPhoneTextField(
                        hintText: emailOrPhoneChecker ? 'JohnDoe@example.io' : '09123456789',
                        labelText: emailOrPhoneChecker ? 'Email' : 'Phone',
                        suffixIcon: emailOrPhoneChecker ? Icons.phone : Icons.email,
                        iconOnPressed: () =>
                            setState(() => emailOrPhoneChecker = !emailOrPhoneChecker),
                        validator: validator,
                      ),
                      LoginPasswordTextFiled(
                        obscureText: obscure,
                        suffixIcon: obscure ? Icons.visibility : Icons.visibility_off,
                        iconColor: obscure ? const Color(0xbb111015) : Colors.grey,
                        iconOnPressed: () => setState(() => obscure = !obscure),
                        onDoneEditing: (value) => _password = value,
                        onSubmitted: (value) async {
                          if (formKey.currentState!.validate()) {
                            bool loggedIN = await Api.login(_emailOrPhone!, _password!);
                            if (loggedIN) Navigator.popAndPushNamed(context, HomeFlow.id);
                            if (!loggedIN) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text('wrong password', textAlign: TextAlign.center),
                                ),
                              );
                            }
                          }
                        },
                        onTapForgotPassword: () {}, //todo implement forgot password
                      ),
                      LoginButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            bool loggedIN = await Api.login(_emailOrPhone!, _password!);
                            if (loggedIN) Navigator.popAndPushNamed(context, HomeFlow.id);
                            if (!loggedIN) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text('wrong password', textAlign: TextAlign.center),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: const Text(
                          'Don\'t have an account? Sign up',
                          style: TextStyle(
                            color: Color(0xbb111015),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
