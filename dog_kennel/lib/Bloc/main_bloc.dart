import 'dart:async';
import 'package:dog_kennel/dogsRepository.dart';

import '../dogs.dart';
import 'bloc_base.dart';

enum MainUIEventType{
  goToDogDescription,
}

class MainUIEvent{
  MainUIEventType eventType;
  Map<String, dynamic> parameters;

  MainUIEvent(this.eventType, this.parameters);
}

class MainBloc extends BlocBase {
  DogRepository _repository = new HardCodeDogRepository();
  final StreamController<int> _dogIndexController = StreamController<int>();
  Sink<int> get inSelectedDogIndex => _dogIndexController.sink;
  Stream<int> get _outSelectedDogIndex => _dogIndexController.stream;

  final StreamController<MainUIEvent> _mainUIEventController = StreamController<MainUIEvent>();
  Sink<MainUIEvent> get inSelectedUIEvent => _mainUIEventController.sink;
  Stream<MainUIEvent> get outSelectedUIEvent => _mainUIEventController.stream;

  MainBloc() {
    _outSelectedDogIndex.listen(_goToDogDescriptionPage);
  }
  @override
  void dispose() {
    _dogIndexController.close();
    _mainUIEventController.close();
  }

  DogRepository getDogRepository() {
    return _repository;
  }

  void _goToDogDescriptionPage(int dogIndex) {
    Dog selectedDog = _repository.getAllDogs()[dogIndex];
    MainUIEvent goToPageEvent = MainUIEvent(MainUIEventType.goToDogDescription, {"dog": selectedDog});
    inSelectedUIEvent.add(goToPageEvent);
  }

  bool isIndexEven(int index){
    if (index.remainder(2) == 0)
      return true;
    else
      return false;
  }
}
