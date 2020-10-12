class Glossary {
  final String title, body;

  Glossary(this.title, this.body);
}

class Aircraft {
  final String name, fs0, fs1, mom0, mom1, weight0, weight1, simplemom;

  final List<dynamic> tanknames,
      tankmoms,
      tankweights,
      titles,
      bodys,
      cargonames,
      cargoweights,
      cargomoms;

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
  );
}

class General {
  String csvAllMds, welcometitle, welcomebody;

  General(this.csvAllMds, this.welcometitle, this.welcomebody);
}
