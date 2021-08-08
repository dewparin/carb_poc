import 'package:carb_poc/constant.dart';
import 'package:flutter/material.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<int> carbAmount;

  const WeeklyBarChart({Key? key, required this.carbAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        defaultPadding,
      ),
      child: Column(
        children: [
          _buildHeaderRow(),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      children: [
        Text("My Week"),
        Text("Net Carbs"),
      ],
    );
  }
}
