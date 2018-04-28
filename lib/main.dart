import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

void main() {
  runApp(new MyApp());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(StoreProvider.of(context));
    print(StoreProvider.of<int>(context));
    return new Center(
      child: new StoreConnector<int, String>(
        converter: (store) => store.state.toString(),
        builder: (context, count) {
          return new Text('$count');
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final store = new Store<int>(counterReducer, initialState: 1);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(store);
    return new StoreProvider<int>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter',
        home: new App(),
      ),
//      child: new MaterialApp(
//        title: title,
//        theme: new ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: new Scaffold(
//          appBar: new AppBar(
//            title: new Text(title),
//          ),
//          body: new Center(
//            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                new Text('You have pushed so many times:'),
//                new StoreConnector<int, String>(
//                  converter: (store) => store.state.toString(),
//                  builder: (context, count) {
//                    return new Text(
//                      count,
//                      style: Theme.of(context).textTheme.display1,
//                    );
//                  },
//                )
//              ],
//            ),
//          ),
//          floatingActionButton: new StoreConnector<int, VoidCallback>(
//            builder: (context, callback) => new FloatingActionButton(
//                  onPressed: callback,
//                  tooltip: 'Increment',
//                  child: new Icon(Icons.add),
//                ),
//            converter: (store) {
//              return () => store.dispatch(Actions.Increment);
//            },
//          ),
//        ),
//      ),
    );
  }
}
