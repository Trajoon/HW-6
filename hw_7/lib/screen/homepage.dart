import 'package:flutter/material.dart';
import 'package:hw_5/components/top_screen_widget.dart';


class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[50],

      body: SafeArea(
        child: Column(
          children: [
            TopScreen(),
            
            
          ],
        ),
      ),
    );
  }
}