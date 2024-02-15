// Importing necessary packages and components
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hw_5/components/button_widget.dart';
import 'package:hw_5/components/down_screen.dart';
import 'package:hw_5/components/text_field_widget.dart';
import 'package:hw_5/model/user_info.dart';

// Widget for the top screen
class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

// State class for the top screen widget
class _TopScreenState extends State<TopScreen> {
  // Initializing controllers for text fields
  final TextEditingController nameController = GetIt.I.get<TextEditingController>();
  final TextEditingController emailController = GetIt.I.get<TextEditingController>();

  // Initializing storage using GetStorage
  final GetStorage storage = GetIt.I.get<GetStorage>();

  // List to store user information
  List<UserInfo> listUser = [];

  @override
  void initState() {
    super.initState();
    // Load data from storage
    final dynamic savedInfoList = storage.read('savedUsers');
    if (savedInfoList != null && savedInfoList is List<dynamic>) {
      listUser = savedInfoList.cast<Map<String, dynamic>>().map((e) => UserInfo.fromJson(e)).toList();
    } else {
      // Handle the case where savedInfo is null or not List<dynamic>
      nameController.text = "";
      emailController.text = "";
    }
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // Function to clear the name text field
  void clearName() {
    nameController.clear();
  }

  // Function to clear the email text field
  void clearEmail() {
    emailController.clear();
  }

  // Function to save user data
  void saveData() {
    final userInfo =
        UserInfo(name: nameController.text.trim(), email: emailController.text.trim());
    listUser.add(userInfo); // Add new user info to the list
    storage.write('savedUsers', listUser.map((e) => e.toJson()).toList()); // Update storage
    setState(() {}); // Rebuild UI
  }

  // Function to delete all user data
  void deleteList() {
    setState(() {
      listUser.clear();
      storage.remove('savedUsers'); // Remove data from storage
    });
  }

  // Build method to create the UI
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Upper Component
        Column(
          children: [
            // Text field for entering the name
            FieldText(
              labelText: 'Name',
              hintText: 'Enter your name',
              controller: nameController,
              iconData: Icons.person,
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearName,
              ),
            ),
            SizedBox(height: 10),
            // Text field for entering the email
            FieldText(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: emailController,
              iconData: Icons.email,
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearEmail,
              ),
            ),
            // Button to save user data
            ButtonEdit(
              labelText: 'Save',
              onTap: saveData,
            ),
            // Button to remove all user data
            ButtonEdit(
              labelText: 'Remove',
              onTap: deleteList,
            ),
          ],
        ),
        // Lower Component
        // Widget to display the user list
        DownScreen(userList: listUser),
      ],
    );
  }
}
