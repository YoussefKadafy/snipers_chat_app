import 'package:flutter/material.dart';

class MessageModel {
  final String text;
  final String id;

  MessageModel({
    required this.text,
    required this.id,
  });
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(text: jsonData['text'], id: jsonData['id'] ?? '');
  }
}
