import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final String firstName;
  final String secondName;
  final String image1;
  final String image2;
  const MainContainer({super.key, required this.firstName, required this.secondName, required this.image1, required this.image2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 190,
            color: Colors.grey,
            child: Row(
              children: [
               Container(
                 child: Image.asset(image1) ,
               ),
                SizedBox(width: 9,),
                Text(firstName,style: TextStyle(color: Colors.white,fontSize: 15),)
              ],
            ),
          ),
          SizedBox(width: 12,),
          Container(
            height: 80,
            width: 190,
            color: Colors.grey,
            child: Row(
              children: [
                Container(
                  child: Image.asset(image2),
                ),
                SizedBox(width: 9,),
                Text(secondName,style: TextStyle(color: Colors.white,fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }
}
