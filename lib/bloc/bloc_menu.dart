import '../models/menu.dart';
import 'package:rxdart/rxdart.dart';
import '../services/api_service.dart';

class BlocMenu {
  ApiService apiService = new ApiService();
  BehaviorSubject<List<Menu>> _listMenus = BehaviorSubject<List<Menu>>();
  Observable<List<Menu>> get allMenu => _listMenus.stream;

  fetchAllMenu({String idMenu}) async {
    if(idMenu != null){

    }else{
      _listMenus.sink.add(await apiService.getMenu());
    }
  }

  void open(){
    _listMenus = BehaviorSubject<List<Menu>>();
  }

  void dispose(){
    _listMenus.close();
  }
}

final blocMenu = BlocMenu();