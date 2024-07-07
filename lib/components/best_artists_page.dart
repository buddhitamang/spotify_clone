import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestArtistsPage extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  const BestArtistsPage({super.key, required this.text1, required this.image, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 150,
            child: ClipRRect(

                child: Image.asset(image,fit: BoxFit.cover,)),

          ),
          Text(text1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:Theme.of(context).primaryTextTheme.headlineMedium?.color),maxLines: 1,overflow: TextOverflow.ellipsis,),
          Text(text2,style: TextStyle(fontSize: 12,color:Theme.of(context).primaryTextTheme.headlineSmall?.color)),
        ],
      ),
    );
  }
}
