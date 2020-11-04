import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_design/utils/responsive.dart';

import 'package:login_design/pages/register_page.dart';
import 'package:login_design/pages/password_recovery_page.dart';
import 'package:login_design/widgets/login_header.dart';
import 'package:login_design/widgets/login_input_text.dart';
import 'package:login_design/widgets/submit_button.dart';

const _lightBlue = Color(0xff70c4f3);

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            LoginHeader(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_loginSubmit(BuildContext context, GlobalKey<FormState> formKey) {
  final isValid = formKey.currentState.validate();

  if (!isValid) {
    return;
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.4),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'LOG IN',
              style: GoogleFonts.pathwayGothicOne(
                textStyle: TextStyle(fontSize: Responsive.ip(context, 2.7), color: _lightBlue),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                LoginInputText(
                  label: 'Email',
                  inputType: TextInputType.emailAddress,
                  fontSize: 1.8,
                  validator: (String email) {
                    final RegExp regExp =
                        new RegExp(r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                    if (regExp.hasMatch(email)) {
                      this.email = email;
                      return null;
                    } else {
                      return 'Invalid email';
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                LoginInputText(
                  label: 'Password',
                  isSecure: true,
                  fontSize: 1.8,
                  validator: (String password) {
                    final RegExp regExp = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');

                    if (regExp.hasMatch(password)) {
                      this.password = password;
                      return null;
                    } else {
                      return 'Minimum six characters, at least one letter and one number';
                    }
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Align(
                  alignment: Alignment.topRight,
                  child: RawMaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) {
                            return PasswordRecoveryPage();
                          },
                          transitionsBuilder: (_, Animation<double> animation, ___, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Forgot your password?',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: Responsive.ip(context, 1.55), color: _lightBlue),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                SubmitButton(
                  text: 'LOGIN',
                  submit: () => _loginSubmit(context, _formKey),
                ),
                SizedBox(height: size.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have account?",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: Responsive.ip(context, 1.55), color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) {
                              return RegisterPage();
                            },
                            transitionsBuilder: (_, Animation<double> animation, ___, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: Responsive.ip(context, 1.55), color: _lightBlue),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
