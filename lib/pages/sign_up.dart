import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepway'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                controller: surnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Surname'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                controller: emailContoller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-Mail'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
