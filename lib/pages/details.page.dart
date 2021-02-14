import 'package:flutter/material.dart';
import 'package:fortlev_delivery/pages/home.page.dart';
import 'package:fortlev_delivery/repository/delivery.repository.dart';

class DetailsPage extends StatefulWidget {
  final String invoice_id;

  DetailsPage({
    @required this.invoice_id,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _repository = new DeliveryRepository();

  onDelete() {
    showDialog(
      context: context,
      builder: (ctx) {
        return new AlertDialog(
            title: new Text("Exclusão de Contato"),
            content: new Text("Deseja excluir este contato?"),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]);
      },
    );
  }


  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  onError(err) {
    print(err);
  }

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getContact(widget.id),
      builder: (ctx, snp) {
        if (snp.hasData) {
          ContactModel contact = snp.data;
          return page(context, contact);
        } else {
          return LoadingView();
        }
      },
    );
  }

  Widget page(BuildContext context, ContactModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrega"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          ContactDetailsImage(
            image: model.image,
          ),
          SizedBox(
            height: 10,
          ),
          ContactDetailsDescription(
            name: model.name,
            email: model.email,
            phone: model.phone,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  launch("tel://${model.phone}");
                },
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                onPressed: () {
                  launch("mailto://${model.email}");
                },
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.email,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                onPressed: takePicture,
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.camera_enhance,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text(
              "Endereço",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.addressLine1 ?? "Nenhum endereço cadastrado",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  model.addressLine2 ?? "",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressView(
                      model: model,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              color: Color(0xFFFF0000),
              child: FlatButton(
                child: Text(
                  "Excluir Contato",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onPressed: onDelete,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: model,
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
