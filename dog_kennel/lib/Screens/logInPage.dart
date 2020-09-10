
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:dog_kennel/Screens/homePage.dart';
import 'package:dog_kennel/Screens/registration_page.dart';
import 'package:dog_kennel/dogsRepository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Images.dart';

class LogInPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
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
        child: SingleChildScrollView(
          primary: false,
            child: Container(
              height: MediaQuery.of(context).size.height,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.greyPawsPath()),
                      fit: BoxFit.cover,
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        'GOODBOY',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C),
                        fontFamily: 'Rowdies'),
                      ),
                    ),
                    SizedBox(
                      height: 155,
                    ),
                    Container(
                      width: 280,
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 280,
                      color: Colors.white,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                    ),
                    Container(
                        height: 45,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: <Color>[
                                  Color(0xFFE0E0E0),
                                  Color(0xFFBDBDBD),
                                  Color(0xFF757575),
                                  Color(0xFF424242),
                                ]
                            )
                        ),
                        child: ButtonTheme(
                            minWidth: 200,
                            child: RaisedButton(
                              color: Colors.transparent,
                              child: Container(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                                        child: HomePage(),
                                        bloc: MainBloc()
                                    ))
                                );
                              },
                            )
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Sign up',
                                style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (BuildContext context) => BlocProvider(
                                            child: RegistrationPage(),
                                            bloc: MainBloc()
                                        ))
                                    );
                                  }
                            )
                          ]
                      ),
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}