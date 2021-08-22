import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_trackerfl/app/sign_in/email_sign_in_page.dart';
import 'package:time_trackerfl/app/sign_in/sign_in_manager.dart';
import 'package:time_trackerfl/app/sign_in/sign_in_btn.dart';
import 'package:time_trackerfl/app/sign_in/social_sign_in_btn.dart';
import 'package:time_trackerfl/services/auth.dart';
import 'package:time_trackerfl/widgets/show_exception_alert_dialog.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key key, @required this.manager, @required this.isLoading }) : super(key: key);
  final SignInManager manager;
  final bool isLoading;
  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          // dispose: (_,bloc)=>bloc.dispose(),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) => SignInPage(manager: manager, isLoading: isLoading.value,),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(context,
        title: 'Sign in failed', exception: exception);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      //final auth = AuthProvider.of(context);
      await manager.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => EmailSignInPage()));
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
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                child: _buildHeader(),
              ),
              SizedBox(height: 48),
              SocialSignInButton(
                assetName: "images/google-logo.png",
                text: "Sign in with Google",
                textColor: Colors.black87,
                color: Colors.white,
                onPressed: isLoading ? null : () => _signWithGoogle(context),
              ),
              SizedBox(height: 8.0),
              SocialSignInButton(
                assetName: "images/facebook-logo.png",
                text: "Sign in with Facebook",
                color: Color(0xFF334D92),
                textColor: Colors.white,
                onPressed: isLoading ? null : () => _signWithFacebook(context),
              ),
              SizedBox(height: 8.0),
              SignInButton(
                text: "Sign in with email",
                color: Colors.teal[700],
                textColor: Colors.white,
                onPressed: isLoading ? null : () => _signInWithEmail(context),
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
                onPressed: isLoading ? null : () => _signInAnonymously(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      "Sign in",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    );
  }
}
