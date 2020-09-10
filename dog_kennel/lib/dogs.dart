
import 'package:flutter/material.dart';

enum DayOfTheWeek{
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun
}
class DogDailyActivity{
  final DayOfTheWeek day;
  final int dailyActivity;

  DogDailyActivity(@required this.day, @required this.dailyActivity);
}
class DogDailyActivityStatistics{
  List<DogDailyActivity> _activityStatistics;
  final Dog dog;
  DogDailyActivityStatistics(@required this.dog, this._activityStatistics);

  List<DogDailyActivity> getDogDailyActivity(){
    return _activityStatistics;
  }
}

class DogWeightStatisticsItem{
  final int year;
  final double weight;

  DogWeightStatisticsItem(@required this.year, @required this.weight);
}

class DogWeightStatistics{
  List<DogWeightStatisticsItem> _statistics;
  final Dog dog;
  DogWeightStatistics(@required this.dog, this._statistics);

  void addStatisticsItem(List<DogWeightStatisticsItem> dogWeightStatistics) {
    for(int i = 0; i < dogWeightStatistics.length; ++i)
      {
        _statistics.add(dogWeightStatistics[i]);
      }

  }

  List<DogWeightStatisticsItem> getDogWeightStatistic(){
    return _statistics;
  }
}

class Dog{
  String _name;
  String _age;
  String _breed;
  String _dogImagePath;
  String _gender;

  Dog(String name, String age, String breed, String imagePath, String gender){
    _name = name;
    _age = age;
    _breed = breed;
    _dogImagePath = imagePath;
    _gender = gender;
  }
  String dogName() {
    return _name;
  }
  String dogAge(){
    return _age;
  }
  String dogBreed(){
    return _breed;
  }
  String dogImagePath(){
    return _dogImagePath;
  }
  String dogGender(){
    return _gender;
  }

}