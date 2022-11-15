import 'package:flutter/material.dart';
import 'package:flutter_superenalotto_cleancode/2_application/core/constant.dart';
import 'package:flutter_superenalotto_cleancode/2_application/core/widgets/schedina_widget_core.dart';

class HomeWidget extends StatelessWidget {
  final List<String> estrazioniSupernalotto;
  final String? getStar;
  final List<String> estrazioniMilionDay;
  final List<String> estrazioniEuroJackpot;
  final List<String> estrazioniDiecielotto;
  final String? get10;

  const HomeWidget(
      {super.key,
      required this.estrazioniSupernalotto,
      this.getStar,
      required this.estrazioniMilionDay,
      required this.estrazioniEuroJackpot,
      required this.estrazioniDiecielotto,
      this.get10});

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: k_heightMargin,
          ),
          SchedinaWidgetCore(
            estrazioni: estrazioniSupernalotto,
            titolo: 'Estrazioni Super Enalalotto',
            altroDato: 'SuperStar: $getStar',
          ),
          const SizedBox(
            height: k_heightMargin,
          ),
          SchedinaWidgetCore(
            estrazioni: estrazioniMilionDay,
            titolo: 'Estrazioni Milion Day',
          ),
          const SizedBox(
            height: k_heightMargin,
          ),
          SchedinaWidgetCore(
            estrazioni: estrazioniEuroJackpot,
            titolo: 'Estrazioni Euro Jackpot',
          ),
          const SizedBox(
            height: k_heightMargin,
          ),
          SchedinaWidgetCore(
            estrazioni: estrazioniDiecielotto,
            titolo: 'Estrazioni 10 e Lotto',
            altroDato: 'EuroNumeri: $get10',
          ),
          /**/
        ]),
      ),
    );
  }
}
