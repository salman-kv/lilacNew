import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:lilac/controller/splash/splash_event.dart';
import 'package:lilac/controller/splash/splash_state.dart';
import 'package:lilac/core/common/shared_pref.dart';

class SpalshBloc extends Bloc<SplashEvent, SplashState> {
  SpalshBloc() : super(SpashInitialState()) {
    on<CheckUserAlreadyLogined>(
      (event, emit) async {
        final res = await SharedPref.get(key: 'token');
        log(res.toString());
        if (res == null || res == '') {
          emit(UserNotLogined());
        } else {
          emit(UserAlredyLogined());
        }
      },
    );
  }
}
