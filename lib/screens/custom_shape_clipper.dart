import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
 Path getClip(Size size){
    // TODO: inpliment getClip
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * .5, size.height - 35.0);
    var firstContralpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstContralpoint.dx, firstContralpoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    var secondEndPoint = Offset(size.width, size.height -80.0);
    var secondContralPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondContralPoint.dx, secondContralPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) =>  true;


}