import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const MyButton({Key? key,
    required this.child,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.all(25),
        
        child: child,
      ),
    );
  }
}
