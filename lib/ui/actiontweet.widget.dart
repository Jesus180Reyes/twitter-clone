import 'package:flutter/material.dart';

class ActionsTweetWidget extends StatelessWidget {
  final int item;
  final IconData icon;

  const ActionsTweetWidget({
    Key? key,
    required this.size,
    required this.item,
    required this.icon,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text('$item'),
        ],
      ),
    );
  }
}
