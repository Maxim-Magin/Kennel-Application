
import 'dart:async';

import 'package:dog_kennel/Images.dart';
import 'package:flutter/material.dart';

import 'Bloc/bloc_provider.dart';
import 'Bloc/servicePageBloc.dart';

class CategoryItem extends StatefulWidget{
  final String _itemImagePath;
  final int _itemIndex;
  CategoryItem(this._itemImagePath, this._itemIndex);

  @override
  State<StatefulWidget> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>{
  ServicesPageBloc _bloc;
  double _width;
  double _height;
  double _fontSize;
  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    _bloc.outSelectedCategoryIndex.listen((index) {
      if(widget._itemIndex == index){
        setState(() {
          _width = 120;
          _height = 100;
          _fontSize = 20;
        });
      }
      else
        setState(() {
          _width = 100;
          _height = 70;
          _fontSize = 15;
        });
    });
    return GestureDetector(
      onTap: (){
        _bloc.inSelectedCategoryIndex.add(widget._itemIndex);
      },
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          AnimatedContainer(
            height:_height,
            width: _width ,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget._itemImagePath),
                  )
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            "${_bloc.getCategoryName(widget._itemIndex)}",
            style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold,
                color: Colors.black, fontFamily: 'Rowdies'),
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}

