import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      home: ToDoListHomePage(),
    );
  }
}

class ToDoListHomePage extends StatefulWidget {
  @override
  _ToDoListHomePageState createState() => _ToDoListHomePageState();
}

class _ToDoListHomePageState extends State<ToDoListHomePage> {
  final _itemController = TextEditingController();
  final _items = <String>[];

  void _addItem() {
    setState(() {
      _items.add(_itemController.text);
      _itemController.text = '';
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeItem(index),
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _itemController,
            onSubmitted: (text) => _addItem(),
            decoration: InputDecoration(
              hintText: 'Enter a new to-do item',
            ),
          ),
        ],
      ),
    );
  }
}
