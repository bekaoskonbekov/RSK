class User {
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  String? JwtTokens;

  User(
      {this.password,
      this.email,
      this.firstName,
      this.lastName,
      this.JwtTokens});

  User.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    JwtTokens = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['token'] = this.JwtTokens;
    return data;
  }
}
