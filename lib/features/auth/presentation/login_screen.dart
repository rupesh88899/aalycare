import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    if (!_isValidEmail(emailController.text)) {
      _showSnackBar('Please enter a valid email address');
      return;
    }

    if (passwordController.text.length < 6) {
      _showSnackBar('Password must be at least 6 characters');
      return;
    }

    try {
      // First try to sign in
      await ref
          .read(authControllerProvider.notifier)
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text,
          );

      if (mounted) {
        _showSnackBar('Signed in successfully!');
        context.go('/home');
      }
    } catch (e) {
      // If sign in fails, try to create account
      print('Sign in failed, trying to create account: $e');
      try {
        await ref
            .read(authControllerProvider.notifier)
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text,
            );

        if (mounted) {
          _showSnackBar('Account created successfully!');
          context.go('/home');
        }
      } catch (createError) {
        print('Create account also failed: $createError');
        if (mounted) {
          _showSnackBar('Authentication failed: ${createError.toString()}');
        }
      }
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false, // Prevent keyboard from pushing content up
      body: Stack(
        children: [
          // Bottom lighter wave layer (base layer)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/upper_layer.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          // Top darker wave layer (overlay)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/botton_layer.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Language selector - positioned at top right
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 24),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1A000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/british_flag.png',
                            width: 22,
                            height: 22,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Eng',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: Color(0xFF6B7280),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Main content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        // Logo - positioned higher
                        Image.asset(
                          'assets/images/Group 7104.png',
                          width: 160,
                          height: 60,
                        ),
                        const SizedBox(height: 24),
                        // Subtitle
                        const Text(
                          'Login or create your account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Email input field
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.email_rounded,
                                color: Color(0xFF323232),
                                size: 20,
                              ),
                              hintText: 'Enter your email',
                              hintStyle: const TextStyle(
                                color: Color(0xFF323232),
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Color(0xFFE5E7EB)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Color(0xFFE5E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color(0xFF2E61D3), width: 2),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Password input field
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: Color(0xFF323232),
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF323232),
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF323232),
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Color(0xFFE5E7EB)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Color(0xFFE5E7EB)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color(0xFF2E61D3), width: 2),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Continue button - properly positioned in layout
                        Container(
                          width: MediaQuery.of(context).size.width *
                              0.52, // 52% of screen width
                          height: MediaQuery.of(context).size.height *
                              0.07, // 7% of screen height
                          decoration: BoxDecoration(
                            color: const Color(0xFF255FD5),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height *
                                    0.035), // Responsive border radius
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A255FD5),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: authState.isLoading ? null : _handleLogin,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.035),
                              child: Center(
                                child: authState.isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sign In / Sign Up',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04, // Responsive font size
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02), // Responsive spacing
                                          Icon(
                                            Icons.arrow_forward,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05, // Responsive icon size
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/support_icon.png',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  'Support',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
