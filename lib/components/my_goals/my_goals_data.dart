class MyGoalsData {
  final int caloriesValue;
  final int maxCaloriesValue;
  final int maxCarbValue;
  final int carbValue;
  final int maxProteinValue;
  final int proteinValue;
  final int maxFatValue;
  final int fatValue;

  MyGoalsData({
    required this.caloriesValue,
    required this.maxCaloriesValue,
    required this.maxCarbValue,
    required this.carbValue,
    required this.maxProteinValue,
    required this.proteinValue,
    required this.maxFatValue,
    required this.fatValue,
  });
}

extension MyGoalsDataExt on MyGoalsData {
  int remainingCarb() => maxCarbValue - carbValue;
  int remainingProtein() => maxProteinValue - proteinValue;
  int remainingFat() => maxFatValue - fatValue;
}
