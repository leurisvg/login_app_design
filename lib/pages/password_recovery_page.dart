import 'package:flutter/material.dart';

import 'package:login_design/utils/responsive.dart';

import 'package:login_design/widgets/login_header.dart';
import 'package:login_design/widgets/login_input_text.dart';
import 'package:login_design/widgets/submit_button.dart';

const _lightBlue = Color(0xff70c4f3);

class PasswordRecoveryPage extends StatefulWidget {
  @override
  _PasswordRecoveryPageState createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;

  submit(GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState.validate();

    if (!isValid) {
      print('Invalid form');
      return;
    }
  }

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.45),
                    Text(
                      'Forgot your password?',
                      style: TextStyle(fontSize: Responsive.ip(context, 2.5), color: _lightBlue),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Enter your email address to send you a code.',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Form(
                      key: _formKey,
                      child: LoginInputText(
                        label: 'Email',
                        inputType: TextInputType.emailAddress,
                        fontSize: 1.8,
                        validator: (String email) {
                          final RegExp regExp =
                              new RegExp(r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                          if (regExp.hasMatch(email)) {
                            this._email = email;
                            return null;
                          } else {
                            return 'Invalid email';
                          }
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SubmitButton(
                      text: 'SEND',
                      submit: () {
                        submit(_formKey);
                      },
                    ),
                  ],
                ),
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
              style: TextStyle(
                fontSize: Responsive.ip(context, 1.8),
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
