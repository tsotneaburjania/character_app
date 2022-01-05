import 'package:character_app/data/planet.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  String name = "";
  String  diameter = "";
  String climate = "";
  String gravity = "";
  String terrain = "";
  String population = "";

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    final detailObject = ModalRoute.of(context)!.settings.arguments as Planet;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: viewportHeight - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Center(
                        child:
                          Text(
                            detailObject.name,
                            style: const TextStyle(fontSize: 40.0, color: Colors.yellow),
                          )
                      ),
                    ]
                  ),
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey, // Set border color
                            width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Diameter", textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow),),
                          Text(
                            detailObject.diameter,
                            style: const TextStyle(fontSize: 20.0, color: Colors.yellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, // Set border color
                          width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Climate", textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow),),
                          Text(
                            detailObject.climate,
                            style: const TextStyle(fontSize: 20.0, color: Colors.yellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, // Set border color
                          width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Gravity", textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow),),
                          Text(
                            detailObject.gravity,
                            style: const TextStyle(fontSize: 20.0, color: Colors.yellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, // Set border color
                          width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Terrain", textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow),),
                          Text(
                            detailObject.terrain,
                            style: const TextStyle(fontSize: 20.0, color: Colors.yellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, // Set border color
                          width: 1.0),   // Set border width
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Population", textAlign: TextAlign.center, style: TextStyle(color: Colors.yellow),),
                          Text(
                            detailObject.population,
                            style: const TextStyle(fontSize: 20.0, color: Colors.yellow),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                )
              ],
            ),
          )
        ],

      ),
    );
  }
}
