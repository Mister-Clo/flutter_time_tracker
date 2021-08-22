import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_trackerfl/services/auth.dart';
import 'package:time_trackerfl/services/auth_provider.dart';
import 'package:time_trackerfl/widgets/show_alert_dialog.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context,listen: false);
      await auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
     final didRequestSignOut = await showAlertDialog(
         context,
         title: 'Logout',
         content: 'Confirm Logout',
         cancelActionText: 'Cancel',
         defaultActionText: 'OK',
     );
     if(didRequestSignOut == true) _signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => _confirmSignOut(context),
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
