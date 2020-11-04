import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_design/utils/responsive.dart';

const _lightBlue = Color(0xff70c4f3);

class SubmitButton extends StatelessWidget {
  final Function submit;
  final String text;

  const SubmitButton({@required this.submit, @required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialButton(
      minWidth: double.infinity,
      color: _lightBlue,
      elevation: 0,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.022),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: this.submit,
      child: Text(
        this.text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: Responsive.ip(context, 1.6), color: Colors.white),
        ),
      ),
    );
  }
}
