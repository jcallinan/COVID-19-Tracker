// models/user.dart
class User {
  String firstName = '';
  String lastName = '';
  double temperature = 0.0;
  String dateTimeTaken;
  String notes;
  save() {
    print('saving user');
  }
}