import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.name, this.email, this.fullName, this.id);

  @JsonKey(required: true)
  String id;

  String name;
  String email;

  @JsonKey(name: "full_name")
  String fullName;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
