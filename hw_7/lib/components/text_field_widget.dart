import 'package:flutter/material.dart';

// FieldText widget is a custom text form field with additional features.
class FieldText extends StatelessWidget {
  final String labelText; // Text displayed as the label for the text field.
  final String hintText; // Text displayed as a hint in the text field.
  final TextEditingController? controller; // Controller for the text field.
  final IconData iconData; // Icon to be displayed next to the text field.
  final Widget? suffixIcon; // Optional icon to be displayed as a suffix.

  // Constructor to initialize the FieldText widget with the required parameters.
  const FieldText({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.iconData = Icons.verified_user_outlined,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(labelText), // Display the label above the text field.
          hintText: hintText, // Display the hint text in the text field.
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          icon: Icon(iconData), // Display the specified icon next to the text field.
          suffixIcon: suffixIcon, // Display the optional suffix icon.
        ),
      ),
    );
  }
}