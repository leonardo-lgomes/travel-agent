import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Roteiro pronto! veja só:"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("teste teste testeteste testetestetestetesteteste testetesteteste"),
            ],
          ),
        ),
      ),
    );
  }
}