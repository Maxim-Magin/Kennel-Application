import 'package:flutter/material.dart';
import 'bloc_base.dart';

class LegacyBlocProvider<T extends BlocBase>extends StatefulWidget {
  LegacyBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _LegacyBlocProviderState<T>createState() => _LegacyBlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<LegacyBlocProvider<T>>();
    LegacyBlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _LegacyBlocProviderState<T> extends State<LegacyBlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }
}