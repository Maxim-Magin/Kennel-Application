
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/dogDescriptionPageBloc.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:dog_kennel/Images.dart';
import 'package:dog_kennel/Screens/dogDescriptionPage.dart';
import 'package:dog_kennel/dogsRepository.dart';
import 'package:flutter/material.dart';

import '../dogs.dart';

class OurDogsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OurDogsPageState();
}

class _OurDogsPageState extends State<OurDogsPage> {
  MainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.outSelectedUIEvent.listen((event) {
      switch(event.eventType){
        case MainUIEventType.goToDogDescription:
          Dog selectedDog = event.parameters["dog"];
          Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                  child: DogDescriptionPage(),
                  bloc: DogDescriptionPageBloc(selectedDog)
              ))
          );
      }
    });
  }

  Widget buildDogDescription(BuildContext context, int index, Dog dog) {
    if (_bloc.isIndexEven(index)) {
      return GestureDetector(
          onTap: (){
            _bloc.inSelectedDogIndex.add(index);
          },
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(dog.dogImagePath()),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${dog.dogName()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Age: ${dog.dogAge()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Gender: ${dog.dogGender()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Breed: ${dog.dogBreed()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5,)
          ],
        )
      );
    }
    else {
      return GestureDetector(
        onTap: (){
          _bloc.inSelectedDogIndex.add(index);
        },
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${dog.dogName()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Age: ${dog.dogAge()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Gender: ${dog.dogGender()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Breed: ${dog.dogBreed()}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            fontFamily: 'AnticSlab-Regular'),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(dog.dogImagePath()),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    DogRepository _repository = new HardCodeDogRepository();
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'OUR DOGS',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C),
                          fontFamily: 'Rowdies'),
                      textAlign: TextAlign.justify,
                    )
                ),
                Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _repository.getAllDogs().length,
                      itemBuilder:(BuildContext context, int index){
                        return buildDogDescription(context, index, _repository.getAllDogs()[index]);
                      },
                    )
                )
              ],
            ),
          )
        ),
    );
  }
}