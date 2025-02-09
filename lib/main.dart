import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/presentation/bloc/home/home_bloc.dart';
import 'package:todo_app/presentation/bloc/postApi/post_api_bloc.dart';
import 'package:todo_app/presentation/bloc/splash/splash_bloc.dart';
import 'package:todo_app/presentation/core/colors/colors.dart';

import 'presentation/ui/start/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(create: (context) => SplashBloc()..add(StartSplashEvent()  
        )),
         BlocProvider(create: (context) => HomeBloc()..add(FetchTodosEvent())),
        BlocProvider(
          create: (context) => PostApiBloc(),
        )
      ],
      child: MaterialApp(
        title: 'MY DAY', 
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: primaryColor,
            scaffoldBackgroundColor: white,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: black),
              bodyMedium: TextStyle(color: black),
              bodySmall: TextStyle(color: black),
            )),
            home: SplashScreen(),
      ),
    );
  }
}
