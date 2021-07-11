import 'package:flutter/material.dart';
import 'package:time_trackerfl/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;

  const HomePage({Key key, this.auth}) : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              "Log out",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
