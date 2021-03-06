import 'package:flutter/material.dart';
import 'package:nbb/screens/register.dart';
import 'package:nbb/screens/flow.dart';
import 'package:nbb/utils/api.dart';
import 'package:nbb/utils/shared.dart';
import 'package:nbb/widgets/login_widgets/backGround.dart';
import 'package:nbb/widgets/login_widgets/loginPhoneTextField.dart';
import 'package:nbb/widgets/login_widgets/loginButton.dart';
import 'package:nbb/widgets/login_widgets/loginPasswordTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  bool obscure = true;
  String? _phone = '';
  String? _password = '';
  bool loading = false;

  String? validator(String? value) {
    if (value!.length == 11 && RegExp(r'^[0-9]+$').hasMatch(value) && value.substring(0, 2) == '09') {
      _phone = '+98' + value.substring(1);
    } else if (value.length == 13 && RegExp(r'^[+]{1}[0-9]{12}$').hasMatch(value) && value.substring(0, 4) == '+989') {
      _phone = value;
    } else if (value.length == 10 && RegExp(r'^[0-9]+$').hasMatch(value) && value.substring(0, 1) == '9') {
      _phone = '+98' + value;
    } else {
      return 'please enter a valid phone number';
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
                      LoginPhoneTextField(
                        hintText: '09123456789',
                        labelText: 'Phone',
                        suffixIcon: Icons.phone,
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
                            setState(() => loading = true);
                            String loggedIN = await Api.login(_phone!, _password!);
                            setState(() => loading = false);
                            if (loggedIN == 'true') {
                              Shared.setUserPhone(_phone!);
                              Shared.setUserPassword(_password!);
                              Navigator.popAndPushNamed(context, FlowScreen.id);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text(loggedIN, textAlign: TextAlign.center),
                                ),
                              );
                            }
                          }
                        },
                        onTapForgotPassword: () {}, //todo implement forgot password
                      ),
                      LoginButton(
                        loading: loading,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            String loggedIN = await Api.login(_phone!, _password!);
                            setState(() => loading = false);
                            if (loggedIN == 'true') {
                              Shared.setUserPhone(_phone!);
                              Shared.setUserPassword(_password!);
                              Navigator.popAndPushNamed(context, FlowScreen.id);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text(loggedIN, textAlign: TextAlign.center),
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
                          Navigator.popAndPushNamed(context, RegisterScreen.id);
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
