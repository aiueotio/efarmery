import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final Function(String) onSave;

  TodoForm({required this.onSave});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  late String _todoTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Todo Title',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) {
              _todoTitle = value!;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSave(_todoTitle);
                _formKey.currentState!.reset();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
