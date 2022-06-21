import 'package:commercialapp/utilities/enums.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:commercialapp/views/widgets/default_button.dart';
import 'package:commercialapp/views/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  var _authType = AuthFormType.login;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthFormType.register ? 'Sign up' : 'Login',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  if (_authType == AuthFormType.register)
                    DefaultTextFormField(
                        hintText: 'Enter Your Name',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Name field can\'t be empty';
                          }
                          return null;
                        },
                        focusNode: _nameFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_emailFocusNode),
                        controller: _nameController,
                        type: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        isSecure: false,
                        labelText: 'Name'),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultTextFormField(
                      hintText: 'Enter Your Email',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email field can\'t be empty';
                        }
                        return null;
                      },
                      focusNode: _emailFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      controller: _emailController,
                      type: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      isSecure: false,
                      labelText: 'Email'),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultTextFormField(
                      hintText: 'Enter Your Password',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password field can\'t be empty';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      type: TextInputType.visiblePassword,
                      isSecure: true,
                      labelText: 'Password'),
                  if (_authType == AuthFormType.login)
                    const SizedBox(
                      height: 15,
                    ),
                  if (_authType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {},
                        child: const Text('Forget Your Password?'),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                    text: _authType == AuthFormType.register
                        ? 'Sign up'
                        : 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.bottomNavBarScreenRoute);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        _emailController.clear();
                        _passwordController.clear();
                        _formKey.currentState!.reset();
                        setState(() {
                          if (_authType == AuthFormType.login) {
                            _authType = AuthFormType.register;
                          } else {
                            _authType = AuthFormType.login;
                          }
                        });
                      },
                      child: Text(_authType == AuthFormType.register
                          ? 'Have an account Login?'
                          : 'Don\'t have an account? Sign up'),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.19,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(_authType == AuthFormType.register
                          ? 'Or sign up with social account?'
                          : 'Or login with social account')),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 92,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: const Icon(FontAwesomeIcons.google),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: 92,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0)),
                        child: const Icon(FontAwesomeIcons.facebook),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
