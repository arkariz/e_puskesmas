import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailController,
    required FocusNode emailNode,
    required this.size,
    required TextEditingController sandiController,
    required FocusNode sandiNode,
  })  : _emailController = emailController,
        _emailNode = emailNode,
        _sandiController = sandiController,
        _sandiNode = sandiNode,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailNode;
  final Size size;
  final TextEditingController _sandiController;
  final FocusNode _sandiNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _emailController,
          node: _emailNode,
          size: size,
          label: "Email",
          hint: "Masukkan Email",
          type: TextInputType.emailAddress,
        ),
        CustomTextField(
          controller: _sandiController,
          node: _sandiNode,
          size: size,
          label: "Kata Sandi",
          hint: "Masukkan Kata Sandi",
          type: TextInputType.emailAddress,
        )
      ],
    );
  }
}