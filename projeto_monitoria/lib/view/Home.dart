// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:projeto_monitoria/common/Header.dart';
import 'package:projeto_monitoria/view/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 25),
            Text('Bem vindo!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 250),
            ElevatedButton(
              onPressed: () {
                // Forma simples de realizar a naveção
                Navigator.pushNamed(context, '/Login');
                // Forma direta de realizar a navegação
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const LoginPage(),
                //   ),
                // );
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 0, 13, 126)),
              ),
              child: Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
