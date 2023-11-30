import 'dart:async';

import 'package:final_project/pages/login_page.dart';
import 'package:final_project/pages/chat_page.dart';
import 'package:flutter/material.dart';

import 'package:final_project/models/message.dart';
import 'package:final_project/models/profile.dart';
import 'package:final_project/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route<void> route(){
    return MaterialPageRoute(
      builder: (constext) => const SettingsPage(),
    );
  }

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  Future<void> returnToChatPage() async{
    Navigator.of(context)
          .pushAndRemoveUntil(ChatPage.route(), (route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => returnToChatPage(),
          tooltip: 'Return to Chat',
        ),
        title: const Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Add your settings widgets here
          ],
        ),
      ),
    );
  }
}