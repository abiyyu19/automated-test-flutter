import 'package:automated_test_flutter/presentation/pages/home/home_page.dart';
import 'package:automated_test_flutter/presentation/pages/login/validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // final FirebaseAuthentication _auth = FirebaseAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login Page'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Automated Test App",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  key: const ValueKey('email'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) => Validator.validateEmail(value ?? ""),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  key: const ValueKey('password'),
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  validator: (value) => Validator.validatePassword(value ?? ""),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    // if (_globalKey.currentState?.validate() == true) {
                    //   _auth
                    //       .login(
                    //     email: _emailController.text,
                    //     password: _passwordController.text,
                    //   )
                    //       .then((value) {
                    //     log(value);
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HomePage(),
                    //       ),
                    //     );
                    //   });
                    // }
                    if (_globalKey.currentState?.validate() == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
