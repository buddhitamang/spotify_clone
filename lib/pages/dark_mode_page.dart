import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class DarkModePage extends StatelessWidget {
  const DarkModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
          },
          child: Text('tap me'),
        ),
      ),
    );
  }
}
