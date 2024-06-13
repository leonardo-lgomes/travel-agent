import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future signOut() async{
    await googleSignIn.signOut();
    navigateToLogin();
  }

  navigateToLogin(){
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tela de perfil")
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
            child: Form(
              child: Column(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(50.0), child: Image.network(data.urlImage)),
                  Text('Olá ${data.name}'),
                  Text('Seu email é: ${data.email}'),
                  const SizedBox(height: 20),
                  const Divider(endIndent: 1.0),
                  ElevatedButton(
                  onPressed: signOut,
                  style:ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.red)
                  ),
                  child: const Text('Sair da conta')
                  ),
                ],
              ),
          ),
        ),
      ),
     );
  }
}