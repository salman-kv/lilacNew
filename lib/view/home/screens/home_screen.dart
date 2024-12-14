import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lilac/controller/home/home_bloc.dart';
import 'package:lilac/controller/home/home_event.dart';
import 'package:lilac/controller/home/home_state.dart';
import 'package:lilac/core/common/app_image.dart';
import 'package:lilac/core/common/shared_pref.dart';
import 'package:lilac/core/common/widget/submit_button.dart';
import 'package:lilac/view/home/widget/home_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetTotalVehicleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeBox(
                  image: AppImage.homeCar,
                  name: 'Total Vehicle',
                  number:context.read<HomeBloc>().totalVehicle,
                  loading: state is HomeLoadingState,
                ),
                HomeBox(
                  image: AppImage.homeBooking,
                  name: 'Total Booking',
                  number: 50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeBox(
                  image: AppImage.homeConcept,
                  name: 'C2B Concept',
                  number: 90,
                ),
                HomeBox(
                  image: AppImage.homeSale,
                  name: 'Total Sales',
                  number: 89,
                ),
              ],
            ),
            SubmitButton(
                text: 'just for clear shared preferences',
                onClick: () {
                  SharedPref.set(key: 'token', value: '');
                })
          ],
        );
      },
    );
  }
}
