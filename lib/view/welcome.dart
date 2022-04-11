import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register_users/view/restricted.dart';
import '../model/rounded_button.dart';
import 'login.dart';
import 'register.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String id = 'welcome';

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2015/05/19/07/44/browser-773215_960_720.png'),
                      height: 160.0,
                      width: 160.0,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Register and Login',
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, Register.id);
              },
            ),
            RoundedButton(
              title: 'Member\'s Page',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, Restricted.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
