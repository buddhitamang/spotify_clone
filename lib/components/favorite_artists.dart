import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteArtists extends StatelessWidget {
  final String name;
  final String image;
  const FavoriteArtists({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 66,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(height: 3,),
            Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Theme.of(context).primaryTextTheme.headlineMedium?.color),maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
    // TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:Theme.of(context).textTheme.headlineMedium?.color)
  }
}
