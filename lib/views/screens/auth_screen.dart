import 'package:commercialapp/controllers/auth_controller.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/utilities/enums.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:commercialapp/views/widgets/default_button.dart';
import 'package:commercialapp/views/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      // Navigator.pop(context);
      // Navigator.of(context).pushNamed(AppRoutes.bottomNavBarScreenRoute);
    } catch (e) {
      /// todo: it will be refactor
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            "Error",
            style: Theme.of(context).textTheme.headline5,
          ),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'ok',
                  style: Theme.of(context).textTheme.headline5,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) => Scaffold(
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
                      model.toggleText('Login', 'Sign up'),
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
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
                        onChanged: model.updateEmail,
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
                        onChanged: model.updatePassword,
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        type: TextInputType.visiblePassword,
                        isSecure: true,
                        labelText: 'Password'),
                    if (model.authFormType == AuthFormType.login)
                      const SizedBox(
                        height: 15,
                      ),
                    if (model.authFormType == AuthFormType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Forget Your Password?',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultButton(
                      text: model.toggleText('Login', 'Sign up'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submit(model);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.toggleText('Don\'t have an account? ',
                              'Have an account ? '),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        InkWell(
                          onTap: () {
                            _formKey.currentState!.reset();
                            model.toggleFormType();
                          },
                          child: Text(
                            model.toggleText('Login', 'Sign up'),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.19,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.toggleText('Or login with social account',
                              'Or sign up with social account?'),
                          style: Theme.of(context).textTheme.subtitle2,
                        )),
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
      ),
    );
  }
}
