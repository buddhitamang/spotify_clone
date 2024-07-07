import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.shade500,
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 15,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 3,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: child,
      padding: EdgeInsets.all(18),
    );
  }
}
