import 'package:flutter/material.dart';
import 'package:nbb/login_screens/register.dart';
import 'package:nbb/screens/home.dart';
import 'package:nbb/utils/api.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color(0xff111015),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(),
                flex: 3,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 550,
                decoration: const BoxDecoration(
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
                ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: emailOrPhoneChecker ? 'JohnDoe@example.io' : '09123456789',
                            hintStyle: const TextStyle(color: Colors.grey),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xbb111015), width: 2),
                            ),
                            labelText: emailOrPhoneChecker ? 'Email' : 'Phone',
                            labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                            floatingLabelStyle: const TextStyle(color: Color(0xbb111015)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => emailOrPhoneChecker = !emailOrPhoneChecker);
                              },
                              icon: Icon(
                                emailOrPhoneChecker ? Icons.phone : Icons.email,
                                color: emailOrPhoneChecker
                                    ? const Color(0xbb111015)
                                    : const Color(0xbb111015),
                              ),
                            ),
                          ),
                          validator: validator,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                              obscureText: obscure,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xbb111015), width: 2),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() => obscure = !obscure);
                                  },
                                  icon: Icon(
                                    obscure ? Icons.visibility : Icons.visibility_off,
                                    color: obscure ? const Color(0xbb111015) : Colors.grey,
                                  ),
                                ),
                                labelText: 'Password',
                                labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                                floatingLabelStyle: const TextStyle(color: Color(0xbb111015)),
                              ),
                              onChanged: (value) {
                                _password = value;
                              },
                              onSubmitted: (value) async {
                                if (formKey.currentState!.validate()) {
                                  bool loggedIN = await Api.login(_emailOrPhone!, _password!);
                                  if (loggedIN) Navigator.popAndPushNamed(context, HomeFlow.id);
                                  if (!loggedIN) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => const AlertDialog(
                                        content:
                                            Text('wrong password', textAlign: TextAlign.center),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, top: 10),
                            child: GestureDetector(
                              child: const Text(
                                'Forgot your password',
                                style: TextStyle(
                                  color: Color(0xbb111015),
                                ),
                              ),
                              onTap: () {
                                //TODO: implement forgot password
                              },
                            ),
                          ),
                        ],
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: InkWell(
                          child: Ink(
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff111015),
                                  Color(0xbb111015),
                                ],
                              ),
                            ),
                          ),
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
