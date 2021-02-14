import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fortlev_delivery/common/home.common.dart';
import 'package:fortlev_delivery/models/persistence/delivery.model.dart';
import 'package:fortlev_delivery/pages/edit.page.dart';
import 'package:fortlev_delivery/shared/widgets/delivery_list.widget.dart';
import 'package:fortlev_delivery/shared/widgets/search.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.search("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchAppBar(
          controller: controller,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.contacts.length,
          itemBuilder: (ctx, i) {
            return DeliveryList(
              model: controller.contacts[i],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorPage(
                model: DeliveryModel(
                  invoice_id: "0",
                ),
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
