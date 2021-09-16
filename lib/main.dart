import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/strings/main_strings.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();

  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({required this.app});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eat It App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(app: app),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FirebaseApp app;

  MyHomePage({required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurantText,
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: FutureBuilder(
        future:
            FirebaseDatabase(app: app).reference().child('Restaurant').once(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Center(
              child: Text('Load ok'),
            );
        },
      ),
    );
  }
}
