import 'package:domicilios_cupertino/widgets/usuario_info.dart';
import 'package:flutter/cupertino.dart';
import './second_page.dart';

class MyTabBar extends CupertinoTabBar {
  MyTabBar(): super(
    items: <BottomNavigationBarItem> [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),//principal
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), activeIcon: SeconPage()),//pedido actual
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),//favoritos
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), activeIcon: UsuarioInfo()),//congifuracion de usuario
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.restart)),//informacion
    ],
  );
}