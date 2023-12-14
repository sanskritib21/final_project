import 'package:flutter/material.dart';
import 'package:final_project/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:final_project/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wkoielxyczrxvpsvvaek.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indrb2llbHh5Y3pyeHZwc3Z2YWVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1Mzg1MDMsImV4cCI6MjAxODExNDUwM30.AOODecSx12yRbT1L0DqXkcyCB9X07bEP8eht3ZqrcXs',
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
