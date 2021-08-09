import 'package:carb_poc/components/my_goals/my_goals_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyGoalsPieCharts extends StatelessWidget {
  final MyGoalsData data;

  const MyGoalsPieCharts({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          PieChart(
            _makeFatPieChartData(),
          ),
          PieChart(
            _makeProteinPieChartData(),
          ),
          PieChart(
            _makeCarbsPieChartData(),
          ),
        ],
      ),
    );
  }

  PieChartData _makeFatPieChartData() {
    return _makePieChartData(
      value: data.fatValue,
      remainingValue: data.remainingFat(),
      color: Colors.amber,
      centerSpaceRadius: 120,
    );
  }

  PieChartData _makeProteinPieChartData() {
    return _makePieChartData(
      value: data.proteinValue,
      remainingValue: data.remainingProtein(),
      color: Colors.teal,
      centerSpaceRadius: 100,
    );
  }

  PieChartData _makeCarbsPieChartData() {
    return _makePieChartData(
      value: data.carbValue,
      remainingValue: data.remainingCarb(),
      color: Colors.red,
      centerSpaceRadius: 80,
    );
  }

  PieChartData _makePieChartData({
    required int value,
    required int remainingValue,
    required Color color,
    double startDegreeOffset = 270,
    double centerSpaceRadius = 100,
    double radius = 10,
  }) {
    return PieChartData(
      sectionsSpace: 0,
      startDegreeOffset: startDegreeOffset,
      centerSpaceRadius: centerSpaceRadius,
      sections: [
        PieChartSectionData(
          color: color,
          value: value.toDouble(),
          radius: radius,
          title: '',
        ),
        PieChartSectionData(
          color: Colors.black12,
          value: remainingValue.toDouble(),
          radius: radius,
          title: '',
        ),
      ],
    );
  }
}
