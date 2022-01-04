import 'package:flutter/material.dart';
import 'package:character_app/logic/crud_operations.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> futureTodo;

  @override
  void initState() {
    super.initState();
    // futureTodo = CRUDOperations.fetchAllChars();
  }


  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 3.0;
    double cardHeight = MediaQuery.of(context).size.height / 3.3;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Task Management', style: TextStyle(color: Colors.yellow),),
          centerTitle: true,
        ),
      body: FutureBuilder<List<dynamic>>(
            future: futureTodo,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {

                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 18.0,
                      // childAspectRatio: MediaQuery.of(context).size.height / 950,
                      childAspectRatio: (() {
                        if (MediaQuery.of(context).orientation == Orientation.portrait){
                          return MediaQuery.of(context).size.height / 950;
                        }
                        else if (MediaQuery.of(context).orientation == Orientation.landscape){
                          return MediaQuery.of(context).size.height / 400;
                        }
                      }())!,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.yellow,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(snapshot.data![index]["results"]["name"], style: const TextStyle(color: Colors.black, fontSize: 25.0), textAlign: TextAlign.center,),
                                ),
                                subtitle: Text(snapshot.data![index]["results"]["homeworld"], style: const TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                );
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            },
          ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: (){
          // log('data: ${futureTodo.id}');
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
