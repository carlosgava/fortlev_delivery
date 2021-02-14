import 'package:flutter/widgets.dart';

class InvoiceDetailsDescription extends StatelessWidget {
  final String invoiceID;
  final String clientName;
  final String addressLine1;
  final String addressLine2;


  InvoiceDetailsDescription({@required this.invoiceID, @required this.clientName, @required this.addressLine1, @required this.addressLine2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(invoiceID, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        Text(clientName, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),),
        Text(addressLine1, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),),
        Text(addressLine2, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),),
      ],
    );
  }
}