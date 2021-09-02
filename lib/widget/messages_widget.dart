import 'package:chat_app/api/firebase_api.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/widget/message_widget.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/data.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;

  const MessagesWidget({@required this.idUser, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        stream: FirebaseApi.getMessages(idUser),
        builder: (context, snapshot) {
          final messages = snapshot.data;

          return messages?.isEmpty ?? true
              ? buildText('Say Hi')
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];

                    return MessageWidget(
                      message: message,
                      isMe: message.idUser == myId,
                    );
                  },
                );
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
