// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalBlogModel _$GlobalBlogModelFromJson(Map<String, dynamic> json) =>
    GlobalBlogModel(
      user_id: json['user_id'] as String,
      display_title: json['display_title'] as String,
      blog_id: json['blog_id'] as String,
      blog_content: json['blog_content'] as String,
      uploaded_at: json['uploaded_at'] as String,
      like_count: json['like_count'] as int,
    );

Map<String, dynamic> _$GlobalBlogModelToJson(GlobalBlogModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'display_title': instance.display_title,
      'blog_id': instance.blog_id,
      'blog_content': instance.blog_content,
      'uploaded_at': instance.uploaded_at,
      'like_count': instance.like_count,
    };
