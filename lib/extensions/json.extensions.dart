import 'package:fortlev_delivery/utils/json_decode.utils.dart';
import 'package:intl/intl.dart';

extension FormatDateTime on String {
  DateTime date({
    String format = 'yyyy-MM-dd',
  }) {
    try {
      return DateFormat(format).parseStrict(this);
    } catch (exception) {
      return null;
    }
  }
}

extension SafelyUnwrappingString on Map {
  String stringOf(String key) {
    return this[key];
  }
}

extension SafelyUnwrappingDouble on Map {
  double doubleOf(String key) {
    return (this[key] as num).toDouble();
  }

  double doubleOfString(String key) {
    return num.tryParse(this[key])?.toDouble() ?? 0.00;
  }
}

extension SafelyUnwrappingInt on Map {
  int intOf(String key) {
    return (this[key] as num).toInt();
  }

  int intOfString(String key) {
    return num.tryParse(this[key])?.toInt() ?? 0;
  }
}

extension SafelyUnwrappingBool on Map {
  bool boolOf(String key) {
    return this[key];
  }
}

extension SafelyUnwrappingList on Map {
  List<T> listOf<T>(String key) {
    final List<dynamic> _list = this[key];

    final List<Map<String, dynamic>> _listOf = _list
        .map((dynamic object) => Map<String, dynamic>.from(object))
        .toList();

    return JSONAppDecodable.fromJsonList<T>(_listOf);
  }
}

extension SafelyUnwrappingStringList on Map {
  List<String> listStringOf(
      Map<String, dynamic> json, {
        String key,
      }) {
    final List<dynamic> _list = json[key];

    return _list.cast<String>().toList();
  }
}

extension SafelyUnwrappingObject on Map {
  T objectOf<T>(String key) {
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this[key]);
    return JSONAppDecodable.fromJson<T>(objectOf);
  }
}

extension SafelyUnwrappingThisObject on Map {
  T objectOfThis<T>() {
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this);
    return JSONAppDecodable.fromJson<T>(objectOf);
  }
}

extension SafelyUnwrappingDateTime on Map {
  DateTime dateOf(
      String key, {
        String format = 'yyyy-MM-dd',
      }) {
    final String dateString = stringOf(key);
    return dateString.date();
  }
}
