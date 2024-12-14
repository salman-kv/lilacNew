import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/controller/home/home_bloc.dart';
import 'package:lilac/controller/login/login_bloc.dart';
import 'package:lilac/controller/splash/spalsh_bloc.dart';
import 'package:lilac/core/common/shared_pref.dart';
import 'package:lilac/core/theme/app_theme.dart';
import 'package:lilac/view/splash/splash_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpalshBloc(),),
        BlocProvider(create: (context) => LoginBloc(),),
        BlocProvider(create: (context) => HomeBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lilac',
        theme: AppTheme.light,
        home:  const SplashScreen(),
      ),
    );
  }
}
