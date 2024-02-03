import 'package:flutter/material.dart';

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
        itemCount: 15,
        itemBuilder:(BuildContext context, int index){
          return ListTile(
            leading: Icon(Icons.plus_one),
            title: Text('Happy Nation'),
            subtitle: Text('\$6.9M'),
          );
        }
    )
    ) ;
  }
}
