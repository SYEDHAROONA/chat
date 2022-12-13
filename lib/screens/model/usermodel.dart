// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
    Usermodel({
        required this.userId,
        required this.username,
        required this.firstname,
        required this.lastname,
        required this.password,
        required this.email,
        required this.profilePicture,
    });

    String userId;
    String username;
    String firstname;
    String lastname;
    String password;
    String email;
    String profilePicture;

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        userId: json["user_id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "password": password,
        "email": email,
        "profile_picture": profilePicture,
    };
}
