import 'package:chat_app/page/chats_page.dart';
import 'package:chat_app/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'api/firebase_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Text Me';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(scaffoldBackgroundColor: Colors.yellow.shade700),
      home: ChatsPage(),
    );
  }
}
