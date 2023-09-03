import 'package:json_annotation/json_annotation.dart';
part 'pre_login_model.g.dart';
@JsonSerializable()
class PreLogin{
  PreLogin({required this.username, required this.password});
  String username, password; // Reminder to alter the endpoint to receive userID instead of user_id
  factory PreLogin.fromJSON(Map<String, dynamic> data) =>_$PreLoginFromJson(data);
  Map<String, dynamic> toJson() => _$PreLoginToJson(this);
}