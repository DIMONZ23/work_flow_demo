import 'package:demo_wf/widgets/wf_error_banner.dart';
import 'package:flutter/material.dart';
import '../models/login_state.dart';
import '../widgets/login_header.dart';
import '../widgets/login_text_field.dart';
import '../widgets/wf_button_loading.dart';
import '../models/action_size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginState _loginState = LoginState.initial;
  bool _isLoading = false;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulate login API call
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // Simulate failed login
          _loginState = LoginState.failed;
        });
      }
    });
  }

  void _resetError() {
    if (_loginState == LoginState.failed) {
      setState(() {
        _loginState = LoginState.initial;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: SafeArea(
        child: Column(
          children: [
            const LoginHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    LoginTextField(
                      label: 'ID または メールアドレス',
                      controller: _idController,
                      hintText: '',
                      onChanged: (_) => _resetError(),
                    ),
                    const SizedBox(height: 24),
                    LoginTextField(
                      label: 'パスワード',
                      controller: _passwordController,
                      obscureText: true,
                      hintText: '',
                      onChanged: (_) => _resetError(),
                    ),
                    const SizedBox(height: 32),
                    Align(
                        alignment: Alignment.center,
                        child: WFButtonLoading(
                          onPressed: _handleLogin,
                          isLoading: _isLoading,
                          width: SizeState.xxxxxxxxxxxxxxlarge.value,
                          text: 'ログオン',
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (_loginState == LoginState.failed)
              const WfErrorBanner(
                message: 'ID (メールアドレス) またはパスワードが一致しません。',
              ),
          ],
        ),
      ),
    );
  }
}
