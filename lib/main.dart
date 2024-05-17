import 'package:flutter/material.dart';
import 'views/result.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Agente de viagem digital'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void result(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const Result(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              TextFormField(decoration:const InputDecoration(labelText: 'Digite seu destino: ')),
              TextFormField(decoration:const InputDecoration(labelText: 'Digite quantos dias você vai viajar: ')),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: result, child: const Text("Buscar roteiro"))
            ],
          ),
        ),
      ),
    );
  }
}