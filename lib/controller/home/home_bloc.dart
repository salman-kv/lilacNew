import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lilac/controller/home/home_event.dart';
import 'package:lilac/controller/home/home_state.dart';
import 'package:lilac/core/common/shared_pref.dart';
import 'package:lilac/core/strings/api_strings.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int totalVehicle = 0;
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiStrings.baseUrl));
  HomeBloc() : super(InitialHomeState()) {
    on<GetTotalVehicleEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        try {
          final token = await SharedPref.get(key: 'token');
          final res = await _dio.get('vendor/get-total-vehicles',
              options: Options(headers: {'Authorization': 'Bearer $token'}));
          if (res.statusCode == 200) {
            totalVehicle = res.data.length;
            emit(GetVehicleSuccess());
          }
        } on DioException catch (e) {
          log(e.toString());
        }
      },
    );
  }
}
