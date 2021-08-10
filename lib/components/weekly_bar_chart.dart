import 'package:carb_poc/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const Color barBackgroundColor = const Color(0xff72d8bf);
const weekDayLabel = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];

class WeeklyBarChart extends StatelessWidget {
  final List<int> carbAmount;

  const WeeklyBarChart({Key? key, required this.carbAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeaderRow(context),
          _buildTotalCarbLabel(context),
          const SizedBox(height: defaultPadding),
          _buildWeeklyBarChart(context),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Week",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "Net Carbs".toUpperCase(),
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildTotalCarbLabel(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "0g",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.red),
      ),
    );
  }

  Widget _buildWeeklyBarChart(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: BarChart(
        _makeBarChartData(),
      ),
    );
  }

  BarChartData _makeBarChartData() {
    return BarChartData(
      maxY: 25,
      barGroups: _makeBarChartGroupData(),
      titlesData: _makeTitlesData(),
      borderData: _makeBorderData(),
      gridData: _makeGridData(),
    );
  }

  List<BarChartGroupData> _makeBarChartGroupData({
    Color barColor = Colors.green,
    double width = 22,
  }) {
    return carbAmount.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            y: entry.value.toDouble(),
            colors: [barColor],
            width: width,
          )
        ],
        showingTooltipIndicators: [],
      );
    }).toList();
  }

  FlTitlesData _makeTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (double value) {
            return weekDayLabel[value.toInt()];
          }),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 5,
      ),
    );
  }

  FlBorderData _makeBorderData() {
    return FlBorderData(
      show: true,
      border: const Border(
        bottom: const BorderSide(
          width: 0.1,
        ),
      ),
    );
  }

  FlGridData _makeGridData() {
    return FlGridData(
      show: true,
      horizontalInterval: 5,
    );
  }
}
