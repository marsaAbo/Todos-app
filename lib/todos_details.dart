import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class TodosDetails extends StatefulWidget{
  String appbarTitle;
  TodosDetails(this.appbarTitle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodosDetailsState(this.appbarTitle);
  }

}

class TodosDetailsState extends State<TodosDetails>{

  Box taskBox;

  String appbarTitle;
  TodosDetailsState(this.appbarTitle);
  static var _priorities = ['Hight' , 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState(){
    super.initState();
    taskBox = Hive.box("task");
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    // TODO: implement build
    return //WillPopScope(
     /* onWillPop: (){
        goToLastScreen();
      },*/
       Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
          leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: (){
                goToLastScreen();
      }
        ),
        ),
        body:  Padding(
              padding: EdgeInsets.only(top: 2.0, left: 10.0, right: 10.0 , bottom: 2.0),
              child: ListView(
                   children: <Widget>[
                     Padding(
                      padding: EdgeInsets.only(top: 100.0 , bottom: 15.0),
                      child: TextField(
                        controller: titleController,
                        style: textStyle,
                        onChanged: (value){
                          debugPrint('Some onr changed in tiitle ');
                        },
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 15.0 , bottom: 15.0),
                      child: TextField(
                        controller: descriptionController,
                        style: textStyle,
                        onChanged: (value){
                          debugPrint('Some onr changed in tiitle ');
                        },
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 15.0 , bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                                color: Theme.of(context).primaryColorDark,
                                textColor: Theme.of(context).primaryColorLight,
                                child: Text('Save' , textScaleFactor: 1.1,),

                                onPressed: (){
                                  final values = [titleController.text ,descriptionController.text];

                                  taskBox.add(values);


                                  setState(() {
                                    Navigator.pop(context);

                                  });
                                }
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),




    );
  }

  void goToLastScreen(){
    Navigator.pop(context);
  }

  void UpdateTitle(){
    
  }

}