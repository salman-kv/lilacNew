import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lilac/controller/login/login_event.dart';
import 'package:lilac/controller/login/login_state.dart';
import 'package:lilac/core/common/shared_pref.dart';
import 'package:lilac/core/strings/api_strings.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiStrings.baseUrl));
  LoginBloc() : super(InitialLoginState()) {
    on<LoginClickedEvent>(
      (event, emit) => _loginClickedEvent(emit: emit, event: event),
    );
  }
  _loginClickedEvent(
      {required LoginClickedEvent event, required Emitter emit}) async {
    try {
      emit(LoginLoadingState());
      final res = await _dio.post('vendor-login', data: {
        "email": event.email,
        "password": event.password,
      });
      String token = res.data['token'];
      await SharedPref.set(key: 'token', value: token);
      log(token);
      emit(LoginSuccessState());
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
