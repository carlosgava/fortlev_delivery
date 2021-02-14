import 'package:flutter/material.dart';
import 'package:fortlev_delivery/models/persistence/delivery.model.dart';

class DeliveryList extends StatelessWidget {
  final DeliveryModel model;

  DeliveryList({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
      ),
      title: Text(model.clientName),
      subtitle: Text(model.addressLine1),
      trailing: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsView(id: model.invoice_id,),
            ),
          );
        },
        child: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
