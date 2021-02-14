import 'package:fortlev_delivery/models/persistence/delivery.model.dart';
import 'package:fortlev_delivery/repository/delivery.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.common.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool showSearch = false;

  @observable
  ObservableList<DeliveryModel> contacts = new ObservableList<DeliveryModel>();

  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    final repository = new DeliveryRepository();
    contacts = new ObservableList<DeliveryModel>();
    var data = await repository.searchDelivery(term);
    contacts.addAll(data);
  }
}
