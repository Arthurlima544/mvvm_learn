import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_learn/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:mvvm_learn/ui/auth/login/widgets/tilted_cards.dart';
import 'package:mvvm_learn/ui/core/localization/applocalization.dart';
import 'package:mvvm_learn/ui/core/themes/dimens.dart';

import '../../../../routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'email@example.com',
  );

  final TextEditingController _password = TextEditingController(
    text: 'password',
  );

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult);
    widget.viewModel.login.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult();
      context.go(Routes.home);
    }

    if (widget.viewModel.login.error) {
      widget.viewModel.login.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.of(context).errorWhileLogin),
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed: () => widget.viewModel.login.execute((
              _email.value.text,
              _password.value.text,
            )),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TiltedCards(),
            Padding(
              padding: Dimens.of(context).edgeInsertsScreenSymmetric,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(controller: _email),
                  SizedBox(height: Dimens.paddingVertical),
                  TextField(controller: _password, obscureText: true),
                  SizedBox(height: Dimens.paddingVertical),
                  ListenableBuilder(
                    listenable: widget.viewModel.login,
                    builder: (context, _) {
                      return FilledButton(
                        onPressed: () {
                          widget.viewModel.login.execute((
                            _email.value.text,
                            _password.value.text,
                          ));
                        },
                        child: Text(AppLocalization.of(context).login),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
