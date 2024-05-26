// For DropdownBloc
abstract class DropdownState {}

class DropdownInitial extends DropdownState {
  final String selectedValue;
  DropdownInitial(this.selectedValue);
}
