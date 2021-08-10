import 'package:carb_poc/components/my_goals/my_goals_data.dart';
import 'package:carb_poc/components/my_goals/my_goals_pie_charts.dart';
import 'package:carb_poc/constant.dart';
import 'package:flutter/material.dart';

class MyGoals extends StatelessWidget {
  final MyGoalsData data;

  const MyGoals({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        defaultPadding,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Goals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildPieCharts(),
          _buildInfo(context),
        ],
      ),
    );
  }

  Widget _buildPieCharts() => MyGoalsPieCharts(data: data);

  Widget _buildInfo(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildInfoItem(
        context,
        Colors.red,
        'Net Carbs',
        '${data.carbValue}/${data.maxCarbValue}g',
        '${data.remainingCarb()}g left',
      ),
      _buildInfoItem(
        context,
        Colors.teal,
        'Protein',
        '${data.proteinValue}/${data.maxProteinValue}g',
        '${data.remainingProtein()}g left',
      ),
      _buildInfoItem(
        context,
        Colors.amber,
        'Fat',
        '${data.fatValue}/${data.maxFatValue}g',
        '${data.remainingFat()}g left',
      ),
    ],
  );

  Widget _buildInfoItem(
    BuildContext context,
    Color line1Color,
    String line1,
    String line2,
    String line3,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            line1,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: line1Color,
                ),
          ),
          SizedBox(height: 4,),
          Text(
            line2,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 4,),
          Text(
            line3,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );
}
