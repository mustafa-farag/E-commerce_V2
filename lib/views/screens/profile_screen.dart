import 'package:commercialapp/controllers/auth_controller.dart';
import 'package:commercialapp/services/auth.dart';
import 'package:commercialapp/views/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_,model,__){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              DefaultButton(
                onPressed: ()=> model.logout(),
                text: 'Logout',
              )
            ],
          ),
        );
      },
    );
  }
}
