import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/aircraft.dart';
import 'models/glossary.dart';
import 'models/home_model.dart';
import 'models/more_op.dart';

class Services{

Future<HomeModel> getHomeModel() async {
  await Firebase.initializeApp();
  
  DocumentSnapshot qs = await FirebaseFirestore.instance
      .collection('general')
      .doc('general')
      .get();

  return HomeModel(
    welcome: Glossary(qs['welcometitle'], qs['welcomebody']),
    moreop: MoreOp(name: qs['name'], url: qs['url'], icon: qs['icon'])
  );
}

Future<List<Aircraft>> getAirs() async {
  List<Aircraft> ret = [];
  QuerySnapshot qs = await FirebaseFirestore.instance.collection('mds').get();

  qs.docs.forEach((v) {
    ret.add(Aircraft(
        name: v.get('name'),
        fs0: v.get('fs0'),
        fs1: v.get('fs1'),
        mom0: v.get('mom0'),
        mom1: v.get('mom1'),
        weight0: v.get('weight0'),
        weight1: v.get('weight1'),
        simplemom: v.get('simplemom'),
        lemac: v.get('lemac'),
        mac: v.get('mac'),
        cargomaxweight: v.get('cargomaxweight'),
        tanknames: v.get('tanknames'),
        tankmoms: v.get('tankmoms'),
        tankweights: v.get('tankweights'),
        titles: v.get('titles'),
        bodys: v.get('bodys'),
        cargonames: v.get('cargonames'),
        cargoweights: v.get('cargoweights'),
        cargomoms: v.get('cargomoms'),
        configstrings: v.get('configs')));
  });
  return ret;
}
}
