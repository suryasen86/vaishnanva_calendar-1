import 'package:redux/redux.dart';

import 'package:redux_thunk/redux_thunk.dart';
import 'action/main_action.dart';

import 'reducer/main_reducer.dart';


final store = Store(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [
      thunkMiddleware
      ]

    // middleware: [thunkMiddleware],
);