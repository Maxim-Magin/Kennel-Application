
import 'package:flutter/material.dart';

import 'Bloc/bloc_provider.dart';
import 'Bloc/servicePageBloc.dart';
import 'Images.dart';



class DescriptionCategory extends StatefulWidget{
  int _itemIndex;

  DescriptionCategory(this._itemIndex);

  @override
  State<StatefulWidget> createState() => _DescriptionCategoryState();
}

class _DescriptionCategoryState extends State<DescriptionCategory>{
  ServicesPageBloc _bloc;
  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> descriptionText = new List<String>(6);
    String imagePath;
    switch(widget._itemIndex){
      case 0:
        descriptionText[0] = "Live consultation ";
        descriptionText[1] = " takes place with the owners";
        descriptionText[2] = "in the \"question-answer\" mode,";
        descriptionText[3] ="who contacted us";
        descriptionText[4] ="with the problems of their dogs";
        descriptionText[5] = "on their upbringing and training";
        imagePath = Images.consultationImagePath();
        break;
      case 1:
        descriptionText[0] = "Our specialists are ready";
        descriptionText[1] = "to work with dog owners";
        descriptionText[2] = "to keep their Pets.";
        descriptionText[3] ="They will tell you about";
        descriptionText[4] ="the best ways to take care of";
        descriptionText[5] = "and help you master them.";
        imagePath = Images.keepingImagePath();
        break;
      case 2:
        descriptionText[0] = "For each puppy, we are ready";
        descriptionText[1] = "to provide ";
        descriptionText[2] = "all the necessary documents,";
        descriptionText[3] ="including a metric";
        descriptionText[4] ="containing all the information";
        descriptionText[5] = "about the pet.";
        imagePath = Images.metricsImagePath();
        break;
      case 3:
        descriptionText[0] = "We specialize";
        descriptionText[1] = " in raising purebred Pets.";
        descriptionText[2] = "Thanks to the sensitivity ";
        descriptionText[3] ="and responsibility of employees,";
        descriptionText[4] =" puppies grow up healthy,";
        descriptionText[5] = "strong and happy.";
        imagePath = Images.raisingImagePath();
        break;
      case 4:
        descriptionText[0] = "We are ready to take your pet ";
        descriptionText[1] = "on a training course.";
        descriptionText[2] = "Our experts will help you";
        descriptionText[3] ="bring up your dog ";
        descriptionText[4] ="using the latest methods";
        descriptionText[5] = "and proven techniques.";
        imagePath = Images.trainingImagePath();
        break;
      default:
        return null;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "${descriptionText[0]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 5,),
        Text(
          "${descriptionText[1]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 5,),
        Text(
          "${descriptionText[2]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 5,),
        Text(
          "${descriptionText[3]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 5,),
        Text(
          "${descriptionText[4]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 5,),
        Text(
          "${descriptionText[5]}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
              fontFamily: 'AnticSlab-Regular'),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20,),
        Container(
          height: 282,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            )
          ),
        )
      ],
    );
  }
}