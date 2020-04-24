// models/user.dart
class User {
  String firstName = '';
  String lastName = '';
  double temperature = 0.0;
  String dateTimeTaken;
  String notes;
  User({this.firstName, this.lastName, this.temperature, this.dateTimeTaken, this.notes});

  save() {
    print('saving user');
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      temperature: json['temperature'],
      dateTimeTaken: json['dateTimeTaken'],
      notes: json['notes'],
    );
  }
}