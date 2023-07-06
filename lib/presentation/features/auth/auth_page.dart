
import 'package:flutter/material.dart';
import '../../../di/injection.dart';
import '../../../utils/configs/session_manager.dart';
import '../../../utils/extensions/context_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'cubit/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final textStyle = context.textStyle;

    return BlocProvider(
      create: (context) => AuthCubit(
        sessionManager: injection<SessionManager>()
      ),
      child: Scaffold(
        body: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            EdgeInsetsGeometry padding = EdgeInsets.symmetric(
                horizontal: screenSize.width / 2.8);
            if (sizingInformation.isMobile) {
              padding = const EdgeInsets.symmetric(horizontal: 16);
            } else if (sizingInformation.isTablet) {
              padding = EdgeInsets.symmetric(horizontal: screenSize.width / 4);
            }
            return Padding(
              padding: padding,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final authCubit = context.read<AuthCubit>();
                  return Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: textStyle.titleLarge,),
                        const SizedBox(height: 16,),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text('username'),
                              prefixIcon: Icon(LucideIcons.user),
                              border: UnderlineInputBorder()
                          ),
                        ),
                        const SizedBox(height: 16,),
                        TextFormField(
                          obscureText: !state.passwordVisible,
                          decoration: InputDecoration(
                            label: const Text('password'),
                            prefixIcon: const Icon(LucideIcons.key),
                            border: const UnderlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(state.passwordVisible ? Icons.visibility : Icons.visibility_off),
                              onPressed: () => authCubit.togglePassword(),
                            )
                          ),
                        ),
                        const SizedBox(height: 24,),
                        ElevatedButton(
                            onPressed: () {
                              authCubit.onSubmit();
                            },
                            child:  Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state is AuthLoading)
                                    const Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                      ],
                                    ),
                                  Text('Login')
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
