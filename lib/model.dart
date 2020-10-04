import 'package:cloud_firestore/cloud_firestore.dart';

class Glossary{
  final String title,body;
  Glossary(this.title,this.body);
}

class Tank{
  final String name,weight,moment;
  List<String> weights,moments;
  Tank(this.name,this.weight,this.moment){
    weights = weight.split(',');
    moments = moment.split(',');
  }
}

class Aircraft{
  List<Tank> tanks;
  final String name,weight0,weight1,moment0,moment1,fs0,fs1;
  QueryDocumentSnapshot doc;
  
  Aircraft(
    this.name,this.weight0,this.weight1,this.moment0,this.moment1,this.fs0,
    this.fs1,this.doc
  ){
    //doc.
  }
}