import 'package:flutter/material.dart';
import '../Feature/Home.dart';

class LoginDulce extends StatefulWidget {
  const LoginDulce({super.key});

  @override
  State<LoginDulce> createState() => _LoginDulceState();
}

class _LoginDulceState extends State<LoginDulce> {
  bool isLoading = false;
  bool loginError = false;
  bool obscurePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String emailValido = "admin@dulcearoma.com";
  final String passwordValida = "123456";

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
      loginError = false;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (emailController.text.trim() == emailValido &&
        passwordController.text.trim() == passwordValida) {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, animation, __) => const BakeryHomePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                child: child,
              ),
            );
          },
        ),
      );
    } else {
      setState(() {
        loginError = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Correo o contraseña incorrectos"),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          obscureText: isPassword ? obscurePassword : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF8F9FB),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),

            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  )
                : null,

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: loginError ? Colors.red : Colors.grey.shade300,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFE91E63)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 800),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Opacity(opacity: value, child: child);
                },
                child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: const Text(
                    "Dulce Aroma",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              Hero(
                tag: "loginBanner",
                child: SizedBox(
                  width: double.infinity,
                  height: 190,
                  child: Image.asset(
                    "assets/images/img3.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17203A),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Log in to order your favorite treats",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 35),

                    buildTextField(
                      controller: emailController,
                      label: "Email Address",
                    ),

                    const SizedBox(height: 20),

                    buildTextField(
                      controller: passwordController,
                      label: "Password",
                      isPassword: true,
                    ),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 250),
                      tween: Tween(begin: 1, end: isLoading ? 0.95 : 1),
                      builder: (context, scale, child) {
                        return Transform.scale(scale: scale, child: child);
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE91E63),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: isLoading
                                ? const SizedBox(
                                    key: ValueKey("loading"),
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    "Log In",
                                    key: ValueKey("text"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "Credenciales de prueba",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text("Correo: admin@dulcearoma.com"),
                          Text("Contraseña: 123456"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const SizedBox(height: 30),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Create an account",
                          style: TextStyle(
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
