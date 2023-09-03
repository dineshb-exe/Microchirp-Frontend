// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      user_id: json['user_id'] as String,
      display_title: json['display_title'] as String,
      blog_id: json['blog_id'] as String,
      comment_content: json['comment_content'] as String,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'display_title': instance.display_title,
      'blog_id': instance.blog_id,
      'comment_content': instance.comment_content,
    };
