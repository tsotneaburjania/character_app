import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/crud_operations.dart';

import 'home_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  int id = 0;
  String  todo = "";
  String description = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;

    bool submitted = false;

    void submitFunction() async {
      bool result = false;
      setState(() => submitted = true);
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        CRUDOperations.addItem(
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
        title: const Text('Add'),
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
                          style: const TextStyle(fontSize: 22.0, color: Colors.yellow),
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
                            autofocus: true,
                            onChanged: (todoInput){
                              setState(() {
                                log(todoInput);
                                todo = todoInput;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
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
                            onChanged: (descInput){
                              setState(() {
                                description = descInput;
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
                      )
                  ),
                  TextButton(
                      onPressed:
                      id.toString().isNotEmpty ||
                      todo.isNotEmpty ||
                      description.isNotEmpty
                      ? submitFunction : null,

                      child: const Text('Add', style: TextStyle(fontSize: 18.0),),
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
                      )
                  ),
                ],
              )
              ],
            ),
        ),
          ),
      ],
      ),

    );
  }
}
