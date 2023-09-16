import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  const UserInfo({
    this.email,
    this.carName,
    this.carMileage,
    this.city,
  });

  final String? email;
  final String? carName;
  final double? carMileage;
  final String? city;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
