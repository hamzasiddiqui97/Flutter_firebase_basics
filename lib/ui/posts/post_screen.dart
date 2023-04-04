import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebasebasics/auth/login_screen.dart';
import 'package:firebasebasics/ui/posts/add_post.dart';
import 'package:firebasebasics/utils/utility.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final refPost = FirebaseDatabase.instance.ref('Post');
  final refReview = FirebaseDatabase.instance.ref('Review');

  static const TextStyle _headingtextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Post Screen'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().ToastMessage(error.toString());
                });
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Text(
            'Reviews',
            style: _headingtextStyle,
          ),
          Expanded(
              child: StreamBuilder(
            stream: refReview.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;

                List<dynamic> list = [];
                list.clear();
                list = map.values.toList();
                return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index]['title']),
                      );
                    });
              }
            },
          )),
          const Text(
            'Posts',
            style: _headingtextStyle,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: refPost,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
