import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hw_5/screen/homepage.dart';
import 'package:hw_5/utlis/git_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await GetStorage.init(); // Initialize Get Storage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}
