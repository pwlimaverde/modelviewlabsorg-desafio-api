import 'package:flutter/material.dart';

final class MessageModel {
  final String title;
  final String message;
  final MessageType type;
  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType {
  error(color: Colors.redAccent),
  info(color: Colors.blueAccent);

  final Color color;
  const MessageType({required this.color});
}
