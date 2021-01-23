class Glossary {
  final String title, body;
  Glossary(this.title, this.body) :
  assert(title!=null),
  assert(title.isNotEmpty),
  assert(body!=null),
  assert(body.isNotEmpty);
}