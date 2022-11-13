import 'package:fina/screens/H_W.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'models/models.dart';
import 'screens/screens.dart';

// profile pic
// user info qustions                                      {{salh}}
// profile page shows user info                            {{malek}} Done
// calculating base goal calories for users atomaticlly
// fat percentage calcuator ((if we have time))            {{rami}}
// sorting system                                          {{shaker}} Done
// recommandation system (filter)
// clear all button in cart screen                         {{shaker}} almost Done {{scroll physics}} {{delete button still does not working as it should be}}
// making details page scrollable                          {{shaker}}             {{scroll physics}}
// splash screen
// app icon    and name                                    done by malek
// show dialog for sgin out                                done by malek
// show dialog when the user add item to his cart
// send notifications                                      {{mohammad}} almost done
// show info about nutritions  {{with api}}
// show healht rleated news with api ((IF we have time))
// water animation for water counter ((IF we have time))
// cached network image                                    {{shaker}}  done
// send email verification
// add new Category bakers , soft drink , sweets
// add Home Page (image slider for categories)

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
          // "birth": (context) => const Birth(),
          "H_W": (context) => const H_W(),
        },
        home: isLogin == true ? const HomePage() : const Welcome());
  }
}
