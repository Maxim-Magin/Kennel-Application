
import 'dart:ui';

import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:dog_kennel/Bloc/servicePageBloc.dart';
import 'package:dog_kennel/Images.dart';
import 'package:dog_kennel/Screens/aboutUsPage.dart';
import 'package:dog_kennel/Screens/ourDogsPage.dart';
import 'package:dog_kennel/Screens/servicesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dogsRepository.dart';
import 'contactsPage.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
  }

class _HomePageState extends State<HomePage>{
  MainBloc _bloc;

@override
void initState() {
  super.initState();
  _bloc = BlocProvider.of(context);
}

final List<Widget> introWidgetsList = <Widget>[
  Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 240,),
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              SizedBox(width: 20,),
              Column(
                children: <Widget>[
                  Text(
                    'Find',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'your pet',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                    textAlign: TextAlign.center,
                  )
                ],
              ) ,
            ],
          )
        )
      ],
    ),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Images.findYourPetPath()),
        fit: BoxFit.cover
      )
    ),
  ),
  Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 150,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Know',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                      color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'pet',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                  color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(width: 20,)
          ],
        ),
      ],
    ),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Images.knowPetPath()),
            fit: BoxFit.cover
        )
    ),
  ),
  Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[
                  Text(
                    'Take pet',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'home',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.white, fontFamily: 'AnticSlab-Regular'),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(width: 20,)
      ],
    ),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Images.dogWithGlassesPath()),
            fit: BoxFit.cover
        )
    ),
  ),
];

Widget circleBar(bool isActive){
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? Colors.deepOrange : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}

int _currentPageValue = 0;

void getChangedPageAndMoveBar(int page) {
  _currentPageValue = page;
  setState(() {});
}

@override
Widget build(BuildContext context) {
  DogRepository _repository = new HardCodeDogRepository();
  return Scaffold(
    body: SafeArea(
      child: Container(
        height: 1980,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  height: 600,
                  child: PageView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: introWidgetsList.length,
                      onPageChanged: (int page){
                        getChangedPageAndMoveBar(page);
                      },
                      itemBuilder: (context, index){
                        _currentPageValue = index;
                        return introWidgetsList[index];
                      }
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for(int i = 0; i < introWidgetsList.length; ++i)
                            if (i == _currentPageValue)
                              circleBar(true)
                            else
                              circleBar(false)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                        child: OurDogsPage(),
                        bloc: MainBloc()
                    ))
                );
              },
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text(
                      'Our',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          color: Colors.white, fontFamily: 'Rowdies'),
                    ),
                    Text(
                      'dogs',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          color: Colors.white, fontFamily: 'Rowdies'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.dogsPath()),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                   MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                       child: ServicesPage(),
                        bloc: ServicesPageBloc()
                   )
                   )
                );
                },
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Text(
                      'Services',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          color: Colors.white, fontFamily: 'Rowdies'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.servicesPath()),
                      fit: BoxFit.cover,
                    )
                ),
              ),
        ),
            SizedBox(height: 5,),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                          child: AboutUsPage(),
                          bloc: MainBloc()
                      ))
                  );
                },
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text(
                      'About us',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          color: Colors.white, fontFamily: 'Rowdies'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.aboutUsPath()),
                      fit: BoxFit.cover,
                    )
                ),
            )),
            SizedBox(height: 5,),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                          child: ContactsPage(),
                          bloc: MainBloc()
                      ))
                  );
                },
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Contacts',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          color: Colors.white, fontFamily: 'Rowdies'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.contactsPath()),
                      fit: BoxFit.cover,
                    )
                ),
              )
            )

          ],
        ),
      ),
    ),
  );

}
}