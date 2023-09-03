// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLogin _$PostLoginFromJson(Map<String, dynamic> json) => PostLogin(
      jwtValue: json['jwtValue'] as String,
      userID: json['userID'] as String,
    );

Map<String, dynamic> _$PostLoginToJson(PostLogin instance) => <String, dynamic>{
      'jwtValue': instance.jwtValue,
      'userID': instance.userID,
    };
