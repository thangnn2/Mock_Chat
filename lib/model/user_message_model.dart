import 'package:json_annotation/json_annotation.dart';

part 'user_message_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserMessageModel {
  final String? email;
  final String? name;
  final String? userId;
  final ChatToModel? chatToModel;

  UserMessageModel({this.email, this.name, this.userId, this.chatToModel});

  factory UserMessageModel.fromJson(Map<String, dynamic> json) => _$UserMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessageModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChatToModel {
  final String? lastContent;
  final String? userChatToId;
  final String? msCount;
  final DateTime? lastMessageTime;

  ChatToModel({this.lastContent, this.userChatToId, this.msCount, this.lastMessageTime});

  factory ChatToModel.fromJson(Map<String, dynamic> json) => _$ChatToModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToModelToJson(this)}