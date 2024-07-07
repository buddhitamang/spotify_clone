import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclone/model/playlist_provider.dart';
import 'package:spotifyclone/pages/splash_page.dart';
import 'package:spotifyclone/theme/theme_provider.dart';

import 'pages/main_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>PlaylistProvider()),
      ChangeNotifierProvider(create: (context)=>ThemeProvider())
    ],child: MyApp(),)
    // ChangeNotifierProvider(create: (context)=>PlaylistProvider(),child: MyApp(),),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,

    );
  }
}