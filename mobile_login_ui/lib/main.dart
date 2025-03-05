import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(160),
                const Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Text("Please login to your account to continue"),
                const Gap(50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialMediaButtons(
                        buttonName: "Facebook", buttonIcon: Icons.facebook),
                    SocialMediaButtons(
                        buttonName: "Twitter",
                        buttonIcon: FontAwesomeIcons.twitter),
                  ],
                ),
                const Gap(30),
                const Text("Email Address"),
                const TextFieldWidget(
                  hint: 'example@gmail.com',
                  isPassword: false,
                ),
                const Gap(15),
                const Text("Password"),
                const TextFieldWidget(hint: "Password", isPassword: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        const Text("Remember me"),
                      ],
                    ),
                    const Text("Forgot Password")
                  ],
                ),
                const Gap(10),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 297,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700))
                      ])),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  final String buttonName;
  final IconData buttonIcon;
  const SocialMediaButtons(
      {super.key, required this.buttonName, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .44,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 124, 124, 124)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 167, 164, 164),
                spreadRadius: 0.4,
                blurRadius: 8)
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            buttonIcon,
            color: const Color(0xFF1391F8),
          ),
          Gap(10),
          Text(buttonName)
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final bool isPassword;
  const TextFieldWidget(
      {super.key, required this.hint, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType:
          isPassword ? TextInputType.visiblePassword : TextInputType.text,
      decoration: InputDecoration(
          focusColor: Colors.blue,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(style: BorderStyle.solid, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: isPassword ? const Icon(Icons.remove_red_eye) : null,
          hintText: hint),
    );
  }
}
