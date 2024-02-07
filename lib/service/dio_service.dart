
import 'package:dio/dio.dart';

class DioService{
  final dio=Dio();
  void getSampleData(){
    final response =dio.get('https://jsonplaceholder.typicode.com/todos/1');
    print('The Dio Response is $response');
  }
}