import 'package:carb_poc/components/my_goals/my_goals.dart';
import 'package:carb_poc/components/my_goals/my_goals_data.dart';
import 'package:carb_poc/components/weekly_bar_chart.dart';
import 'package:carb_poc/constant.dart';
import 'package:flutter/material.dart';

const mockCarbs = [10, 8, 14, 9, 8, 11, 18];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            _buildMyWeekChart(),
            _buildMyGoals(),
          ],
        ),
      ),
    );
  }

  Widget _buildMyWeekChart() => Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Card(
              child: WeeklyBarChart(
                carbAmount: mockCarbs,
              ),
            ),
          ],
        ),
      );

  Widget _buildMyGoals() {
    final data = MyGoalsData(
        caloriesValue: 429,
        maxCaloriesValue: 2500,
        maxCarbValue: 20,
        carbValue: 9,
        maxProteinValue: 123,
        proteinValue: 90,
        maxFatValue: 230,
        fatValue: 140);
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Card(
            child: MyGoals(data: data),
          ),
        ],
      ),
    );
  }
}
