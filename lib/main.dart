import 'package:flutter/material.dart';
import 'views/search.dart';
import 'views/result.dart';
import 'services/comunication_google_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   runApp(
    MaterialApp(
      home: const SearchScreen(),
      routes:{'/result': (context) => const ResultScreen()},
    )
  );
  configurateModelGoogleAI();
}