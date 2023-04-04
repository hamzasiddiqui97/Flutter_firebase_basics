import 'package:flutter/material.dart';


class AddPlaces extends StatefulWidget {
  const AddPlaces({Key? key}) : super(key: key);

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Places'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          children: [
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter source',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
