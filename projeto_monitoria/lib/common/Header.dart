// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.home,color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      title: Text("Rede Social", style: TextStyle(color: Colors.white),),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      
    );
  }
}
