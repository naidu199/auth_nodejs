import 'dart:typed_data';

import 'package:auth_nodejs_backend/routes/app_routes.dart';
import 'package:auth_nodejs_backend/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:auth_nodejs_backend/utils/snackbars.dart';
import 'package:auth_nodejs_backend/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  Uint8List? profileImage;
  bool _islaoding = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernamecontroller.dispose();
  }

  void signupUser() async {
    setState(() {
      _islaoding = true;
    });

    setState(() {
      _islaoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: SafeArea(
          child: Container(
        padding: MediaQuery.of(context).size.width > 600
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
            : const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),

                const SizedBox(
                  height: 30,
                ),
                // Stack(
                //   children: [
                //     profileImage != null
                //         ? CircleAvatar(
                //             radius: 50,
                //             backgroundImage: MemoryImage(profileImage!),
                //           )
                //         : const CircleAvatar(
                //             radius: 50,
                //             backgroundImage: NetworkImage(
                //                 "https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg"),
                //           ),
                //     Positioned(
                //         bottom: -1,
                //         right: -10,
                //         child: IconButton(
                //           onPressed: () {
                //             selectImage();
                //           },
                //           icon: const Icon(
                //             Icons.add_a_photo,
                //             size: 26,
                //           ),
                //         ))
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                  hintText: 'Username',
                  textEditingController: usernamecontroller,
                  textInputType: TextInputType.text,
                  isPassword: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldInput(
                  hintText: 'Email or Phone Number',
                  textEditingController: emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFieldInput(
                  hintText: 'Password',
                  textEditingController: passwordController,
                  isPassword: true,
                  textInputType: TextInputType.text,
                ),
                // const SizedBox(
                //   height: 12,
                // ),
                // TextFieldInput(
                //   hintText: 'Enter Bio',
                //   textEditingController: biocontroller,
                //   isPassword: false,
                //   textInputType: TextInputType.text,
                // ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: signupUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: blueColor,
                    ),
                    child: _islaoding
                        ? const Center(
                            child: CupertinoActivityIndicator(
                              animating: true,
                              color: primaryColor,
                            ),
                          )
                        : const Text(
                            "SignUp",
                            style: TextStyle(color: primaryColor),
                          ),
                  ),
                ),

                // const SizedBox(
                //   height: 24,
                // ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alraedy have an account?  ",
                        style: TextStyle(color: primaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.loginRoute);
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                // SizedBox(
                //   height: 10,
                // )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
