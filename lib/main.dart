import 'package:flutter/material.dart';
import 'package:final_project/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:final_project/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ponbrunytdudhkxfaubf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBvbmJydW55dGR1ZGhreGZhdWJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEyNzg0NDEsImV4cCI6MjAxNjg1NDQ0MX0.bEyxmhkAz_uEe6UI19X8lj4ia0Du61Y6AyO8gfxlkUQ',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
