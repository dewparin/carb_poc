import 'package:carb_poc/components/my_goals/my_goals.dart';
import 'package:carb_poc/components/my_goals/my_goals_data.dart';
import 'package:carb_poc/components/my_goals/my_goals_pie_charts.dart';
import 'package:carb_poc/components/weekly_bar_chart.dart';
import 'package:flutter/material.dart';

const mockCarbs = [10, 8, 14, 9, 8, 11, 18];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // child: WeeklyBarChart(carbAmount: mockCarbs,),
          child: _buildMyGoals(),
        ),
      ),
    );
  }

  Widget _buildMyGoals() {
    final data = MyGoalsData(caloriesValue: 429,
        maxCaloriesValue: 2500,
        maxCarbValue: 20,
        carbValue: 9,
        maxProteinValue: 123,
        proteinValue: 90,
        maxFatValue: 230,
        fatValue: 140);
    return MyGoals(data: data);
  }
}
