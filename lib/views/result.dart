import 'package:flutter/material.dart';
import 'package:travelagent/models/itinerary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Itinerary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:const Text("Roteiro pronto! veja só:"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('Seu roteiro para ${data.city} é de ${data.days} dias'),
            ],
          ),
        ),
      ),
    );
  }
}