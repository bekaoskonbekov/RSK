class UserModel {
  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.refresh,
    this.id,
    this.userid,
    this.password_confirm
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? refresh;
  String? id;
  String? userid;
  String? password_confirm;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        refresh: json["refresh"],
        id: json["_id"],
        userid: json["userid"],
        password_confirm: json["password_confirm"]
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "refresh": refresh,
        "_id": id,
        "userid": userid,
        "password_confirm": password_confirm
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        refresh: json["refresh"],
        id: json["_id"],
        userid: json["userid"],
        password_confirm: json["password_confirm"]
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "refresh": refresh,
        "_id": id,
        "userid": userid,
        "password_confirm": password_confirm
      };
}
