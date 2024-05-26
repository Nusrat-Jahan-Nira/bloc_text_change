import 'package:bloc_text_change/bloc/text_input_event.dart';
import 'package:bloc_text_change/bloc/textinput_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextInputBloc extends Bloc<TextInputEvent, TextInputState> {
  TextInputBloc() : super(TextInputInitial('')) {
    on<TextChanged>((event, emit) {
      emit(TextInputInitial(event.newText));
    });
  }
}

