
import 'package:flutter/material.dart';
import 'Model/top_box_office_model.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Page'),
        centerTitle: true,
      ),
    body: ListView.builder(
        itemCount: topBoxOfficeList.length,
        itemBuilder:(BuildContext context, int index){
          final topBoxOfficeData = topBoxOfficeList[index];
          return ListTile(
            leading: Icon(topBoxOfficeData.icon),
            title: Text(topBoxOfficeData.title ?? 'Title'),
            subtitle: Text('\$ ${topBoxOfficeData.revenue} M'),
          );
        }
    )
    ) ;
  }
}
