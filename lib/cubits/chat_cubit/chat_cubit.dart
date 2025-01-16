import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:snipers/consts/consts.dart';

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
    messages
        .orderBy(kCreatedAt, descending: true)
        .snapshots()
        .listen((event) {});
    emit(ChatSuccess());
  }
}
