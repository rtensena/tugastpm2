import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // This global key is used to assign to the [Form] and retrieve
  // the form state for various operations like validation.
  final _formKey = GlobalKey<FormState>();

  // These text controllers are used to assign the
  // controller of username and password [TextFormField].
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String username = "admin";
  String password = "123";

  // This method saves the authKey and navigate to
  // [DashboardPage] upon success.
  void _saveAuthCredentials(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
    final isAuthStored = await prefs.setBool('isAuth', value);

    if (isAuthStored) {
      // Checking if the widget is still in the widget tree after an async gap.
      // It is done to ensure that the widget is still visible.
      if (mounted) {
        // The page is now routed to the [DashboardPage].
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const DashboardPage();
          }),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Form(
        // The global key is assign to the [Form] to retrieve the [FormState] later.
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),

              // Validation login is defined here.
              // It checks for null and minimum 6 character in length for value.
              validator: (value) {
                if (value != null && value == username) {
                  // null is returned if validation is success.
                  return null;
                }

                // Error message to be displayed is return if validation fails.
                return 'Username salah';
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),

              // Validation login is defined here.
              // It checks for null and minimum 6 character in length for value.
              validator: (value) {
                if (value != null && value == password) {
                  // null is returned if validation is success.
                  return null;
                }

                // Error message to be displayed is return if validation fails.
                return 'Password salah';
              },
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                // The validation on the [FormState] is executed
                // and the result is retrieved here.
                final isValid = _formKey.currentState?.validate();

                // Upon valid [FormState] the credentials are stored to prefs.
                if (isValid ?? false) {
                  // save the isAuth value to shared preference
                  _saveAuthCredentials(isValid!);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
