import 'package:firebasebasics/auth/login_screen.dart';
import 'package:firebasebasics/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Sign Up'),centerTitle: true),
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
            RoundedButton(title: 'login', onTap: () {
              if (_formKey.currentState!.validate()) {

              }
            },),

            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));

                }, child: const Text('Login')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
