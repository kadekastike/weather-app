import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Forecast extends StatelessWidget {
  final String icon;
  final int dateTime;
  final double temp;
  final String timeFormat;

  const Forecast(
      {super.key, required this.icon,
      required this.dateTime,
      required this.temp,
      required this.timeFormat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        color: const Color(0xff1b1c48),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "http://openweathermap.org/img/wn/$icon@2x.png",
                scale: 0.4,
                width: 140,
                height: 100,
              ),
              Text(
                  DateFormat(timeFormat)
                      .format(
                          DateTime.fromMillisecondsSinceEpoch(dateTime * 1000))
                      .toString(),
                  style: const TextStyle(
                      fontFamily: 'SFUI',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 1)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(temp.round().toString(),
                      style: const TextStyle(
                          fontFamily: 'SFUI',
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.white,
                          letterSpacing: 1)),
                  const Text(" \u2103",
                      style: TextStyle(
                          fontFamily: 'SFUI',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xfff7c511),
                          letterSpacing: 1)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
