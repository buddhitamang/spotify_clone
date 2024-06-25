import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclone/model/playlist_provider.dart';
import 'package:spotifyclone/pages/splash_page.dart';

import 'pages/main_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>PlaylistProvider(),child: MyApp(),),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}