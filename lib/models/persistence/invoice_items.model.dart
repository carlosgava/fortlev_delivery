class InvoiceItems {
  String invoice_id;
  String invoice_item_id;
  String item_description;
  int quantity;
  double unity_price;

  InvoiceItems({this.invoice_id, this.invoice_item_id, this.item_description, this.quantity, this.unity_price});

  Map<String, dynamic> toMap(){
    return {
      'invoice_id': invoice_id,
      'invoice_item_id': invoice_item_id,
      'item_description': item_description,
      'quantity': quantity,
      'unity_price': unity_price,
    };
  }
}