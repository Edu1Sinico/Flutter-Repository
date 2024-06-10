// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:projeto_api_geo/model/city.dart';

// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({super.key});

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: tasks.length, // Número de itens na lista de tarefas
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(tasks[index]), // Título do item da lista
//             onLongPress: () {
//               setState(() {
//                 tasks.removeAt(index); // Remove a tarefa da lista
//                 saveTasks(); // Salva as tarefas atualizadas
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }
