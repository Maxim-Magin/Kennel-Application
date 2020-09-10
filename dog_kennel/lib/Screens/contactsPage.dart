
import 'dart:convert';
import 'dart:io';

import 'package:dog_kennel/TextContent.dart';
import 'package:flutter/material.dart';
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';

import '../Images.dart';

class ContactsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>{
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
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.greyPawsPath()),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Contacts',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C),
                            fontFamily: 'Rowdies'),
                        textAlign: TextAlign.justify,
                      )
                  ),
                  SizedBox(height: 170,),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Text(
                          '- Pushkin street Kolotushkin house',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                              fontFamily: 'AnticSlab'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          '- Phone number: 8-888-888-88-88',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                              fontFamily: 'AnticSlab'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'vk: id1111000',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                              fontFamily: 'AnticSlab'),
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                  )

                ],
              ),
          )
      )

    );
  }
}