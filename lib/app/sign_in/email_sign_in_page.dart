import 'package:flutter/material.dart';
import 'package:time_trackerfl/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:time_trackerfl/app/sign_in/email_sign_in_form_change_notifier.dart';
import 'package:time_trackerfl/app/sign_in/email_sign_in_form_stateful.dart';
import 'package:time_trackerfl/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormChangeNotifier.create(context),
          ),
        ),
      ),
    );
  }
}
