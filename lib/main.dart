import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/search.dart';
import 'views/result.dart';
import 'services/comunication_google_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'views/profile.dart';


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  configurateModelGoogleAI();
   runApp(
    MaterialApp(
      home: const LoginScreen(),
      routes:{
        '/search': (context) => const SearchScreen(),
        '/result': (context) => const ResultScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen()
      },
    )
  );
}