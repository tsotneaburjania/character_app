import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/detail_blueprint.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/todo_item.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/crud_operations.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  int id = 0;
  String  todo = "";
  String description = "";
  final _formKey = GlobalKey<FormState>();
  bool isInitialized = false;

  DetailBlueprint detailObject = DetailBlueprint(index: 0, todoItem: TodoItem(id: 0, todo: "", description: ""));

  @override
  void didChangeDependencies() {
    // OBTAINING ROUTE ARGUMENTS ONLY ONCE.
    if (!isInitialized) {
      detailObject = ModalRoute.of(context)!.settings.arguments as DetailBlueprint;
      id = detailObject.todoItem.id;
      todo = detailObject.todoItem.todo;
      description = detailObject.todoItem.description;
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    bool submitted = false;

    void submitFunction() {
      setState(() => submitted = true);
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        CRUDOperations.editItem(
            detailObject.index,
            id,
            todo,
            description
        );
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
          centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: viewportHeight - 100,
            child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Center(
                child: SizedBox(
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children:  [
                        TextFormField(
                          // controller: idEc..text = id.toString(),
                          initialValue: id.toString(),
                          // controller: TextEditingController()..text = detailObject.clothes.id.toString(),
                          // controller: TextEditingController(text: detailObject.clothes.id.toString()),
                          style: const TextStyle(fontSize: 22.0, color: Colors.yellow, ),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.0, ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow, width: 1.0, ),
                            ),
                            hintText: 'Please enter ID',
                            hintStyle: TextStyle(color: Colors.yellow),
                            filled: true,
                            contentPadding:
                            EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                          ),
                          autovalidateMode: submitted
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Field shall not be left empty.';
                            }
                            return null;
                          },
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          // onChanged: (text) => setState(() => id = text as int),
                          onChanged: (idInput){
                            setState(() {
                              id = int.parse(idInput);
                            });
                            log("id $id");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: nameEc..text = name,
                            initialValue: todo,
                            style: const TextStyle(fontSize: 22.0, color: Colors.yellow, ),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 0.0, ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow, width: 1.0, ),
                              ),
                              hintText: 'Please enter TODO',
                              hintStyle: TextStyle(color: Colors.yellow),
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (nameInput){
                              setState(() {
                                todo = nameInput;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            // controller: descEc..text = description,
                            initialValue: description,
                            style: const TextStyle(fontSize: 22.0, color: Colors.yellow, ),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 0.0, ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow, width: 1.0, ),
                              ),
                              hintText: 'Please enter description',
                              hintStyle: TextStyle(color: Colors.yellow),
                              filled: true,
                              contentPadding:
                              EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0, right: 20.0),
                            ),
                            autovalidateMode: submitted
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Field shall not be left empty.';
                              }
                              return null;
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            onChanged: (descriptionInput){
                              setState(() {
                                description = descriptionInput;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text('Back', style: TextStyle(fontSize: 18.0),),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 30)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          // fixedSize: MaterialStateProperty.all<Size>(Size.square())
                        )
                    ),
                    TextButton(
                        onPressed:
                        // id.toString().isNotEmpty ||
                        //     todo.isNotEmpty ||
                        //     description.isNotEmpty
                        //     ? submitFunction : null,
                        id.toString().isNotEmpty ||
                            todo.isNotEmpty ||
                            description.isNotEmpty
                            ? submitFunction : null,

                        child: const Text('Edit', style: TextStyle(fontSize: 18.0),),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(150, 30)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          // fixedSize: MaterialStateProperty.all<Size>(Size.square())
                        )
                    ),
                  ],
                )
              ],
            ),
        ),
          ),
    ]
      ),
    );
  }
}
