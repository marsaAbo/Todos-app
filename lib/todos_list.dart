import 'package:flutter/material.dart';
import 'todos_details.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todos/states.dart';
import 'package:todos/action.dart';


class TodosList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TodosListState();
  }

}

class TodosListState extends State<TodosList>{

  Box taskBox;


  @override
  void initState(){
    super.initState();
    taskBox = Hive.box("task");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos App'),
      ),

      body:  StoreConnector<AppState , _ViewModle>(
        converter: (Store<AppState> store) => _ViewModle.create(store),
        builder: (BuildContext context  , _ViewModle viewModle) =>

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                  valueListenable: taskBox.listenable(),
                  builder: (context, Box task ,_ ){
                    return getList();
                  }
              ),
            ),



      ),



      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToD('Add task');
        },
        tooltip: 'Add dos',
        child: Icon(Icons.mode_edit),
      ),
    );
  }


  ListView getList(){

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.separated(
        itemCount: taskBox.keys.toList().length,
        separatorBuilder: (_, postion) => Divider(),
        itemBuilder: (BuildContext context ,  postion){
          final key = taskBox.keys.toList()[postion];
          final value = taskBox.get(key);

          return Card(
            color: Colors.white,
            elevation: 2.0,

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(value[0] , style: titleStyle,),
              subtitle: Text(value[1]),
              trailing: IconButton(
                  icon: Icon(Icons.delete , color: Colors.grey,) ,
                  onPressed: (){
                    taskBox.delete(key);
                  }
              ),

              onTap: (){

                navigateToD('Edit Task');
              },
            ),

          );

        }


    );

  }

  void navigateToD(String title){

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return TodosDetails(title);
    }));

  }

}

class _ViewModle {
  final List<MyData> myData;
  final Function(String , String) onAdd;
  final Function(MyData) onRemove;

  _ViewModle({this.myData, this.onAdd, this.onRemove});

  factory _ViewModle.create(Store<AppState> store){
    // ignore: missing_return
    _onAdd(String title, String disc) {
      store.dispatch(AddMyDataAction(title: title, disc: disc));
    }

    // ignore: missing_return
    _onRemove(MyData myData) {
      store.dispatch(DeleteMyDataAction(myData));
    }
    return _ViewModle(
        myData: store.state.mydata,
        onAdd:  _onAdd,
        onRemove: _onRemove,

    );
  }




}
