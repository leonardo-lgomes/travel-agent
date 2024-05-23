import 'package:google_generative_ai/google_generative_ai.dart';
  
GenerativeModel model = GenerativeModel(model: '', apiKey: '');

configurateModelGoogleAI(){
  model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: const String.fromEnvironment('API_KEY')
  );
}

Future<String> sendMessageGoogleAI(String city, int days) async{
  final chat = model.startChat();
  final prompt = 'Por favor faça um roteiro de viagem de $city para $days dias';
  var response = await chat.sendMessage(Content.text(prompt));
  return response.text?? "aguardando resposta";
  }


