class AuthArgs {
  final String email;
  final String password;
  String ? access;
  String ? refresh;
  AuthArgs({required this.email, required this.password});
}


class AuthValues {

  final String email;
  final String firstName;
  final String lastName;
  final String position;
  final String accessLevel;
  final String windowNumber;
  
  AuthValues(
      {
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.position,
      required this.accessLevel,
      required this.windowNumber});

  AuthValues.fromJson(Map<String, dynamic> json)
      : 
        email = json['email'] ?? '',
        firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        position = json['position'] ?? '',
        accessLevel = json['accessLevel'] ?? '',
        windowNumber = json['windowNumber'] ?? '';
}

