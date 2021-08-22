import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_trackerfl/app/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_trackerfl/services/auth.dart';
import 'package:time_trackerfl/services/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Provider<AuthBase>(
              create: (context)=>Auth(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Time Tracker",
                theme: ThemeData(
                  primarySwatch: Colors.indigo,
                ),
                home: Scaffold(
                  body: Center(
                    child: Text("Oups...Something went wrong"),
                  ),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Provider<AuthBase>(
              create: (context)=>Auth(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Time Tracker",
                theme: ThemeData(
                  primarySwatch: Colors.indigo,
                ),
                home: LandingPage(),
              ),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Time Tracker",
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: Scaffold(
              body: Center(
                child: LinearProgressIndicator(),
              ),
            ),
          );
        });
  }
}
