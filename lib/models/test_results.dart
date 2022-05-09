class ResultModel {
  static final results = [
    Result(
      id : 1,
      name : "Heart Rate",
      desc : "To be added",
      color : "#33505a",
      normalLow : 0,
      normalMax : 200),
  ];
}

class Result {
  final int id;
  final String name;
  final String desc;
  final String color;
  final num normalLow;
  final num normalMax;

  Result({required this.id, required this.name, required this.desc, required this.color, required this.normalLow, required this.normalMax});
}