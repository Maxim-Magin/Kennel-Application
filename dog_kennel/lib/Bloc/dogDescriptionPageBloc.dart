
import 'dart:async';


import '../dogs.dart';
import '../dogsRepository.dart';
import 'bloc_base.dart';

class DogDescriptionPageBloc extends BlocBase {
  Dog _selectedDog;
  DogRepository _repository = new HardCodeDogRepository();
  /*final StreamController<Dog> _selectedDogController = StreamController();
  Sink<Dog> get inSelectedDog => _selectedDogController.sink;
  Stream<Dog> get outSelectedDog => _selectedDogController.stream;*/
  DogDescriptionPageBloc(this._selectedDog);

  @override
  void dispose() {
    //_selectedDogController.close();
  }

  Dog getSelectedDog(){
    return _selectedDog;
  }
  DogRepository getDogRepository(){
    return _repository;
  }

}