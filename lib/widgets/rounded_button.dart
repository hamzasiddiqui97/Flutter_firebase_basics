import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  bool loading;
  RoundedButton({Key? key, required this.title, required this.onTap, this.loading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ) ,
        child: Center(
          child: Text(
              title,
          style: const TextStyle(color: Colors.white),
          ),


        ),
      ),
    );
  }
}
