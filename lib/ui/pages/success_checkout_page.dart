import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/image_success.png',
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Well Booked 😍',
                  style: blackTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold,
                  ),
                ),
                Container(
                  width: 250,
                  height: 100,
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Are you ready to explore the new world of experiences?',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomButton(
                  title: 'My Bookings',
                  onPressed: () {
                    context.read<PageCubit>().setPage(1);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  width: 220,
                  margin: const EdgeInsets.only(top: 5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
