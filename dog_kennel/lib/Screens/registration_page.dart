
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/main_bloc.dart';
import 'package:flutter/material.dart';

import '../Images.dart';
import '../dogsRepository.dart';
import 'logInPage.dart';

class RegistrationPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>{
  MainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LegacyBlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    DogRepository _repository = new HardCodeDogRepository();
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
              child: Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Text(
                          'GOODBOY',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C)),
                        ),
                      ),
                      SizedBox(
                        height: 70,
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
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
                        height: 50,
                      ),
                      Container(
                        width: 280,
                        color: Colors.white,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
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
                                    'Sign up',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => LegacyBlocProvider(
                                          child: LogInPage(),
                                          bloc: MainBloc()
                                      ))
                                  );
                                },
                              )
                          )
                      ),
                    ],
                  )
              )
          ),
        )

      ),
    );
  }
}