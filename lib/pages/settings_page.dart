import 'dart:async';

import 'package:final_project/pages/login_page.dart';
import 'package:final_project/pages/chat_page.dart';
import 'package:final_project/pages/register_page.dart';
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
  
  Future<void> deleteAccount() async{
    // Replace these values with your Supabase project details
    final supabaseUrl = 'https://ponbrunytdudhkxfaubf.supabase.co';
    final supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBvbmJydW55dGR1ZGhreGZhdWJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyNzg0NDEsImV4cCI6MjAxNjg1NDQ0MX0.bEyxmhkAz_uEe6UI19X8lj4ia0Du61Y6AyO8gfxlkUQ';
    final client = SupabaseClient(supabaseUrl, supabaseKey);

    // Delete user profile
    final response = await client.from('profiles').delete().eq('id', supabase.auth.currentUser!.id);
    
    Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);

    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Account Deletion Confirmation'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('Ok'))
          ]
        );
      });

  }

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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
            children: [ElevatedButton(
              onPressed: (){}, //Add In Change Settings function
              child: const Text('Apply Settings')),
              ElevatedButton(
                onPressed: () => deleteAccount(), //Add in DeleteAccount function
                child: const Text('Delete Account'))],
          ),
      ),
    );
  }
}