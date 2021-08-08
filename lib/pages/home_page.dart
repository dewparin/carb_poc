import 'package:carb_poc/components/weekly_bar_chart.dart';
import 'package:flutter/material.dart';

const mockCarbs = [10, 8, 14, 9, 8, 11, 18];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: WeeklyBarChart(carbAmount: mockCarbs,),
        ),
      ),
    );
  }
}
