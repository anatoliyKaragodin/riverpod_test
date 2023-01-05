part of 'main.dart';

final colorStateProvider = StateProvider<ChangeButton>((ref) {
  return ChangeButton(backgroundColor: Colors.grey, label: 'Grey button');
});