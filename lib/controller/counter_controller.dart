
import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter = 0.obs;
  var counter1 = 0;
  var sampleList = [].obs;

  increment(){
    counter++;
    print('Increment valuse $counter');
  }

  decrement(){
    counter--;
    print('Decrement value is $counter');
  }
}