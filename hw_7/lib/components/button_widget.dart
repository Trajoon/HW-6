import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  final String labelText;
  final Function() onTap; 

  const ButtonEdit({super.key, required this.labelText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(100, 60),
      ),
      child: Text(labelText),
    );
  }
}
