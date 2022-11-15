import 'package:flutter/material.dart';

class SchedinaWidgetCore extends StatelessWidget {
  final List<String> estrazioni;
  final String titolo;
  final String? altroDato;

  const SchedinaWidgetCore(
      {super.key,
      required this.estrazioni,
      required this.titolo,
      this.altroDato});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        Text(
          titolo,
          style: themeData.textTheme.bodyLarge,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: estrazioni.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Center(
              child: Text(
                '${index + 1}): ${estrazioni[index]}',
                style: themeData.textTheme.bodyLarge,
              ),
            ));
          },
        ),
        if (altroDato != null)
          Text(
            '$altroDato',
            style: themeData.textTheme.bodyLarge,
          )
      ],
    );
  }
}
