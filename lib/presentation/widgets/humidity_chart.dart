import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../common/app_colors.dart';

class HumidityChart extends StatelessWidget {
  final List<double> hourlyHumidityData;
  final List<int> times;

  const HumidityChart({super.key,  required this.hourlyHumidityData, required this.times});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> dataSpots = hourlyHumidityData.asMap().entries.map((entry) {
      double x = entry.key.toDouble(); // Use index as x value
      double y = entry.value; // Use humidity data as y value
      return FlSpot(x, y);
    }).toList();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: const Color(0xfff7c511),
            barWidth: 8,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: dataSpots
          )
        ], 
        titlesData: humidityTitlesData1,
        gridData: gridData,
        borderData: borderData,
        minX: 0,
        maxX: 5,
        maxY: 100,
        minY: 0,
      ),
      
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  FlTitlesData get humidityTitlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
         rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );


  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
      color: Colors.white
    );
    return Text('${value.toInt()}%', style: style);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 25,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
      color: Colors.white
    );
    Widget text;
    int index = value.toInt();
    if (index >= 0 && index < times.length) {
      text = Text(DateFormat('hh a').format(DateTime.fromMillisecondsSinceEpoch(times[index] * 1000)).toString(), style: style, textAlign: TextAlign.center,);
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

}