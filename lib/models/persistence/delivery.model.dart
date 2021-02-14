class DeliveryModel {
  String invoice_id;
  String clientName;
  String clientPhone;
  String addressLine1;
  String addressLine2;

  DeliveryModel({this.invoice_id, this.clientName, this.clientPhone, this.addressLine1, this.addressLine2});

  Map<String, dynamic> toMap(){
    return{
      'invoice_id': invoice_id,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
    };
  }
}