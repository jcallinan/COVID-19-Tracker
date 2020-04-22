// models/user.dart
class User {
  String firstName = '';
  String lastName = '';
  double Temperature = 0.0;
  String DateTimeTaken;
  bool newsletter = false;
  save() {
    print('saving user');
  }
}