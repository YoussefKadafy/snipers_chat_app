import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:snipers/consts/consts.dart';
import 'package:snipers/models/messageModel.dart';
import 'package:snipers/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'chatScreen';
  final scrollController = ScrollController();
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessages);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<MessageModel> messageList = [];
            for (var i = 0; i < snapShot.data!.docs.length; i++) {
              messageList.add(
                MessageModel.fromJson(snapShot.data!.docs[i]),
              );
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 50,
                      ),
                      Text(
                        'Snipers',
                        style: TextStyle(
                            color: Color(0xffFFCB45), fontFamily: 'pacifico'),
                      )
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == email
                              ? ChatBubble(
                                  messageModel: messageList[index],
                                )
                              : ChatBubbleForFriend(
                                  messageModel: messageList[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller,
                        onSubmitted: (data) {
                          message.add({
                            'text': data,
                            kCreatedAt: DateTime.now(),
                            'id': email,
                          });
                          controller.clear();
                          scrollController.animateTo(0,
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
