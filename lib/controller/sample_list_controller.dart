

import 'package:get/get.dart';

class SampleListController extends GetxController{
  var sampleList = [].obs;

  insertDataIntoList(String data){
    sampleList.add(data);
  }
  deleteDataFromList(String data){
    sampleList.remove(data);
  }
}