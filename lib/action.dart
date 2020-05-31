import 'package:todos/states.dart';

class AddMyDataAction{
  static int _id = 0;
  final String title;
  final String disc;

  AddMyDataAction({this.title , this.disc}){
    _id++;
  }
  int get id => _id;
}

class DeleteMyDataAction{
  final MyData myData;

  DeleteMyDataAction(this.myData);
}