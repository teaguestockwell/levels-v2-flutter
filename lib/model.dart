import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Aircraft {
  final String name, fs0, fs1, mom0, mom1, weight0, weight1, simplemom;

  final List<dynamic> 
    tanknames,
    tankmoms,
    tankweights,
    titles,
    bodys,
    cargonames,
    cargoweights,
    cargomoms;
  
  List<Tank> 
  tanks=List<Tank>();

  List<NameWeightFS>
  addaCargo=List<NameWeightFS>(),///List of all add cargo
  config;///the dynamicly created list of NameWeightFS consisting of fuel, cargo, basic mom, basic w

  Aircraft(
    this.name,
    this.fs0,
    this.fs1,
    this.mom0,
    this.mom1,
    this.weight0,
    this.weight1,
    this.simplemom,
    this.tanknames,
    this.tankmoms,
    this.tankweights,
    this.titles,
    this.bodys,
    this.cargonames,
    this.cargoweights,
    this.cargomoms,
  )
  {
    // create tanks
    for(int i=0; i<tanknames.length; i++){
      tanks.add(
        Tank(
          tanknames[i],
          tankweights[i],
          tankmoms[i],
          simplemom,
        )
      );
    }

    //create addaA cargo
    for(int i=0; i<cargomoms.length; i++){
      addaCargo.add(
        NameWeightFS(
          name: cargonames[i],
          weight: cargoweights[i],
          mom: cargomoms[i],
          simplemom: this.simplemom,
        )
      );
    }

    }
  }
//}

  ///Tank is a list of NameWeightMoment
  class Tank{
    final String
      name,
      _weightsCSV,
      _momCSV,
      simplemom;
      

    List<NameWeightFS> 
      nameWeightFSs=List<NameWeightFS>();

    List<String>
      _weights=List<String>(),
      _moms=List<String>();

    Tank(
      this.name,
      this._weightsCSV,
      this._momCSV,
      this.simplemom,
    )
    {
      _weights = _weightsCSV.split(',');
      _moms = _momCSV.split(',');
      
      for(int i=0;i<_weights.length;i++){
        nameWeightFSs.add(
          NameWeightFS(
          name: name,
          weight: _weights[i],
          mom: _moms[i],
          simplemom: simplemom
          )
        );
      }
    }
  }

  /// NameWeightMom hold a String name,weight,fs,moment; of a cargo item;
  class NameWeightFS{
    
    String
    simplemom, /// modifier for simple moment 
    name,
    weight,
    mom, ///simple moment 
    fs,
    qty;

    NameWeightFS(
      {
        //these are named optinal params 
        //default value is given
        this.name='',
        this.weight='',
        this.fs='',
        this.mom='',
        this.simplemom='0',
        this.qty='1'
      }
    ){
      print(this.toString());
    }

    @override
    String toString(){
      return("name: "+name+" weight: "+weight+" mom: "+getMom()+" fs: "+getFS());
    }

    String getMom(){
      if(mom.isNotEmpty){return mom;}
      return (P.p(fs)* P.p(weight) / P.p(simplemom)).toString();
    }

    String getFS(){
      if(fs.isNotEmpty){return fs;}
      return (P.p(mom) * P.p(simplemom) / P.p(weight)).toString();
    }
  }

class General {
  String csvAllMds, welcometitle, welcomebody;

  General(this.csvAllMds, this.welcometitle, this.welcomebody);
}

class Glossary {
  final String 
  title,
  body;

  Glossary(
    this.title,
    this.body
  );
}

///Helper class to try parsing doubles. 
class P{
  ///Given a string try to parse into double. If fail make toast with error.
  static double p(String s){
    double p,z=0.0;
      p = double.tryParse(s);
      if(p!=null){return p;}
      Fluttertoast.showToast(
        msg:s+ " is not a number. Assigning value 0.",
        gravity: ToastGravity.CENTER,
        );
      return z;
  }
}