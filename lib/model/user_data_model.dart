// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDataModel {
  final int userId;
  final String userName;
  final String userEmail;
  final int userAge;
  final double userWeight;
  final double userHeight;

  UserDataModel(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.userAge,
      required this.userWeight,
      required this.userHeight});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userAge': userAge,
      'userWeight': userWeight,
      'userHeight': userHeight,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      userId: map['userId'] as int,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      userAge: map['userAge'] as int,
      userWeight: map['userWeight'] as double,
      userHeight: map['userHeight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserDataModel copyWith({
    int? userId,
    String? userName,
    String? userEmail,
    int? userAge,
    double? userWeight,
    double? userHeight,
  }) {
    return UserDataModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userAge: userAge ?? this.userAge,
      userWeight: userWeight ?? this.userWeight,
      userHeight: userHeight ?? this.userHeight,
    );
  }
}
