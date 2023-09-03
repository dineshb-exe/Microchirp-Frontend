import 'package:json_annotation/json_annotation.dart';
part 'global_blog_model.g.dart';

@JsonSerializable()
class GlobalBlogModel{
  String user_id, display_title, blog_id, blog_content, uploaded_at;
  int like_count;
  GlobalBlogModel({
    required this.user_id,
    required this.display_title,
    required this.blog_id,
    required this.blog_content,
    required this.uploaded_at,
    required this.like_count
  });
  factory GlobalBlogModel.fromJSON(Map<String, dynamic> data) =>_$GlobalBlogModelFromJson(data);
  Map<String, dynamic> toJson() => _$GlobalBlogModelToJson(this);
}