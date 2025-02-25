import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

part 'user_model.g.dart'; //생성된 코드가 g.dart 파일에 배치됨 (클래스의 인스턴스를 JSON으로 변환하는데에 사용됨)

@JsonSerializable()
class UserModel extends Equatable {
  final String? uid;
  final String? nickname;
  final double? temperature;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserModel({
    this.uid,
    this.nickname,
    this.updatedAt,
    this.createdAt,
    this.temperature,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.create(String name, String uid) {
    return UserModel(
      nickname: name,
      uid: uid,
      temperature: Random().nextInt(100) + 1,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        uid,
        nickname,
        temperature,
        createdAt,
        updatedAt,
      ];
}
