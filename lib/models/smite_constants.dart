// ignore: constant_identifier_names
enum SmiteRole {
  solo('Solo'),
  mid('Mid'),
  jungle('Jungle'),
  carry('Carry'),
  support('Support');

  const SmiteRole(this.value);
  final String value;
}
