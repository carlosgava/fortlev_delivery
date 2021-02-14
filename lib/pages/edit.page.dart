import 'package:flutter/material.dart';
import 'package:fortlev_delivery/models/persistence/delivery.model.dart';
import 'package:fortlev_delivery/pages/home.page.dart';
import 'package:fortlev_delivery/repository/delivery.repository.dart';

class EditorPage extends StatefulWidget {
  final DeliveryModel model;

  EditorPage({this.model});

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repository = DeliveryRepository();

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    if (widget.model.invoice_id == "0")
      create();
    else
      update();
  }

  create() {
    widget.model.invoice_id = null;

    _repository.createDelivery(widget.model).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  update() {
    _repository.updateDelivery(widget.model).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  onError() {
    final snackBar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: widget.model.invoice_id == '0'
            ? Text("Novo Contato")
            : Text("Editar Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                initialValue: widget.model?.clientName,
                onChanged: (val) {
                  widget.model.clientName = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Telefone",
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.model?.clientPhone,
                onChanged: (val) {
                  widget.model.clientPhone = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Endereço",
                ),
                keyboardType: TextInputType.emailAddress,
                initialValue: widget.model?.addressLine1,
                onChanged: (val) {
                  widget.model.addressLine1 = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Endereço invalido';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: onSubmit,
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
