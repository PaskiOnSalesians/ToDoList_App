import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: const Icon(
          Icons.add_outlined,
          size: 30,
          color: Colors.black
        ),
        /*IconButton(
          icon: Icons.add_outlined, onPressed: () {  },
        ),*/
        centerTitle: true,
        title: const Text(
          'My Daily Tasks',
          style: TextStyle(
            color: Colors.black,
          )
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding( padding: EdgeInsets.all(20),
            child: IconButton(icon: Icons.ac_unit, onPressed: () {  },),
            
          ),
          Icon(
            Icons.add_outlined,
            size: 30,
            color: Colors.black,
        ),
        ]
      ),
    );
  }
}