import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_design/utils/responsive.dart';

class LoginInputText extends StatefulWidget {
  final TextInputType inputType;
  final Function(String) validator;
  final bool isSecure;
  final String label;
  final double fontSize;

  const LoginInputText({
    @required this.validator,
    @required this.label,
    this.inputType = TextInputType.text,
    this.isSecure = false,
    this.fontSize = 17.0,
  });

  @override
  _LoginInputTextState createState() => _LoginInputTextState();
}

class _LoginInputTextState extends State<LoginInputText> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xff70c4f3),
      ),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: this.widget.inputType,
        obscureText: this.widget.isSecure,
        validator: this.widget.validator,
        style: TextStyle(color: Color(0xff70c4f3)),
        decoration: InputDecoration(
          labelText: this.widget.label,
          labelStyle: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: Responsive.ip(context, this.widget.fontSize), color: Colors.grey[600]),
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
