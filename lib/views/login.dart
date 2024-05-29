import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState  extends State<LoginScreen>{
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String ?userName = "";
  String ?userEmail = "";
  String ?imageUrl = "";
  User user = User("","");

  Future<void> tryToGoogleLogin()async{
    final result = await _googleLogin();
    result ? login() : _showError();
  }

  Future<bool> _googleLogin() async{
    await googleSignIn.signIn().then((value){
      userName = value!.displayName;
      userEmail = value.email;
      imageUrl = value.photoUrl;
    });
    
    user = User(userName??"", userEmail??"");

    return userName != '' ? true : false;
  }

  _showError(){
    print("Erro ao entrar");
  }

  login(){
    Navigator.pushNamed(context, '/search', arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tela Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email '),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Senha: '),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => print("teste"),
                    child: const Text("Fazer login"),
                  ),
                  const Divider(endIndent: 1.0),
                  ElevatedButton(
                    onPressed: () => tryToGoogleLogin(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(Icons.g_mobiledata),
                         Text("Entrar com google"),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }

}
