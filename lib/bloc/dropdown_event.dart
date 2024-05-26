// For DropdownBloc
abstract class DropdownEvent {}

class DropdownValueChanged extends DropdownEvent {
  final String newValue;
  DropdownValueChanged(this.newValue);
}