import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entities/current_weather_entity.dart';

class Forecast extends StatelessWidget {
  final List<CurrentEntity> hourly;

  const Forecast(this.hourly);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: hourly.length < 24 ? hourly.length : 24,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 180,
          child: Card(
            color: const Color(0xff1b1c48),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                          "http://openweathermap.org/img/wn/${hourly[index].weather[0].icon}@2x.png",
                      scale: 0.4,
                      width: 140,
                      height: 100,
                         
                  ),
                  Text(DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(hourly[index].dt * 1000)).toString(),
                        style: const TextStyle(
                            fontFamily: 'SFUI',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: 1)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(hourly[index].temp.round().toString(),
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
      });
  }
}