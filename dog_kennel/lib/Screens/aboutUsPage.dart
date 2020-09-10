
import 'dart:convert';
import 'dart:io';

import 'package:dog_kennel/TextContent.dart';
import 'package:flutter/material.dart';
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';

import '../Images.dart';

class AboutUsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>{
  MainBloc _bloc;

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
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.greyPawsPath()),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'ABOUT US',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C),
                            fontFamily: 'Rowdies'),
                        textAlign: TextAlign.justify,
                      )
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Text(
                        'The "GOODBOY" charitable Foundation started its work in 2012.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                            fontFamily: 'AnticSlab'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'During the work of the shelter more than 1000 animals were attached to families',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                            fontFamily: 'AnticSlab'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'We are actively engaged in promoting a good, responsible attitude to Pets.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                            fontFamily: 'AnticSlab'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Our task is to make the CITY GOOD.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                            fontFamily: 'AnticSlab'),
                      ),
                      SizedBox(height: 50,)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Gallery',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36, color: Color(0xFFB71C1C),
                            fontFamily: 'Rowdies'),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 300,
                        width: 1000,
                        child: ListView(
                         scrollDirection: Axis.horizontal,
                         children: <Widget>[
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             child: Image(
                               image: AssetImage(Images.dogWithManPath()),
                               fit: BoxFit.cover,
                             ),
                           ),
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             child: Image(
                               image: AssetImage(Images.dogWithOldManPath()),
                               fit: BoxFit.cover,
                             ),
                           ),
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                            child: Image(
                               image: AssetImage(Images.puppyPath()),
                               fit: BoxFit.cover,
                             ),
                           ),
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             child: Image(
                               image: AssetImage(Images.dogWithWomanPath()),
                               fit: BoxFit.cover,
                             ),
                           ),
                           Container(
                             height: MediaQuery.of(context).size.height,
                             width: MediaQuery.of(context).size.width,
                             child: Image(
                               image: AssetImage(Images.dogWithOldMan2Path()),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ]
                        )
                      )
                    ]
                  )
                ]
              )
          )

      )
    );
  }
}