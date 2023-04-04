import 'package:firebase_database/firebase_database.dart';
import 'package:firebasebasics/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../utils/utility.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final postController = TextEditingController();
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
              controller: postController,
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Whats in your mind?'),
            ),
            const SizedBox(height: 30,),
            RoundedButton(
                title: 'Add post',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
              databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                'id': DateTime.now().millisecondsSinceEpoch.toString(),
                'title' : postController.text.toString(),
              }).then((value) {

                Utils().ToastMessage('Post added successfully');
                setState(() {
                  loading = false;
                });
              }).onError((error, stackTrace) {
                Utils().ToastMessage(error.toString());
                setState(() {
                  loading = false;
                });
              });
            }),

          ],
        ),
      ),
    );
  }
}
