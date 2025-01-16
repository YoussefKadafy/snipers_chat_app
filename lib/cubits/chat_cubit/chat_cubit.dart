import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:snipers/consts/consts.dart';
import 'package:snipers/models/messageModel.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);

  void sendMessage({required String message, required String email}) {
    messages.add({
      'text': message,
      kCreatedAt: DateTime.now(),
      'id': email,
    });
  }

  void getMessage() {
    List<MessageModel> messageList = [];
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      for (var element in event.docs) {
        messageList.add(MessageModel.fromJson(element));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
