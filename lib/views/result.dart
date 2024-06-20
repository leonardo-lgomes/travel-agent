import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../models/result_itinerary.dart';
import '../services/comunication_google_service.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Itinerary;

    Container buildStyleDescriptionActivities(ActivitiesResultItinerary activities){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${activities.time??""} - ${activities.name??""}'),
              Text(activities.description??""),
            ],
          ),
        )
      );
    }

    Column buildActivitiesOfTheDay(List<ActivitiesResultItinerary> activities)
    {
      List<Widget> list = [];
      for(var i = 0; i < activities.length; i++){
          list.add(buildStyleDescriptionActivities(activities[i]));
          list.add(Text("Categoria: " '${activities[i].type??""}'));
      }
      return Column(children: list);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Roteiro pronto! veja só:"),
      ),
      body:FutureBuilder<ResultItinerary>(
        future: sendMessageGoogleAI(data.city, data.days),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<DayResultItinerary> listDays = snapshot.data!.days!; 

            return ListView.builder(
              itemCount: listDays.length,
              itemBuilder: (context, index) {
                DayResultItinerary day = listDays[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(day.title??"", style: const TextStyle(fontSize: 20.00, fontWeight:FontWeight.bold)), 
                      Row(
                        children: [
                          const Icon(Icons.circle, size: 7.0), 
                          const SizedBox(width: 8.0),
                          Text(day.description??"")
                        ],
                      ),
                      buildActivitiesOfTheDay(day.activities!),
                    const Divider(endIndent: 1.0),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Erro: ${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}