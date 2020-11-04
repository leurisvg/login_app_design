import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_design/utils/responsive.dart';

import 'package:login_design/pages/login_page.dart';
import 'package:login_design/widgets/login_header.dart';
import 'package:login_design/widgets/login_input_text.dart';
import 'package:login_design/widgets/submit_button.dart';

const _lightBlue = Color(0xff70c4f3);

class RegisterPage extends StatelessWidget {
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
                child: RegisterForm(),
              ),
            ),
            Positioned(
              left: 1,
              child: BackButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RawMaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_left, size: Responsive.ip(context, 3.5), color: Colors.white),
            Text(
              'Back',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: Responsive.ip(context, 1.8), color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String firstName;
  String lastName;
  String email;
  String password;

  _registerSubmit(BuildContext context, GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState.validate();

    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(height: size.height * 0.38),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'SIGN UP',
            style: GoogleFonts.pathwayGothicOne(
              textStyle: TextStyle(fontSize: Responsive.ip(context, 2.7), color: _lightBlue),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              LoginInputText(
                label: 'Name',
                fontSize: 1.8,
                validator: (String name) {
                  if (name.length > 2) {
                    this.firstName = name;
                    return null;
                  } else {
                    return 'Minimum three characters';
                  }
                },
              ),
              SizedBox(height: size.height * 0.01),
              LoginInputText(
                label: 'Last name',
                fontSize: 1.8,
                validator: (String lastName) {
                  if (lastName.length > 3) {
                    this.lastName = lastName;
                    return null;
                  } else {
                    return 'Minimum four characters';
                  }
                },
              ),
              SizedBox(height: size.height * 0.01),
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
              SizedBox(height: size.height * 0.01),
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
              SizedBox(height: size.height * 0.05),
              // SignUpButton(_formKey),
              SubmitButton(
                text: 'SIGN UP',
                submit: () => _registerSubmit(context, _formKey),
              ),
              SizedBox(height: size.height * 0.025),
              LogInButton(),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an account?",
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
                  return LoginPage();
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
            'Log In',
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: Responsive.ip(context, 1.55), color: _lightBlue),
            ),
          ),
        ),
      ],
    );
  }
}
