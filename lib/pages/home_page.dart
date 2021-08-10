import 'package:carb_poc/components/my_goals/my_goals.dart';
import 'package:carb_poc/components/my_goals/my_goals_data.dart';
import 'package:carb_poc/components/weekly_bar_chart.dart';
import 'package:carb_poc/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildPageView(),
      ),
    );
  }

  Widget _buildPageView() => PageIndicatorContainer(
      child: PageView(
        children: [
          _buildMyWeekChart(),
          _buildMyGoals(),
        ],
      ),
      align: IndicatorAlign.bottom,
      length: 2,
      indicatorSpace: 20.0,
      padding: const EdgeInsets.all(10),
      indicatorColor: Colors.black12,
      indicatorSelectorColor: Colors.blue,
      shape: IndicatorShape.circle(size: 12));

  Widget _buildMyWeekChart() => Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Card(
              child: WeeklyBarChart(
                carbAmount: const [10, 8, 14, 9, 8, 11, 18],
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
