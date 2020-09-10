
import 'dart:async';

import 'package:dog_kennel/Bloc/bloc_base.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../Images.dart';
import '../dogsRepository.dart';


class ServicesPageBloc extends BlocBase{
  DogRepository _repository = new HardCodeDogRepository();
  int _selectedCategoryIndex;


  final StreamController<int> _categoryIndexController = BehaviorSubject<int>.seeded(0);
  Sink<int> get inSelectedCategoryIndex => _categoryIndexController.sink;
  Stream<int> get outSelectedCategoryIndex => _categoryIndexController.stream;

  final StreamController<List<String>> _categoriesController = BehaviorSubject<List<String>>.seeded([
    "${Images.consultationPath()}",
    "${Images.keepingPath()}",
    "${Images.metricsPath()}",
    "${Images.raisingPath()}",
    "${Images.trainingPath()}",
  ]);
  Stream<List<String>> get outAllCategories => _categoriesController.stream;

  Stream<String> outSelectedInformation;

  ServicesPageBloc(){
    outSelectedCategoryIndex.listen(setSelectedCategoryItemIndex);
  }

  List<String> getCategoryContent(){
    List<String> settings = [
      "${Images.consultationPath()}",
      "${Images.keepingPath()}",
      "${Images.metricsPath()}",
      "${Images.raisingPath()}",
      "${Images.trainingPath()}",
    ];
    return settings;
  }

  @override
  void dispose() {
    _categoryIndexController.close();
    _categoriesController.close();
  }

  void setSelectedCategoryItemIndex(int value){
    _selectedCategoryIndex = value;
  }
  int getSelectedCategoryItemIndex(){
    return _selectedCategoryIndex;
  }

  double setSide(int index){
    if(index == _selectedCategoryIndex){
      return 150;
    }
    else
      return 100;
  }

  String getCategoryName(int index){
    switch(index){
      case 0:
        return "Consultation";
        break;
      case 1:
        return "Keeping";
        break;
      case 2:
        return "Metrics";
        break;
      case 3:
        return "Raising";
        break;
      case 4:
        return "Training";
        break;
      default:
        return null;
    }
  }
}