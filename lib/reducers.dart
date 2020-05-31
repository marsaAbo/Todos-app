import 'package:todos/states.dart';
import 'package:todos/action.dart';

 AppState appStateReducer(AppState state , action ) {
   return AppState(
       mydata: mydataReducer(state.mydata , action)
   );
 }

   List<MyData> mydataReducer(List<MyData> state , action){
      if(action is AddMyDataAction){
        return []
            .. addAll(state)
            ..add(MyData(id: action.id, title: action.title, disc: action.disc));
      }

      if(action is DeleteMyDataAction){
        return List.unmodifiable(List.from(state)..remove(action.myData));
      }

      return state;

}