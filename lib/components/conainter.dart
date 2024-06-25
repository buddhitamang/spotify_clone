import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  final String text;
  final Color color;
   const ContainerPage({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Text(text,style: TextStyle(color: Colors.white),),
    );
  }
}
