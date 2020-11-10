
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/servicePageBloc.dart';
import 'package:dog_kennel/category.dart';
import 'package:flutter/material.dart';

import '../Images.dart';
import '../descriptionCategory.dart';

class ServicesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>{
  ServicesPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LegacyBlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
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
                          'SERVICES',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Color(0xFFB71C1C),
                              fontFamily: 'Rowdies'),
                          textAlign: TextAlign.justify,
                        )
                    ),
                    SizedBox(height: 5,),
                    StreamBuilder(
                      stream: _bloc.outAllCategories,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>> snapshot){
                        if(!snapshot.hasData)
                        {
                          return Container();
                        }
                        final List<String> settings = snapshot.data;
                        return CategoryList(settings);
                      },
                    ),
                    SizedBox(height: 20,),
                    StreamBuilder(
                      stream: _bloc.outSelectedCategoryIndex,
                      builder: (BuildContext context,
                          AsyncSnapshot<int> snapshot){
                        if(!snapshot.hasData)
                        {
                          return Container();
                        }
                        final int settings = snapshot.data;
                        return DescriptionCategory(settings);
                      },
                    )
                  ],
                ),
              ),
            )
        )
      ),
    );
  }
}