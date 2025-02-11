import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/presentation/bloc/splash/splash_bloc.dart';
import 'package:todo_app/presentation/core/colors/colors.dart';
import '../home/home_page.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return BlocConsumer<SplashBloc,SplashState>(
     
      listener: (context, state) {
        if (state is SplashCompledState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
      },
      builder: (context, state){
        double animationValue = 0;
        if (state is SplashAnimating) {
          animationValue = state.animationValue;
        }
        return Scaffold(
         body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
               'assets/loadingAnimation.json',
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              ShaderMask(
                shaderCallback: (bounds){
                  return LinearGradient(
                  colors: [blue,white,black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [
                    animationValue,
                    (animationValue + 0.0).clamp(0.0, 2.0),
                    (animationValue + 0.2).clamp(0.0, 1.0),
                  ]
                  ).createShader(bounds);
                },
                child: Text(
               'TO Do\nList & Tasks',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
             ),
                 Text(
               'Organize Your day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: black,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
         ),
        );
     },);
  }
}