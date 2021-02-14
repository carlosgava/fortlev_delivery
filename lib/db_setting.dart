const String DATABASE_NAME = "delivery.db";
const String TABLE_NAME_DELIVERY = "delivery";
const String TABLE_NAME_INVOICES = "invoices";
const String CREATE_TABLE_SCRIPT =
    "CREATE TABLE delivery(invoice_id TEXT PRIMARY KEY, clientName TEXT, clientPhone TEXT, addressLine1 TEXT, addressLine2 TEXT, lat REAL, lon REAL); " +
    "CREATE TABLE invoice_items(invoice_id TEXT, invoice_item_id TEXT, item_description TEXT, quantity INTEGER, unity_price REAL);";
