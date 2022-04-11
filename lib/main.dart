import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'view/chat.dart';
import 'view/login.dart';
import 'view/register.dart';
import 'view/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirebaseLoginRegister());
}

class FirebaseLoginRegister extends StatelessWidget {
  const FirebaseLoginRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        Chat.id: (context) => const Chat(),
      },
    );
  }
}
