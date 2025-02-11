import 'package:app_structure_example/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RegisterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static TextEditingController prefixController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Text(
              'Hello! Register to get started',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xff1a2128),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: emailController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0x5C1C2731),
                  ),
                  hintText: 'Email',
                  fillColor: const Color(0x141C2731),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: SizedBox(
          //     height: 50,
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //             ),
          //             child: TextField(
          //               controller: prefixController,
          //               style: const TextStyle(fontSize: 14),
          //               decoration: InputDecoration(
          //                 hintStyle: const TextStyle(
          //                   fontSize: 14,
          //                   color: Color(0x5C1C2731),
          //                 ),
          //                 hintText: '+990',
          //                 fillColor: const Color(0x141c2731),
          //                 filled: true,
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(8),
          //                   borderSide: BorderSide.none,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(width: 16),
          //         Expanded(
          //           child: TextField(
          //             controller: phoneController,
          //             style: const TextStyle(fontSize: 14),
          //             decoration: InputDecoration(
          //               hintStyle: const TextStyle(
          //                 fontSize: 14,
          //                 color: Color(0x5C1C2731),
          //               ),
          //               hintText: 'Phone',
          //               fillColor: const Color(0x141C2731),
          //               filled: true,
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(8),
          //                 borderSide: BorderSide.none,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: nameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0x5C1C2731),
                  ),
                  hintText: 'Fullname',
                  fillColor: const Color(0x141C2731),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: passwordController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0x5C1C2731),
                  ),
                  hintText: 'Password',
                  fillColor: const Color(0x141C2731),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                context.read<RegisterCubit>().register(
                      '+${prefixController.text} ${phoneController.text}',
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    );
              },
              child: Container(
                height: 50,
                width: screenSize.width,
                decoration: BoxDecoration(
                    color: const Color(0xff23AA49),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 34),
          const Center(
            child: Text(
              'OR',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0x5C1C2731)),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    width: 1.0,
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius here
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: IconButton(
                    icon: const Icon(
                      Icons.facebook,
                      size: 26,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    width: 1.0,
                  ),
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius here
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: IconButton(
                    icon: const Icon(
                      Icons.golf_course,
                      size: 26,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: IconButton(
                    icon: const Icon(
                      Icons.apple,
                      size: 32,
                    ),
                    onPressed: () {
                      // Handle button press
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You already have an account?'),
              SizedBox(
                width: 5,
              ),
              Text(
                'Login',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          )
        ],
      ),
    );
  }
}
