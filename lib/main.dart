import 'package:domicilios_cupertino/bloc/bloc_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/mi_tab_bar.dart';
//import './services/api_service.dart';
import 'models/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Principal',
      home: CupertinoTabScaffold(
        tabBar: MyTabBar(),
        tabBuilder: (BuildContext context, int index){
          return CupertinoTabView(
            builder: (BuildContext context){
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Menu'),
                ),
                child: MainView(),
              );
            },
          );
        },
        )
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Text('Desayunos ', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height*0.2 : MediaQuery.of(context).size.height*0.4,
              child: ListMenu()
            ),
            Text('Almuerzos', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              child: ListMenu(),
            ),
            Text('Cenas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Container(
              height: MediaQuery.of(context).size.height*0.30,
              child: ListMenu(),
            ),
            Text('Especiales', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('Helados', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Image.asset('images/desayuno.jpg'),
            Text('Bebidas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('Promociones', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text('Adicionales', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          ],
        ),
    );
     
  }
}

class ListMenu extends StatefulWidget {
  @override
  ListMenuState createState(){
    return ListMenuState();
  }
}

class ListMenuState extends State<ListMenu>{

  @override
  void initState() {
    blocMenu.open();
    blocMenu.fetchAllMenu();
    super.initState();
  }

  void dispose(){
    blocMenu.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: blocMenu.allMenu,
      builder: (context, AsyncSnapshot<List<Menu>> snapshot){
        if(snapshot.hasData){
          return buildListMenu(snapshot);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return CupertinoActivityIndicator();
      },
    );
  }

  Widget buildListMenu(AsyncSnapshot<List<Menu>> snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index){
        Menu plato = snapshot.data[index];
        return cardMenu(plato);
      },
    );
  }

  Widget cardMenu(Menu plato){
    return Card(
          color: CupertinoColors.inactiveGray,
          child: InkWell(
            onTap: (){},
            child: Column(
              children: <Widget>[
                Expanded(
                  child: new Image.network(
                plato.image,
            //height: MediaQuery.of(context).size.height*0.1,
            fit: BoxFit.contain,
          )),
          Text(plato.name),
              ],
            ),
          )
        );
  }
}