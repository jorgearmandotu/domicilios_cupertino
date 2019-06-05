
import 'package:domicilios_cupertino/widgets/mi_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuarioInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return CupertinoTabScaffold(
      tabBar: MyTabBar(),
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
          builder: (BuildContext context){
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Usuario'),
              ),
              child: UserForm(),
            );
          },
        );
      },
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  UserFormState createState(){
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();

  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
        children: <Widget>[
          TextFormField(
            controller: _nombre,
            decoration: InputDecoration(labelText: 'Nombre: ', hintText: 'Nombre usuario'),
            validator: (value){
              if(value.isEmpty){
                return 'Ingrese Nombre';
              }
            },
          ),
          CupertinoButton(
            child: Text('Ingresar'),
            color: CupertinoColors.activeBlue,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}