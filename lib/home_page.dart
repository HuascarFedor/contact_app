import 'package:contacto_app/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      //body: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context, dataProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context, DataProvider dataProvider) {
    showDialog(
        context: context,
        builder: (context) {
          String name = "";
          String email = "";
          return AlertDialog(
            title: const Text('Nuevo Contacto'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: null,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
                TextField(
                  onChanged: null,
                  decoration: InputDecoration(labelText: "E-Mail"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar')),
              const TextButton(onPressed: null, child: Text('Agregar')),
            ],
          );
        });
  }
}
