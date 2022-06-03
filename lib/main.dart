import 'package:flutter/material.dart';
import 'package:twitter_clone/pages/details_page.dart';
import 'package:twitter_clone/pages/home_page.dart';
import 'package:twitter_clone/pages/profile_page.dart';
import 'package:twitter_clone/theme/apptheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone App',
      initialRoute: 'home',
      theme: AppTheme.lightTheme,
      routes: {
        'home': (_) => const HomePage(),
        'details': (_) => const DetailsPage(),
        'profile': (_) => const ProfilePage(),
      },
    );
  }
}
