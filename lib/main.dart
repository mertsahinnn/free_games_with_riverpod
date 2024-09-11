import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_games_with_riverpod/pages/home_page_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Games Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromARGB(28, 33, 38, 1),
        cardTheme: const CardTheme(color: Color.fromRGBO(29, 33, 38, 1)),
        drawerTheme: const DrawerThemeData(backgroundColor: Color.fromRGBO(29, 33, 38, 1)),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(18, 20, 23, 1),
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.white70)
        ),
        useMaterial3: true,
      ),
      home: const HomePageView(),
    );
  }
}