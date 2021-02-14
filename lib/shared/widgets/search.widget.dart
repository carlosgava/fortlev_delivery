import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fortlev_delivery/common/home.common.dart';

class SearchAppBar extends StatelessWidget {
  final HomeController controller;

  SearchAppBar({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Observer(
        builder: (_) => controller.showSearch
            ? TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: "Pesquisar...",
          ),
          onSubmitted: (val) {
            controller.search(val);
          },
        )
            : Text("Minhas entregas"),
      ),
      centerTitle: true,
      leading: FlatButton(
        onPressed: () {
          if (controller.showSearch) controller.search("");
          controller.toggleSearch();
        },
        child: Observer(
          builder: (_) => Icon(
            controller.showSearch ? Icons.close : Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
