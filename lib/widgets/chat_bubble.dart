import 'package:flutter/material.dart';
import 'package:snipers/consts/consts.dart';
import 'package:snipers/models/messageModel.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.only(
          left: 15,
          top: 16,
          bottom: 16,
          right: 8,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          messageModel.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.only(
          left: 15,
          top: 16,
          bottom: 16,
          right: 8,
        ),
        decoration: BoxDecoration(
          color: Color(0xffFFCB45),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          messageModel.text,
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
