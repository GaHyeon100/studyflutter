import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; //생성된 코드가 g.dart 파일에 배치됨 (클래스의 인스턴스를 JSON으로 변환하는데에 사용됨)

@JsonSerializable()
class UserModel extends Equatable {
  final String? uid;
  final String? name;
  final String? email;

  const UserModel({
    this.uid,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
      ];
}
