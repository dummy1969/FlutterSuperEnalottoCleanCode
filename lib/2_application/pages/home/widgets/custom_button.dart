//import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_superenalotto_cleancode/2_application/pages/home/bloc/home_bloc.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/cubit/home_cubit.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        debugPrint('Botton Pressed');
        BlocProvider.of<HomeCubit>(context).estrazioniRequested();
        //BlocProvider.of<AdvicerCubit>(context).adviceRequested();
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeData.colorScheme.secondary),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Genera',
                style: themeData.textTheme.headline1,
              )),
        ),
      ),
    );
  }
}
