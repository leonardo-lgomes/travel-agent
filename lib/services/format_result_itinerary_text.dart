import 'dart:convert';
import 'package:travelagent/models/result_itinerary.dart';


formatResultItineraryText(String json){  
  try {
    var teste = jsonDecode(json);
    var resultItinerary = ResultItinerary.fromJson(teste);
    return resultItinerary;
  } on Exception catch (e) {
    print(e);
  }
}