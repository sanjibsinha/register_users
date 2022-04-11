import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Restricted extends StatefulWidget {
  const Restricted({Key? key}) : super(key: key);
  static const String id = 'restricted';

  @override
  State<Restricted> createState() => _RestrictedState();
}

class _RestrictedState extends State<Restricted> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  @override
  void initState() {
    super.initState();
    /* Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    }); */

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restricted Page for users'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
