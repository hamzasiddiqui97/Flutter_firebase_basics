import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasebasics/auth/signup_screen.dart';
import 'package:firebasebasics/ui/posts/post_screen.dart';
import 'package:firebasebasics/utils/utility.dart';
import 'package:firebasebasics/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {

    String success_message = 'Login successful';
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).then((value) {
          // Utils().ToastMessage(value.user!.email.toString());
          Utils().ToastMessage(success_message);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()));

          setState(() {
            loading = false;
          });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().ToastMessage(error.toString());

      setState(() {
        loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: const Text('Login'),centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Form(
                key: _formKey,
                child: Column(

                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty){
                          return 'Enter Email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Enter Email',
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(

                      validator: (value) {
                        if (value!.isEmpty){
                          return 'Enter Password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Enter password',
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 50,),
              RoundedButton(
                loading: loading,
                title: 'login', onTap: () {
                if (_formKey.currentState!.validate()) {
                  login();
                }
              },),

              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don\'t have an account? "),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                  }, child: const Text('Sign Up')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
