import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:login_design/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
