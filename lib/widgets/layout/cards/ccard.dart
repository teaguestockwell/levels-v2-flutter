import '../max.dart';
import '../alignPadding.dart';
import '../../../backend/cont.dart';
import '../../../widgets/display/text.dart';
import 'package:flutter/material.dart';

class CCards extends StatefulWidget {
  final String title;
  Widget child;
  bool open;
  final color = Const.rc();

  ///starts open
  CCards(this.title, this.child) {
    this.open = true;
    addPadding();
  }
  //starts closed
  CCards.C(this.title, this.child) {
    this.open = false;
    addPadding();
  }

void addPadding(){
  //wraps first and last widets in padding.
  if(child is Column){
    Column childp = child;
    if(childp.children.length > 1){
      Widget first = childp.children.first;
      Widget last = childp.children.last;
      childp.children.removeAt(0);
      childp.children.removeAt(childp.children.length-1);
      var firstP = Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0), child: first);
      var lastP = Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),child: last,);
      childp.children.insert(0, firstP);
      childp.children.insert(childp.children.length, lastP);
      child =childp;
    }
  }
}

  @override
  _CCardsState createState() => _CCardsState();
}

class _CCardsState extends State<CCards> {
  bool ope;
  Widget chil;
  Widget title;

  @override
  void initState() {
    ope = this.widget.open;
    if (ope) {
      chil = this.widget.child;
      title = TitleCC(open:true,tex:Tex(this.widget.title,fontWeight: FontWeight.normal, color: this.widget.color)); 
    } else {
      chil = Container();
      title = TitleCC(open:false,tex:Tex(this.widget.title,fontWeight: FontWeight.normal,color: this.widget.color,));
    }
    super.initState();
  }

  void toggleChild() {
    ope = !ope;
    setState(() {
      if (ope) {
        chil = this.widget.child;
        title = TitleCC(open:true,tex:Tex(this.widget.title,fontWeight: FontWeight.normal, color: this.widget.color));
      } else {
        chil = Container();
        title = TitleCC(open:false,tex:Tex(this.widget.title,fontWeight: FontWeight.normal,color: this.widget.color,));
      } 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Max(
      w: Const.maxCardWidth,
      child:Padding(
        padding: EdgeInsets.fromLTRB(
          Const.cardP,
          Const.cardP,
          Const.cardP,
          0.0
          ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: Const.cardColor,
                shape: Border(
                    top: BorderSide(
                  color: Const.cardColor,
                  width: Const.cardTabSize,
                )),
                child: Column(
                  children: [
                    InkWell(
                        child: AlignPadding(
                            3.0, Alignment.center, title),
                        onTap: toggleChild),
                    chil
                  ],
                )))));
  }
}

///used for cccard titles to create a title row with drop cards
class TitleCC extends StatelessWidget {
  final Tex tex;
  final bool open;
  TitleCC({@required this.tex, @required this.open});
  @override
  Widget build(BuildContext context) {
    if(open){
      return 
      Container(
        width:  MediaQuery.of(context).size.width/.8,
        child:Row(children:[
          Icon(Icons.arrow_drop_up),
          Spacer(),
          tex,
          Spacer(),
          Icon(Icons.arrow_drop_up),
        ]
      ));
    }
    else{
      return 
      Container(
        width:  MediaQuery.of(context).size.width/.8,
        child:Row(children:[
          Icon(Icons.arrow_drop_down),
          Spacer(),
          tex,
          Spacer(),
          Icon(Icons.arrow_drop_down),
        ]
      ));
    }
  }
}