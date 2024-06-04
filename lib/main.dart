import 'package:flutter/material.dart';
import 'package:medicine/auth_view_model.dart';
import 'package:medicine/feed.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicine/provider.dart';
import 'package:medicine/snackbar.dart';
import 'package:medicine/start.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Shop());
}

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "teri maa ki chut",
        theme: ThemeData.dark(),
        // initialRoute: Start.routeName,
        home: const Start(), // Set Start as the home screen
      ),
    );
  }
}
