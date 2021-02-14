typedef ObjectBuilder = Object Function();
typedef ModelBuilderFactory = Map<Type, ObjectBuilder> Function(
    Map<String, dynamic>);

mixin BuilderAppFactory {
  static ModelBuilderFactory buildAll =
      (Map<String, dynamic> json) => <Type, ObjectBuilder>{
  };
}

mixin AppModelFactory {
  static ModelBuilderFactory build = (Map<String, dynamic> json) =>
  <Type, ObjectBuilder>{}
    ..addAll(BuilderAppFactory.buildAll(json));
}