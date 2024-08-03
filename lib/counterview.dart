import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  List<String> friendList = ["Bilal", "Owais", "Raza", "Hamza"];
  TextEditingController friendlistcontrol = TextEditingController();

  void showEditDialog(int index) {
    TextEditingController editController = TextEditingController();
    editController.text = friendList[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Friend"),
          content: TextField(
            controller: editController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (editController.text.isNotEmpty) {
                  setState(() {
                    friendList[index] = editController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: friendlistcontrol,
          decoration: const InputDecoration(
            hintText: 'Enter friend\'s name',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (friendlistcontrol.text.isNotEmpty) {
                setState(() {
                  friendList.add(friendlistcontrol.text);
                  friendlistcontrol.clear();
                });
              }
            },
            child: const Text("Add Item"),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: ListTile(
                tileColor: Colors.grey,
                title: Text(friendList[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showEditDialog(index);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          friendList.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
