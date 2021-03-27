import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackerfl/app/sign_in/sign_in_btn.dart';
import 'package:time_trackerfl/app/sign_in/social_sign_in_btn.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);

  final void Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredentials.user);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Time Tracker'),
        elevation: 2,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign in",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 48),
              SocialSignInButton(
                assetName: "images/google-logo.png",
                text: "Sign in with Google",
                textColor: Colors.black87,
                color: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 8.0),
              SocialSignInButton(
                assetName: "images/facebook-logo.png",
                text: "Sign in with Facebook",
                color: Color(0xFF334D92),
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 8.0),
              SignInButton(
                text: "Sign in with email",
                color: Colors.teal[700],
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(height: 8.0),
              Text(
                'or',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, color: Colors.black87),
              ),
              SizedBox(height: 8.0),
              SignInButton(
                text: "Go Anonymous",
                color: Colors.lime[300],
                textColor: Colors.black,
                onPressed: _signInAnonymously,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
