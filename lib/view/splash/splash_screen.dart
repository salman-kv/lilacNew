import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/controller/splash/spalsh_bloc.dart';
import 'package:lilac/controller/splash/splash_event.dart';
import 'package:lilac/controller/splash/splash_state.dart';
import 'package:lilac/core/common/app_image.dart';
import 'package:lilac/view/home/screens/home_screen.dart';
import 'package:lilac/view/home/screens/main_screen.dart';
import 'package:lilac/view/login/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        context.read<SpalshBloc>().add(CheckUserAlreadyLogined());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocListener<SpalshBloc, SplashState>(
        listener: (context, state) {
          if (state is UserAlredyLogined) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
              (route) => false,
            );
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppImage.splashImage),
            )
          ],
        ),
      ),
    ));
  }
}
