import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweetverse/common/common.dart';
import 'package:tweetverse/constants/ui_constants.dart';
import 'package:tweetverse/features/auth/controller/auth_controller.dart';
import 'package:tweetverse/features/auth/view/signup_view.dart';
import 'package:tweetverse/features/auth/widgets/auth_field.dart';
import 'package:tweetverse/theme/pallete.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context)=>const LoginView(),
  );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appbar,
      body: isLoading 
      ? const Loader()
      :  Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //email textfield
                AuthField(
                    controller: emailController, hintText: 'Enter your email'),
                const SizedBox(
                  height: 25,
                ),
                //password textfield
                AuthField(
                    controller: passwordController,
                    hintText: 'Enter the password'),
                const SizedBox(
                  height: 40,
                ),
                //button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: onLogin,
                    label: 'Login',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //textspan
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(
                      color: Pallete.whiteColor,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                          text: ' Sign up',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context, 
                                SignupView.route()
                              );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
