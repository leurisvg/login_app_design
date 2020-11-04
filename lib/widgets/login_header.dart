import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:login_design/utils/responsive.dart';

class LoginHeader extends StatefulWidget {
  @override
  _LoginHeaderState createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> leftPlusIncrease;
  Animation<double> rightPlusIncrease;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 5000));

    leftPlusIncrease = Tween(begin: 1.0, end: 2.0).animate(controller);
    rightPlusIncrease = Tween(begin: 1.0, end: 2.5).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          height: size.height * 0.35,
          width: double.infinity,
          child: CustomPaint(
            painter: Painter(
              colors: [0xffe1eef7, 0xffe6eef9],
              initialMove: [0, 0.95],
              firstQZ: [0.15, 1.07, 0.47, 0.93],
              secondQZ: [0.75, 0.78, 1, 1],
              finalMove: [1, 0],
            ),
          ),
        ),
        Container(
          height: size.height * 0.33,
          width: double.infinity,
          child: CustomPaint(
            painter: Painter(
              colors: [0xffcfc7fa, 0xffa2c6fa],
              initialMove: [0, 0.95],
              firstQZ: [0.15, 1.07, 0.47, 0.93],
              secondQZ: [0.75, 0.78, 1, 0.91],
              finalMove: [1, 0],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          left: -size.height * 0.055,
          child: ScaleTransition(
            scale: leftPlusIncrease,
            child: FaIcon(FontAwesomeIcons.plus, size: Responsive.ip(context, 30), color: Colors.white.withOpacity(0.25)),
          ),
        ),
        Positioned(
          top: size.height * 0.08,
          right: size.height * 0.025,
          child: ScaleTransition(
            scale: rightPlusIncrease,
            child: FaIcon(FontAwesomeIcons.plus, size: Responsive.ip(context, 4), color: Colors.white.withOpacity(0.25)),
          ),
        )
      ],
    );
  }
}

class Painter extends CustomPainter {
  final List<int> colors;
  final List<double> initialMove;
  final List<double> finalMove;
  final List<double> firstQZ;
  final List<double> secondQZ;

  Painter({
    @required this.colors,
    @required this.initialMove,
    @required this.firstQZ,
    @required this.secondQZ,
    @required this.finalMove,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    final Gradient gradient = new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(colors[0]),
        Color(colors[1]),
      ],
    );

    final Rect rect = new Rect.fromCircle(center: Offset(150.0, 150.0), radius: 180);

    paint
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect);

    path.lineTo(initialMove[0], size.height * initialMove[1]);
    path.quadraticBezierTo(size.width * firstQZ[0], size.height * firstQZ[1], size.width * firstQZ[2], size.height * firstQZ[3]);
    path.quadraticBezierTo(size.width * secondQZ[0], size.height * secondQZ[1], size.width * secondQZ[2], size.height * secondQZ[3]);
    path.lineTo(size.width * finalMove[0], finalMove[1]);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
