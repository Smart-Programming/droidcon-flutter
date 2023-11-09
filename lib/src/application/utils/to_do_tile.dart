// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String name;
  final bool completed;
  Function(bool?)? onChanged;
  Function()? deleteFn;

  ToDoTile(
      {super.key,
      required this.name,
      required this.completed,
      required this.onChanged,
      required this.deleteFn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 10, right: 10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.amber.withOpacity(.5),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: completed,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: deleteFn,
                  child: const Icon(
                    Icons.delete_forever,
                    size: 20,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}