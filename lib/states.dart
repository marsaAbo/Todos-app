import 'package:flutter/foundation.dart';

@immutable

class MyData{
  final int id;
  final String title;
  final String disc;

  MyData({@required this.id , @required this.title , @required this.disc});

  MyData CopyWith({int id , String title , String disc}){
    return MyData(
      id: id ?? this.id,
      title: title ?? this.title,
      disc: disc ?? this.disc,
    );

}

}

class AppState{
  final List<MyData> mydata;

  AppState({@required this.mydata});

  AppState.initialState() :mydata = List.unmodifiable(<MyData>[]);
}
