import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yts/providers/count_provider.dart';
import 'package:yts/providers/movie_provider.dart';
import 'package:yts/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // we can use one provider at a time but since, there are always different modules
    // we tend to use MultiProvider widget
    return MultiProvider(
      providers: [
        // providers should be categorized well to keep track and separate
        // all the modules and their respective variables
        ChangeNotifierProvider(create: (context)=> CountProvider()),
        ChangeNotifierProvider(create: (context)=> MovieProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
            fontFamily: 'Poppins'
        ),
          initialRoute: '/',
          routes: {
            // '/': (context)=> HomeLayout(),
            '/': (context)=> welcome(),
            // '/trending': (context)=> TrendingMovieScreen(),
            // '/categories': (context)=> CategoriesMovieScreen(),
          }
      ),
    );
  }
}

