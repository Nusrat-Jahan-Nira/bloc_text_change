// text_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bloc_text_change/bloc/app_bloc_event.dart';
import 'package:bloc_text_change/bloc/app_bloc_state.dart';
import 'package:flutter/material.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial(text: 'Initial Text',color: Colors.black )) {
    on<TextEvent>((event, emit) {

      // Handle the event and emit a new state with updated text
      if (event is ChangeTextEvent) {
        emit(TextInitial(text: 'Text Changed finally !', color: Colors.red));
      }
      else if(event is ShowSnackBarEvent){
        // Handle the event and emit a new state if needed
        emit(SnackBarShown());
      }

    });
  }
}

// class TextBloc extends Bloc<TextEvent, TextState> {
//   TextBloc() : super(TextInitial(text: 'Initial Text',color: Colors.black ));
//
//   @override
//   Stream<TextState> mapEventToState(TextEvent event) async* {
//     if (event is ShowSnackBarEvent) {
//       // Add logic to handle ShowSnackBarEvent
//       yield SnackBarShown();
//     } else if (event is ChangeTextEvent) {
//       // Add logic to handle ChangeTextEvent
//     }
//   }
// }

