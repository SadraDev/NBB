import 'package:nbb/screens/flow.dart';
import 'package:nbb/widgets/register_widgets/registerButton.dart';
import 'package:nbb/widgets/register_widgets/registerEmailTextField.dart';
import 'package:nbb/widgets/register_widgets/registerPasswordTextField.dart';
import 'package:nbb/widgets/register_widgets/registerPhoneTextField.dart';
import 'package:nbb/widgets/register_widgets/registerUsernameTextFiled.dart';
import 'package:nbb/widgets/login_widgets/backGround.dart';
import 'package:nbb/login_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:nbb/utils/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscure = true;
  String? _username = '';
  String? _email = '';
  String? _phone = '';
  String? _password = '';

  String? phoneValidator(String? value) {
    if (value!.length == 11 &&
        RegExp(r'^[0-9]+$').hasMatch(value) &&
        value.substring(0, 2) == '09') {
      _phone = '+98' + value.substring(1);
    } else if (value.length == 13 &&
        RegExp(r'^[+]{1}[0-9]{12}$').hasMatch(value) &&
        value.substring(0, 4) == '+989') {
      _phone = value;
    } else if (value.length == 10 &&
        RegExp(r'^[0-9]+$').hasMatch(value) &&
        value.substring(0, 1) == '9') {
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

  TextStyle style = const TextStyle(
    color: Color(0xff111015),
    fontWeight: FontWeight.w900,
    fontSize: 36,
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
                      Text(
                        'REGISTER',
                        style: style,
                      ),
                      RegisterUsernameTextField(
                        onDoneEditing: (value) => _username = value,
                      ),
                      RegisterPhoneTextField(
                        validator: phoneValidator,
                      ),
                      RegisterEmailTextField(
                        onDoneEditing: (value) => _email = value,
                      ),
                      RegisterPasswordTextField(
                        obscureText: obscure,
                        iconColor: obscure ? const Color(0xbb111015) : Colors.grey,
                        suffixIcon: obscure ? Icons.visibility : Icons.visibility_off,
                        iconOnPressed: () => setState(() => obscure = !obscure),
                        onDoneEditing: (value) => _password = value,
                        onSubmitted: (value) async {
                          if (formKey.currentState!.validate()) {
                            var isRegistered =
                                await Api.register(_username!, _password!, _email!, _phone!);
                            if (isRegistered) Navigator.popAndPushNamed(context, FlowScreen.id);
                            if (!isRegistered) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content:
                                      Text('user already existed!', textAlign: TextAlign.center),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      RegisterButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            var isRegistered =
                                await Api.register(_username!, _password!, _email!, _phone!);
                            if (isRegistered) Navigator.popAndPushNamed(context, FlowScreen.id);
                            if (!isRegistered) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content:
                                      Text('user already existed!', textAlign: TextAlign.center),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      GestureDetector(
                        child: const Text(
                          'Already have an account? log in',
                          style: TextStyle(color: Color(0xbb111015)),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
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
