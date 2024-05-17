import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weareclothed/auth/login_or_register.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options : DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
    );
  }
} //