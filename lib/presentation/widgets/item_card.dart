import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/detail_blueprint.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/data/todo_item.dart';

class ItemCard extends StatefulWidget {
  final int index;
  final TodoItem todoItem;

  const ItemCard({Key? key, required this.todoItem, required this.index}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        Navigator.pushNamed(context, '/edit', arguments: DetailBlueprint(index: widget.index, todoItem: widget.todoItem));
      },
      onTap: (){
        log('${widget.index}');
        Navigator.pushNamed(context, '/details', arguments: DetailBlueprint(index: widget.index, todoItem: widget.todoItem));
      },
      child: Container(
        color: Colors.yellow,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Text(widget.todoItem.todo, style: const TextStyle(fontSize: 35.0), textAlign: TextAlign.center,),
                    Text(widget.todoItem.description)
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
