import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/features/userAuth/presentation/controller/login_controller.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/login/background_image.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/login/landing_text.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: kTopPadding,
            left: kHorizontalPadding,
            right: kHorizontalPadding,
          ),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackgroundImage(size: size),
              const LandingText(),
              const SizedBox(height: kDefaultPadding),
              LoginForm(
                emailController: controller.emailController.value,
                emailNode: controller.emailNode.value,
                size: size,
                sandiController: controller.sandiController.value,
                sandiNode: controller.sandiNode.value,
              ),
              const SizedBox(height: kTopPadding),
              CustomButton(
                size: size,
                buttonWidth: 0.85,
                label: "Masuk",
                onPressed: controller.loginPasien,
              ),
              const SizedBox(height: kLabelPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum memiliki akun?"),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: const Text("Daftar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
