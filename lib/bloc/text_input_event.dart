abstract class TextInputEvent {}

class TextChanged extends TextInputEvent {
  final String newText;
  TextChanged(this.newText);
}
