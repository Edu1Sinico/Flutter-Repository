import 'package:flutter/material.dart';
import 'package:app_shopping_list/listaComprasController.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova tarefa
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Nova Lista de Compras',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<ListaComprasController>(context, listen: false)
                        .adicionarCompra(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.compras[index].descricao),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.compras[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirCompra(index);
                      },

                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          AlertDialog alert = AlertDialog(
                            title: Text("Atualizar Lista"),
                            content: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: 'Atualizar Lista de Compras',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  model.atualizarCompra(
                                      index, _controller.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
