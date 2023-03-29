import 'package:firebasebasics/auth/signup_screen.dart';
import 'package:firebasebasics/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
              RoundedButton(title: 'login', onTap: () {
                if (_formKey.currentState!.validate()) {

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
