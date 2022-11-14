import 'package:flutter/material.dart';
import 'package:flutter_superenalotto_cleancode/2_application/pages/home/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const margin = 10.0;

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
              height: margin,
            ),
            Expanded(
                child: Center(
              child: CircularProgressIndicator(
                  color: themeData.colorScheme.secondary),
              /*Text(
              'Genera nuovi numeri',
              style: themeData.textTheme.bodyText1,
            )
            */
            )),
            const SizedBox(
              height: margin,
            ),
            const CustomButtom(),
            const SizedBox(
              height: margin,
            ),
          ],
        ),
      ),
    );
  }
}
