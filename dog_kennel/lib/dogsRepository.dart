import 'dart:core';

import 'package:dog_kennel/Images.dart';
import 'package:dog_kennel/dogs.dart';
import 'package:flutter/material.dart';

abstract class DogRepository {
  List<Dog> getAllDogs();
  List<DogWeightStatisticsItem> getDogStatistics(Dog selectedDog);
  List<DogDailyActivity> getDogActivity(Dog selectedDog);
}

class HardCodeDogRepository implements DogRepository {
  List<Dog> _dogs = List<Dog>();
  List<DogWeightStatistics> _dogsWeightStatistics = List<DogWeightStatistics>();
  List<DogDailyActivityStatistics> _dogsDailyActivity = List<DogDailyActivityStatistics>();

  HardCodeDogRepository() {
    _dogs = kennelsDogs;
    _dogsWeightStatistics = allDogStatistics;
    _dogsDailyActivity = allDogsDailyActivity;
  }

  List<Dog> getAllDogs() {
    return _dogs;
  }

  List<DogWeightStatisticsItem> getDogStatistics(Dog selectedDog) {
    for(DogWeightStatistics dogWeightStatistics in _dogsWeightStatistics)
      {
        if (selectedDog == dogWeightStatistics.dog)
          {
            return dogWeightStatistics.getDogWeightStatistic();
          }
      }
    return null;
  }

  List<DogDailyActivity> getDogActivity(Dog selectedDog) {
    for(DogDailyActivityStatistics dogDailyActivity in _dogsDailyActivity)
    {
      if (selectedDog == dogDailyActivity.dog)
      {
        return dogDailyActivity.getDogDailyActivity();
      }
    }
    return null;
  }
}

List<Dog> kennelsDogs = [
  Dog("Jack", "1 year", "Labrador", DogsImages.dogImagePath("1"), "male"),
  Dog("Pop", "3 years", "Spitz", DogsImages.dogImagePath("2"), "male"),
  Dog("Longbottom", "2 years", "Pug", DogsImages.dogImagePath("3"), "male"),
  Dog("Elly", "1,5 years", "Mestizo", DogsImages.dogImagePath("4"), "female"),
  Dog("Molly", "3 years", "Mestizo", DogsImages.dogImagePath("5"), "female"),
];

List<DogWeightStatistics> allDogStatistics = [
  DogWeightStatistics(kennelsDogs[0], JackWeightStatistics),
  DogWeightStatistics(kennelsDogs[1], PopWeightStatistics),
  DogWeightStatistics(kennelsDogs[2], LongBottomWeightStatistics),
  DogWeightStatistics(kennelsDogs[3], EllyWeightStatistics),
  DogWeightStatistics(kennelsDogs[4], MollyWeightStatistics)
];

List<DogWeightStatisticsItem> JackWeightStatistics = [
  DogWeightStatisticsItem(2019, 3.5),
  DogWeightStatisticsItem(2020, 25)
];
List<DogWeightStatisticsItem> PopWeightStatistics = [
  DogWeightStatisticsItem(2017, 0.47),
  DogWeightStatisticsItem(2018, 2.1),
  DogWeightStatisticsItem(2019, 2.3),
  DogWeightStatisticsItem(2020, 2.0)
];
List<DogWeightStatisticsItem> LongBottomWeightStatistics = [
  DogWeightStatisticsItem(2018, 0.51),
  DogWeightStatisticsItem(2019, 10.5),
  DogWeightStatisticsItem(2020, 10)
];
List<DogWeightStatisticsItem> EllyWeightStatistics = [
  DogWeightStatisticsItem(2019, 2.5),
  DogWeightStatisticsItem(2020, 14)
];
List<DogWeightStatisticsItem> MollyWeightStatistics = [
  DogWeightStatisticsItem(2017, 0.26),
  DogWeightStatisticsItem(2018, 3.2),
  DogWeightStatisticsItem(2019, 3.3),
  DogWeightStatisticsItem(2020, 3)
];

List<DogDailyActivityStatistics> allDogsDailyActivity = [
  DogDailyActivityStatistics(kennelsDogs[0], everyDogDailyActivity),
  DogDailyActivityStatistics(kennelsDogs[1], everyDogDailyActivity),
  DogDailyActivityStatistics(kennelsDogs[2], everyDogDailyActivity),
  DogDailyActivityStatistics(kennelsDogs[3], everyDogDailyActivity),
  DogDailyActivityStatistics(kennelsDogs[4], everyDogDailyActivity),
];

List<DogDailyActivity> everyDogDailyActivity = [
  DogDailyActivity(DayOfTheWeek.mon, 45),
  DogDailyActivity(DayOfTheWeek.tue, 60),
  DogDailyActivity(DayOfTheWeek.wed, 40),
  DogDailyActivity(DayOfTheWeek.thu, 35),
  DogDailyActivity(DayOfTheWeek.fri, 50),
  DogDailyActivity(DayOfTheWeek.sat, 55),
  DogDailyActivity(DayOfTheWeek.sun, 40),
];
