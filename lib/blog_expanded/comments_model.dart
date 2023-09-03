import 'package:json_annotation/json_annotation.dart';
part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel{
  String user_id, display_title, blog_id, comment_content;
  CommentsModel({
    required this.user_id,
    required this.display_title,
    required this.blog_id,
    required this.comment_content,
  });
  factory CommentsModel.fromJSON(Map<String, dynamic> data) =>_$CommentsModelFromJson(data);
  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}