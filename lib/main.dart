import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "log in": (context) => const LogIn(),
          "welcome": (context) => const Welcome(),
        },
        theme: ThemeData(
            // fontFamily:
            // primarySwatch: Colors.blue,
            ),
        home: const Welcome());
  }
}
