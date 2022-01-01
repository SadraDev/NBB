import 'package:flutter/material.dart';
import 'package:nbb/login_screens/login.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool obscure = true;
  String? _email;
  String? _password;

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
                height: MediaQuery.of(context).size.height * 0.7,
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
                        'REGISTER',
                        style: TextStyle(
                          color: Color(0xff111015),
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'JohnDoe@example.io',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xbb111015), width: 2),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                            floatingLabelStyle: TextStyle(color: Color(0xbb111015)),
                          ),
                          validator: (email) =>
                              !isEmail(email!) ? 'لطفا ایمیل را صحیح وارد کنید ' : null,
                          onChanged: (value) {
                            _email = value;
                          },
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
                              'REGISTER',
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
                          onTap: () {
                            formKey.currentState!.validate();
                          },
                        ),
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
