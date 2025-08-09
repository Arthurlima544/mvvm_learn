import 'package:flutter/material.dart';
import 'package:mvvm_learn/ui/auth/logout/view_models/logout_viewmodel.dart';
import 'package:mvvm_learn/ui/core/localization/applocalization.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/colors.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  late final LogoutViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<LogoutViewModel>();
    viewModel.logout.addListener(_onResult);
  }

  @override
  void dispose() {
    viewModel.logout.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (viewModel.logout.error) {
      viewModel.logout.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.of(context).errorWhileLogout),
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed: viewModel.logout.execute,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey1),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
        ),
        child: InkResponse(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            viewModel.logout.execute();
          },
          child: Center(
            child: Icon(
              Icons.logout,
              size: 24.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
