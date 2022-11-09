import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'models/models.dart';
import 'screens/screens.dart';

// profile pic
// user info qustions                                      {{salh}}
// profile page shows user info                            {{malek}}
// calculating base goal calories for users atomaticlly
// fat percentage calcuator ((if we have time))            {{rami}}
// sorting system                                          {{shaker}}
// recommandation system
// clear all button in cart screen                         {{shaker}}  Done
// making details page scrollable
// splash screen
// app icon
// app name
// show dialog for sgin out
// show dialog when the user add item to his cart
// send notifications                                      {{mohammad}}
// show info about nutritions
// show healht rleated news with api ((IF we have time))
// water animation for water counter

bool? isLogin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  User? user = authInstance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "sgin in": (context) => const LogIn(),
          "sgin up": (context) => const SginUp(),
          "welcome": (context) => const Welcome(),
          "homepage": (context) => const HomePage(),
          "cartpage": (context) => const CartPage(),
          "password reset": (context) => const PasswordResetPage(),
          "infoscreen": (context) => const InfoScreen(),
        },
        home: isLogin == true ? const HomePage() : const Welcome());
  }
}
