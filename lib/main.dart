import 'package:flutter/material.dart';
import 'views/search.dart';
import 'views/result.dart';

void main(){
   runApp(
    MaterialApp(
      home: const SearchScreen(),
      routes:{'/result': (context) => const ResultScreen()},
    )
  );
}