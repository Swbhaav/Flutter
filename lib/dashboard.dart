import 'package:flutter/material.dart';
import 'package:form/service/dio_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: [
          GestureDetector(child: Icon(Icons.star_border_outlined),onTap: (){
            final dioService= DioService();
            dioService.getSampleData();
          },),
        ],
      ),
      body: Column(children: [
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQit7M8xus6aTFyuKlFIJVsXulrfOE7--gRrw&usqp=CAU',width: 150, height: 150,),
        SizedBox(height: 25,),
        Text('Nepal',style: TextStyle(fontSize: 30),),
        SizedBox(height: 25,),
        Text('Description 1 Lyrics.com is a vast compilation of song lyrics, album details, and featured video clips for a seemingly endless array of artists — collaboratively assembled by our large music community and contributing editors.'),
        SizedBox(height: 25,),
        Text('Description 2'),

      ],),
    );
  }
}
