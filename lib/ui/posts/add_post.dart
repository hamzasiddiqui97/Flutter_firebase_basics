import 'package:firebase_database/firebase_database.dart';
import 'package:firebasebasics/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30.0,),

            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Whats in your mind?'),
            ),
            const SizedBox(height: 30,),
            RoundedButton(title: 'Add post', onTap: () {}),

          ],
        ),
      ),
    );
  }
}
