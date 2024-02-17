import 'package:flutter/material.dart';


class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  Function()? onTap;

   MyListTile({Key? key,
    required this.text,
    required this.icon,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
