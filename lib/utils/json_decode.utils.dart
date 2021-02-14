import 'dart:developer' as dev;
import 'package:fortlev_delivery/factory/build.factory.dart';

class JSONAppDecodable {
  static T fromJson<T>(Map<String, dynamic> json) {
    final T converted =
    BuilderAppFactory.buildAll(json)[T]?.call() as T;

    if (converted != null) {
      return converted;
    } else {
      dev.log('NÃO POSSO FAZER O PARSE DE: $T, PARECE QUE VOCÊ PERDEU !!!');
      throw Exception();
    }
  }

  static List<T> fromJsonList<T>(List<dynamic> jsonList) {
    return jsonList.map((dynamic json) => fromJson<T>(json)).toList();
  }
}
