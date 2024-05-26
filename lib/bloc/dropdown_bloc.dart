// DropdownBloc
import 'package:bloc_text_change/bloc/dropdown_event.dart';
import 'package:bloc_text_change/bloc/dropdown_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownInitial('Select an option')) {
    on<DropdownValueChanged>((event, emit) {
      emit(DropdownInitial(event.newValue));
    });
  }
}
