import 'package:flutter/material.dart';
import '../models/itinerary.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final cityController = TextEditingController();
  final daysController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    daysController.dispose();
    super.dispose();
  }

  void navigateToResult(){
    Itinerary itinerary = Itinerary(cityController.text, int.parse(daysController.text));
    Navigator.pushNamed(context, '/result', arguments: itinerary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pesquisar destino"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(labelText: 'Digite para onde vai: '),
                  ),
                  TextFormField(
                    controller: daysController,
                    decoration: const InputDecoration(labelText: 'Digite quantos dias você vai viajar: '),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: navigateToResult,
                    child: const Text("Fazer busca"),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}