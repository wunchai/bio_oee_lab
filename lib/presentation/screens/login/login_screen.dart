// lib/presentation/screens/login/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bio_oee_lab/data/repositories/login_repository.dart';
import 'package:bio_oee_lab/data/models/login_result.dart';
import 'package:bio_oee_lab/presentation/screens/login/form_states/login_form_state.dart';
import 'package:bio_oee_lab/presentation/widgets/error_dialog.dart';

import 'package:bio_oee_lab/data/repositories/sync_repository.dart';
import 'package:bio_oee_lab/presentation/widgets/sync_progress_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormState(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent();

  void _onLoginResult(BuildContext context, LoginResult result) {
    final formState = Provider.of<LoginFormState>(context, listen: false);
    formState.setIsLoading(false);

    if (result.status == LoginStatus.success) {
      Navigator.of(context).pushReplacementNamed('/main_wrapper');
    } else if (result.status == LoginStatus.userNotFoundOffline) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('User Not Found'),
          content: Text(
            result.message ??
                'This user is not in the local database. Please sync users first.',
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => ErrorDialog(
          title: 'Login Failed',
          content: result.message ?? 'Unknown error occurred.',
        ),
      );
    }
  }

  Future<void> _handleLogin(
    BuildContext context,
    LoginRepository repository,
  ) async {
    final formState = Provider.of<LoginFormState>(context, listen: false);

    if (formState.username.isEmpty || formState.password.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => const ErrorDialog(
          title: 'Input Error',
          content: 'Please enter both username and password.',
        ),
      );
      return;
    }

    formState.setIsLoading(true);

    final result = await repository.login(
      formState.username,
      formState.password,
    );

    _onLoginResult(context, result);
  }

  Future<void> _handleSyncUsers(BuildContext context) async {
    final syncRepository = Provider.of<SyncRepository>(context, listen: false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => const SyncProgressDialog(),
    );

    String message = 'Sync Complete';
    bool success = true;
    try {
      // Use the dedicated syncAllUsers method for login
      success = await syncRepository.syncAllUsers();
      if (!success) message = syncRepository.lastSyncMessage;
    } catch (e) {
      success = false;
      message = 'Sync Failed: $e';
    }

    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pop();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(success ? 'Sync Complete' : 'Sync Failed'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginRepository = Provider.of<LoginRepository>(context);
    final formState = Provider.of<LoginFormState>(context);
    final syncState = context.watch<SyncRepository>().syncStatus;
    final bool isBusy = formState.isLoading || syncState == SyncStatus.syncing;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: 100),
              const SizedBox(height: 30),
              Text(
                'Bio OEE Lab',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text('Please log in to continue'),
              const SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: formState.setUsername,
                enabled: !isBusy,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: formState.setPassword,
                enabled: !isBusy,
                onSubmitted: (_) => _handleLogin(context, loginRepository),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: formState.isLoading
                      ? null
                      : () => _handleLogin(context, loginRepository),
                  child: formState.isLoading
                      ? const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text('LOG IN', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  icon: syncState == SyncStatus.syncing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.sync),
                  label: Text(
                    syncState == SyncStatus.syncing
                        ? 'SYNCING...'
                        : 'SYNC USERS',
                  ),
                  onPressed: isBusy ? null : () => _handleSyncUsers(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Device ID: ${loginRepository.deviceInfoService.getLoginDeviceId()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: isBusy
                    ? null
                    : () {
                        // TODO: Implement Registration/Device Link Dialog
                      },
                child: const Text('Register Device / Contact Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
