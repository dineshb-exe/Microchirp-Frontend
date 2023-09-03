import 'package:json_annotation/json_annotation.dart';
part 'post_login_model.g.dart';
@JsonSerializable()
class PostLogin{
  PostLogin({required this.jwtValue, required this.userID});
  String jwtValue, userID; // Reminder to alter the endpoint to receive userID instead of user_id
  factory PostLogin.fromJSON(Map<String, dynamic> data) =>_$PostLoginFromJson(data);
  Map<String, dynamic> toJson() => _$PostLoginToJson(this);
}