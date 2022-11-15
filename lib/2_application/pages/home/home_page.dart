import 'package:flutter/material.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/custom_button.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/home_field.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
import 'package:flutter_superenalotto_cleancode/2_application/core/constant.dart';

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
          children: const [
            SizedBox(
              height: k_heightMargin,
            ),
            Expanded(
                child: Center(
                    child: HomeWidget(
              estrazioniDiecielotto: ['1-2-3-4-5-6'],
              estrazioniEuroJackpot: ['7-8-9-10-11'],
              estrazioniMilionDay: ['12-13-14-15-16'],
              estrazioniSupernalotto: [
                '19-8-5-3-45',
                '1,2,3,4,5,6',
                '1,2,3,4,5,6',
                '1,2,3,4,5,6'
              ],
              getStar: '90',
              get10: '5-2',
            )

                    /*
                  CircularProgressIndicator(
                      color: themeData.colorScheme.secondary),
*/

                    /*Text(
              'Genera nuovi numeri',
              style: themeData.textTheme.bodyText1,
            )
            */
                    )),
            SizedBox(
              height: k_heightMargin,
            ),
            CustomButtom(),
            SizedBox(
              height: k_heightMargin,
            ),
          ],
        ),
      ),
    );
  }
}
