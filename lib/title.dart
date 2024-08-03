import 'package:flutter/material.dart';

class Costumtitle extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const Costumtitle({
    super.key,
    required this.name,
    required this.message,
    required this.time,


    });

  @override
  Widget build(BuildContext context) {
    return 
            ListTile(
              tileColor: Colors.green,
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red,
              ),
              title: Text(name),
              subtitle: Text(message),
              trailing: Text(time),
            );
  }
}