
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(child:Icon(CupertinoIcons.back),
          onPressed: (){
            Navigator.pop(context);
          },),
          middle: Text('Second Pague'),
        ),
        child: Center(
    child: CupertinoButton(
      child: Text('volver'),
      color: CupertinoColors.activeBlue,
      onPressed: (){
        Navigator.of(context).pop(false);
      },
    ),
  ),
      )
    );
  }
}

