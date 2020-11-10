
import 'package:dog_kennel/Bloc/bloc_provider.dart';
import 'package:dog_kennel/Bloc/servicePageBloc.dart';
import 'package:dog_kennel/Images.dart';
import 'package:dog_kennel/categoryItem.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget{

  final List<String> _categoriesImagePath;
  CategoryList(this._categoriesImagePath);

  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>{
  ServicesPageBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = LegacyBlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _bloc.getCategoryContent().length,
        itemBuilder: (BuildContext context, int index){
          return CategoryItem(widget._categoriesImagePath[index], index);
        },
      ),
    );
  }
}

