import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_superenalotto_cleancode/2_application/pages/home/bloc/home_bloc.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/cubit/home_cubit.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/custom_button.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/error_message.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/home_field.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
import 'package:flutter_superenalotto_cleancode/2_application/core/constant.dart';

class HomePageWrapperProvider extends StatelessWidget {
  const HomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Super Enalotto',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: k_heightMargin,
            ),
            Expanded(child: Center(
                child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return Text(
                    'Genera nuovi numeri',
                    style: themeData.textTheme.bodyText1,
                  );
                } else if (state is HomeLoading) {
                  return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary);
                } else if (state is HomeLoaded) {
                  return HomeWidget(
                    estrazioniDiecielotto: state.estrazioniDiecielotto,
                    estrazioniEuroJackpot: state.estrazioniEuroJackpot,
                    estrazioniMilionDay: state.estrazioniMilionDay,
                    estrazioniSupernalotto: state.estrazioniSupernalotto,
                    getStar: state.getStar,
                    get10: state.get10,
                  );
                } else if (state is HomeError) {
                  return ErrorMessage(message: state.errorMessage);
                }
                return const SizedBox();
              },
            )

                /*
                  CircularProgressIndicator(
                      color: themeData.colorScheme.secondary),
*/

                /*
            */
                )),
            const SizedBox(
              height: k_heightMargin,
            ),
            const CustomButtom(),
            const SizedBox(
              height: k_heightMargin,
            ),
          ],
        ),
      ),
    );
  }
}
