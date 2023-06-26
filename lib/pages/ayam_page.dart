import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Todo {
  final String ticket;
  final Color color;
  final DateTime dateTime;

  Todo({
    required this.ticket,
    required this.color,
    required this.dateTime,
  });
}

class TodoController extends GetxController {
  final TextEditingController ayamMatiController = TextEditingController();
  final TextEditingController beliAyamController = TextEditingController();
  final TextEditingController totalBiayaPakanController =
      TextEditingController();
  final TextEditingController totalBiayaPembelianController =
      TextEditingController();
  final todos = <Todo>[].obs;

  List<String> ayamMatiOptions = ['10', '20', '30', '40', '50', 'Custom'];
  List<String> beliAyamOptions = ['10', '20', '30', '40', '50', 'Custom'];

  String selectedAyamMati = '10';
  String selectedBeliAyam = '10';
  String customAyamMati = '';
  String customBeliAyam = '';

  void addTodo() {
    String ayamMati = selectedAyamMati;
    String beliAyam = selectedBeliAyam;
    String totalBiayaPakan = totalBiayaPakanController.text;
    String totalBiayaPembelian = totalBiayaPembelianController.text;

    if (ayamMati.isNotEmpty &&
        beliAyam.isNotEmpty &&
        totalBiayaPakan.isNotEmpty &&
        totalBiayaPembelian.isNotEmpty) {
      Color itemColor = Colors.blue; // Changed to blue color
      String ticket = 'Ayam Mati: $ayamMati\n'
          'Beli Ayam: $beliAyam\n'
          'Total Biaya Pakan: $totalBiayaPakan\n'
          'Total Biaya Pembelian Anak Ayam: $totalBiayaPembelian';
      DateTime now = DateTime.now();
      todos.add(Todo(
        ticket: ticket,
        color: itemColor,
        dateTime: now,
      ));
      ayamMatiController.clear();
      beliAyamController.clear();
      totalBiayaPakanController.clear();
      totalBiayaPembelianController.clear();
    }
  }
}

class AyamPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayam Page'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Todo List',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  radius: Radius.circular(8),
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (context, index) {
                      Todo todo = todoController.todos.reversed.toList()[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: todo.color,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.ticket,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 1),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Added on: ${DateFormat('dd/MM/yy HH:mm').format(todo.dateTime)}',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Form Ticket',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: Scrollbar(
                          isAlwaysShown: true,
                          radius: Radius.circular(8),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DropdownButtonFormField<String>(
                                  value: todoController.selectedAyamMati,
                                  items: todoController.ayamMatiOptions
                                      .map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    todoController.selectedAyamMati = value!;
                                    if (value == 'Custom') {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Custom Ayam Mati',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextField(
                                                    onChanged: (text) {
                                                      todoController
                                                              .customAyamMati =
                                                          text;
                                                    },
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Custom Ayam Mati',
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    child: Text('Submit'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Ayam Mati',
                                  ),
                                ),
                                SizedBox(height: 10),
                                DropdownButtonFormField<String>(
                                  value: todoController.selectedBeliAyam,
                                  items: todoController.beliAyamOptions
                                      .map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    todoController.selectedBeliAyam = value!;
                                    if (value == 'Custom') {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Custom Beli Ayam',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextField(
                                                    onChanged: (text) {
                                                      todoController
                                                              .customBeliAyam =
                                                          text;
                                                    },
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Custom Beli Ayam',
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    child: Text('Submit'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Beli Ayam',
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller:
                                      todoController.totalBiayaPakanController,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                    labelText: 'Total Biaya Pakan',
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: todoController
                                      .totalBiayaPembelianController,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
                                    labelText:
                                        'Total Biaya Pembelian Anak Ayam',
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          todoController.addTodo();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    title: 'Todo App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AyamPage(),
  ));
}
