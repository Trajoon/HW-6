import 'package:flutter/material.dart';
import 'package:hw_5/model/user_info.dart';


// DownScreen widget displays a list of user information.
class DownScreen extends StatelessWidget {
  final List<UserInfo> userList;

  // Constructor to initialize the DownScreen with a list of user information.
  const DownScreen({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header text for the user list section.
          const Text(
            'User List:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Check if the user list is empty.
          userList.isEmpty
              ? const Text('No users saved yet.') // Display message if no users are saved.
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Display user information using ListTile for each user.
                  children: userList.map((user) {
                    return ListTile(
                      title: Text('Name: ${user.name}'),
                      subtitle: Text('Email: ${user.email}'),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
