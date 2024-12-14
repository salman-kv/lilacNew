import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/controller/login/login_bloc.dart';
import 'package:lilac/controller/login/login_event.dart';
import 'package:lilac/controller/login/login_state.dart';
import 'package:lilac/core/common/app_image.dart';
import 'package:lilac/core/common/app_snackbar.dart';
import 'package:lilac/core/common/widget/submit_button.dart';
import 'package:lilac/core/theme/app_color.dart';
import 'package:lilac/view/home/screens/home_screen.dart';
import 'package:lilac/view/home/screens/main_screen.dart';
import 'package:lilac/view/login/widget/login_text_form_field.dart';
import 'package:lilac/view/login/widget/rich_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formkey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(AppImage.logoImage),
                      const SizedBox(height: 10),
                      Text(
                        'Login With Your Email &\n Password',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10),
                            LoginTextFormField(
                              hint: 'Enter Your Email',
                              labelIcon: const Icon(Icons.message),
                              textEditingController: emailController,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10),
                            LoginTextFormField(
                              hint: 'Enter Your Email',
                              labelIcon: const Icon(Icons.password),
                              textEditingController: passwordController,
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Forgot Password ?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blueColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Column(
                        children: [
                          state is LoginLoadingState
                              ? const CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: AppColor.brownColor,
                                  value: 40,
                                )
                              : SubmitButton(
                                  onClick: () {
                                    if (emailController.text.trim() !=
                                            'mtest@gmail.com' &&
                                        passwordController.text.trim() !=
                                            '12345678') {
                                      AppSnackbar.showSnack(
                                          context: context,
                                          error: true,
                                          text:
                                              'please enter valid email or Password');
                                    } else {
                                      context.read<LoginBloc>().add(
                                          LoginClickedEvent(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text));
                                    }
                                  },
                                  text: 'Login',
                                ),
                          const SizedBox(height: 10),
                          const RichTextWidget(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
