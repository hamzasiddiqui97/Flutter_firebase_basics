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
  final reviewController = TextEditingController();


  bool loading = false;
  bool loadingReview = false;

  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final databaseReviewRef = FirebaseDatabase.instance.ref('Review');

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

            const SizedBox(height: 30,),
            const Divider(
              thickness: 2,
            ),
            const Divider(
              thickness: 3.0,
            ),

            TextFormField(
              controller: reviewController,
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Write your review here?'),
            ),
            const SizedBox(height: 30,),
            RoundedButton(
                title: 'Add Review',
                loading: loadingReview,
                onTap: () {
                  setState(() {
                    loadingReview = true;
                  });
                  databaseReviewRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'title' : reviewController.text.toString(),
                  }).then((value) {

                    Utils().ToastMessage('Review added successfully');
                    setState(() {
                      loadingReview = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().ToastMessage(error.toString());
                    setState(() {
                      loadingReview = false;
                    });
                  });
                }),

          ],
        ),
      ),
    );
  }
}
