import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../models/result_itinerary.dart';
import '../services/comunication_google_service.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Itinerary;
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
                //List<ActivitiesResultItinerary>? listActivities = listDays[index].activities; 
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(day.title??""), 
                    Text(day.description??""), 
                    
                    // ListView.builder(
                    //   itemCount: listActivities!.length,
                    //   itemBuilder: (context, index) {
                    //     ActivitiesResultItinerary? activities = listActivities[index];
                    //     return Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(activities.name??""), 
                    //         Text(activities.description??""), 
                    //         Text(activities.time??""), 
                    //         Text(activities.type??""), 
                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
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