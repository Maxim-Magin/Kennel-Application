import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/dogDescriptionPageBloc.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Images.dart';
import '../dogs.dart';
import '../dogsRepository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:enum_to_string/enum_to_string.dart';

class DogDescriptionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DogDescriptionPageState();
}

class _DogDescriptionPageState extends State<DogDescriptionPage> {
  DogDescriptionPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${_bloc.getSelectedDog().dogName()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${_bloc.getSelectedDog().dogBreed()}, ${_bloc.getSelectedDog().dogGender()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                                image: AssetImage(
                                    _bloc.getSelectedDog().dogImagePath()),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 110,
                        width: 110,
                        decoration: new BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(5.0),
                              topRight: const Radius.circular(5.0),
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(Images.singlePawPath()),
                                    fit: BoxFit.cover,
                                  )),
                                )
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'age',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'AnticSlab-Regular',
                                        color: Colors.red[900]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${_bloc.getSelectedDog().dogAge()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            fontFamily: 'AnticSlab-Regular'),
                                      ),
                                      SizedBox()
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        width: 110,
                        decoration: new BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(5.0),
                              topRight: const Radius.circular(5.0),
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(Images.scalesPath()),
                                    fit: BoxFit.cover,
                                  )),
                                )
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'weight',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'AnticSlab-Regular',
                                        color: Colors.red[900]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${_bloc.getDogRepository().getDogStatistics(_bloc.getSelectedDog()).last.weight} kg",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            fontFamily: 'AnticSlab-Regular'),
                                      ),
                                      SizedBox()
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        width: 110,
                        decoration: new BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(5.0),
                              topRight: const Radius.circular(5.0),
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(Images.ballPath()),
                                    fit: BoxFit.cover,
                                  )),
                                )
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'activity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'AnticSlab-Regular',
                                        color: Colors.red[900]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${_bloc.getDogRepository().getDogActivity(_bloc.getSelectedDog()).last.dailyActivity} min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            fontFamily: 'AnticSlab-Regular'),
                                      ),
                                      SizedBox()
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${_bloc.getSelectedDog().dogName()}'s",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "weight",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.bigScalesPath()),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    width: 300,
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <SplineSeries<DogWeightStatisticsItem, int>>[
                          SplineSeries<DogWeightStatisticsItem, int>(
                              dataSource: _bloc
                                  .getDogRepository()
                                  .getDogStatistics(_bloc.getSelectedDog()),
                              xValueMapper:
                                  (DogWeightStatisticsItem statisticsItem, _) =>
                                      statisticsItem.year,
                              yValueMapper:
                                  (DogWeightStatisticsItem statisticsItem, _) =>
                                      statisticsItem.weight,
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true)
                              // Enable data label
                              )
                        ]),
                  )
                ],
              )),
              Container(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${_bloc.getSelectedDog().dogName()}'s",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "daily activity",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  fontFamily: 'AnticSlab-Regular',
                                  color: Colors.red[900]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.bigBallPath()),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        SizedBox(),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 25,),
                            Container(
                                height: 110,
                                width: 110,
                                decoration: new BoxDecoration(
                                  color: Colors.grey[350],
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(5.0),
                                      topRight: const Radius.circular(5.0),
                                      bottomLeft: const Radius.circular(5.0),
                                      bottomRight: const Radius.circular(5.0)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${_bloc.getDogRepository().getDogActivity(_bloc.getSelectedDog()).last.dailyActivity}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          fontFamily: 'AnticSlab-Regular'),
                                    ),
                                    Text(
                                      "active minutes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          fontFamily: 'AnticSlab-Regular'),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      Container(
                          height: 210,
                          width: 210,
                          child: SfCircularChart(
                              annotations: <CircularChartAnnotation>[
                                CircularChartAnnotation(
                                    widget: Container(
                                        child: PhysicalModel(
                                  child: Container(),
                                  shape: BoxShape.circle,
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  color: const Color.fromRGBO(230, 230, 230, 1),
                                ))),
                                CircularChartAnnotation(
                                    widget: Container(
                                  child: Text(
                                    "${5 * _bloc.getDogRepository().getDogActivity(_bloc.getSelectedDog()).last.dailyActivity ~/ 3}%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        fontFamily: 'AnticSlab-Regular'),
                                  ),
                                ))
                              ],
                              series: <
                                  RadialBarSeries<DogDailyActivity, String>>[
                                RadialBarSeries<DogDailyActivity, String>(
                                  maximumValue: 60,
                                  dataSource: <DogDailyActivity>[
                                    _bloc
                                        .getDogRepository()
                                        .getDogActivity(_bloc.getSelectedDog())
                                        .last,
                                  ],
                                  //_bloc.getDogRepository().getDogActivity(_bloc.getSelectedDog()),
                                  xValueMapper: (DogDailyActivity data, _) =>
                                      data.day.toString(),
                                  yValueMapper: (DogDailyActivity data, _) =>
                                      data.dailyActivity,
                                  // Radius of doughnut
                                  radius: '100%',
                                )
                              ])),
                    ],
                  ),
                  Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ColumnSeries<DogDailyActivity, String>>[
                          ColumnSeries<DogDailyActivity, String>(
                              dataSource: _bloc
                                  .getDogRepository()
                                  .getDogActivity(_bloc.getSelectedDog()),
                              xValueMapper:
                                  (DogDailyActivity dogDailyActivity, _){
                                String result = EnumToString.parse(dogDailyActivity.day);
                                return result;
                                  },
                              yValueMapper:
                                  (DogDailyActivity dogDailyActivity, _) =>
                                  dogDailyActivity.dailyActivity,
                              // Enable data label
                              dataLabelSettings:
                              DataLabelSettings(isVisible: true)
                            // Enable data label
                          )
                        ]),
                  )
                ],
              ))
            ],
          )),
    ));
  }
}
