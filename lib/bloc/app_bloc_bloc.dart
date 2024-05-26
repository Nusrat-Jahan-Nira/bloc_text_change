// text_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:bloc_text_change/bloc/app_bloc_event.dart';
import 'package:bloc_text_change/bloc/app_bloc_state.dart';
import 'package:flutter/material.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial(text: 'Initial Text',color: Colors.black )) {
    on<ChangeTextEvent>((event, emit) {

      // Handle the event and emit a new state if needed
      emit(SnackBarShown());

      // Handle the event and emit a new state with updated text
      emit(TextInitial(text: 'Text Changed finally !',color:  Colors.red));
    });
  }
}
