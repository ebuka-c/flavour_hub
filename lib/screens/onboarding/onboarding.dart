import 'package:flutter/material.dart';
import 'package:flavor_hub/utilities/extensions.dart';
import 'dart:ui' as ui;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          CustomPaint(
            size: Size(double.maxFinite, h / 2),
            painter: RPSCustomPainter(),
            // child: Container(
            //   width: double.infinity,
            //   height: h / 2,
            //   color: Colors.amber,
            // ),
          )
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 142, 132, 227)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0243333, size.height * -0.0091706);
    path_0.lineTo(size.width * 1.0025641, 0);
    path_0.quadraticBezierTo(size.width * 1.1159487, size.height * 0.5403555,
        size.width * 1.1175128, size.height * 0.7638389);
    path_0.cubicTo(
        size.width * 0.4669744,
        size.height * 0.6919668,
        size.width * 0.5650769,
        size.height * 1.2079858,
        size.width * -0.0681795,
        size.height * 0.7562559);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


/**
 * child: CustomPaint(
  size: Size(WIDTH,(WIDTH*1.082051282051282).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
  painter: RPSCustomPainter(),
),
 */

/**
 * class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 142, 132, 227)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0243333,size.height*-0.0091706);
    path_0.lineTo(size.width*1.0025641,0);
    path_0.quadraticBezierTo(size.width*1.0109487,size.height*0.5482701,size.width*1.0125128,size.height*0.7717536);
    path_0.cubicTo(size.width*0.6434103,size.height*0.7113507,size.width*0.6522821,size.height*0.8580569,size.width*0.3477436,size.height*0.8831754);
    path_0.quadraticBezierTo(size.width*0.0979744,size.height*0.8386019,size.width*-0.0288462,size.height*0.7264218);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

 */