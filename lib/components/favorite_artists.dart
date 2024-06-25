import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteArtists extends StatelessWidget {
  final String name;
  final String image;
  const FavoriteArtists({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            radius: 66,
            backgroundImage: AssetImage(image),
          ),
        ),
        SizedBox(height: 3,),
        Text(name,style: TextStyle(fontSize: 18,color: Colors.white70),)
      ],
    );
  }
}
