import 'package:flutter/material.dart';
import 'package:final_project/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:final_project/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://crpwggktvbstlsffnysg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNycHdnZ2t0dmJzdGxzZmZueXNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDExMDYwMTgsImV4cCI6MjAxNjY4MjAxOH0.u4dKVZ10s-w9WOs120cS0DVCs-3Kszfoi09DOAYTKf8',
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
