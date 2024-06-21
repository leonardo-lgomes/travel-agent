import 'package:google_generative_ai/google_generative_ai.dart';
import '../models/result_itinerary.dart';
import '../services/format_result_itinerary_text.dart';

GenerativeModel model = GenerativeModel(model: '', apiKey: '');

configurateModelGoogleAI(){
  model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: const String.fromEnvironment('API_KEY')
  );
}
Future<ResultItinerary> sendMessageGoogleAI(String city, int days) async{
  final chat = model.startChat();
  final defaultFormatJson = {"title":"","description":"","days":[{"day":"1 ou 2 ou 3 ou 4...","title":"","description":"","activities":[{"name":"","description":"","time":"","type":""}]}]};
  final prompt = 'Por favor, forneça um roteiro de $days dias para $city em formato JSON sem caracteres de escape, em uma única linha e não esqueça de que todas as propriedades e valores contém aspas em volta, siga padrão a seguir: $defaultFormatJson';
  var response = await chat.sendMessage(Content.text(prompt));
  var result = formatResultItineraryText(response.text??"");
  return result;
}

Future<ResultItinerary> fakeSendMessageGoogleAI(String city, int days) async{
  var response = '{"title":"roteiro de maceió para x dias","description":"cidade linda", "days":[{"day":"1","title":"titulo do dia","description":"desc do dia desc do dia desc do dia desc do dia desc do diadesc do dia desc do dia","activities":[{"name":"atividade do dia","description":"desc da atividade desc da atividade desc da atividade desc da atividade","time":"13h","type":"tipo da atividade"}, {"name":"2ª atividade do dia","description":"desc da 2ª atividade","time":"13h","type":"tipo da atividade"}]},{"day":"2","title":"titulo do dia 2","description":"desc do dia","activities":[{"name":"atividade do dia","description":"desc da atividade desc da atividade desc da atividade desc da atividade desc da atividade","time":"13h","type":"tipo da atividade"}]}]}';
  var result = formatResultItineraryText(response);
  return result;
}


