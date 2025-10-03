import 'package:chatapp/services/auth/auth_gate.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart'; // For web check

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // ✅ Web ke liye manual config
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAYR8xS1bHt1E4IeNZQ0MGNwagjMZWguxc",
        authDomain: "chatapp-f5345.firebaseapp.com",
        projectId: "chatapp-f5345",
        storageBucket: "chatapp-f5345.firebasestorage.app",
        messagingSenderId: "782734921352",
        appId: "1:782734921352:web:532550e1f12108deb0993d",
      ),
    );
  } else {
    // ✅ Android/iOS ke liye auto config
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(ChangeNotifierProvider(
    create: (conext) => ThemeProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
