import 'package:fortlev_delivery/db_setting.dart';
import 'package:fortlev_delivery/models/persistence/delivery.model.dart';
import 'package:fortlev_delivery/models/persistence/invoice_items.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DeliveryRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future createDelivery(DeliveryModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NAME_DELIVERY,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future createInvoices(InvoiceItems items) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NAME_INVOICES,
        items.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future updateDelivery(DeliveryModel model) async {
    try {
      final Database db = await _getDatabase();

      await db.update(
        TABLE_NAME_DELIVERY,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.invoice_id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<DeliveryModel>> getDeliveries() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME_DELIVERY);

      return List.generate(
        maps.length,
            (i) {
          return DeliveryModel(
            invoice_id: maps[i]['invoice_id'],
            clientName: maps[i]['clientName'],
            clientPhone: maps[i]['clientPhone'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<DeliveryModel>();
    }
  }

  Future<List<DeliveryModel>> searchDelivery(String term) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME_DELIVERY,
        where: "clientName LIKE ?",
        whereArgs: [
          '%$term%',
        ],
      );

      return List.generate(
        maps.length,
            (i) {
          return DeliveryModel(
            invoice_id: maps[i]['invoice_id'],
            clientName: maps[i]['clientName'],
            clientPhone: maps[i]['clientPhone'],
            addressLine1: maps[i]['addressLine1'],
            addressLine2: maps[i]['addressLine2'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<DeliveryModel>();
    }
  }

  Future<DeliveryModel> getDelivery(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME_DELIVERY,
        where: "id = ?",
        whereArgs: [id],
      );

      return DeliveryModel(
        invoice_id: maps[0]['invoice_id'],
        clientName: maps[0]['clientName'],
        clientPhone: maps[0]['clientPhone'],
        addressLine1: maps[0]['addressLine1'],
        addressLine2: maps[0]['addressLine2'],
      );
    } catch (ex) {
      print(ex);
      return new DeliveryModel();
    }
  }
}