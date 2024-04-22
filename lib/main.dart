import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ui/utils/app_colors.dart';
import 'package:flutter_test_ui/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:flutter_test_ui/feature/auth/data/repository/server_url_repo_impl.dart';
import 'package:flutter_test_ui/feature/auth/presentation/bloc/server_url_bloc.dart';
import 'package:flutter_test_ui/feature/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter_test_ui/feature/auth/presentation/pages/server_url_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(authRepo: AuthRepoImpl()),
        ),
        BlocProvider(
          create: (context) =>
              ServerUrlBloc(serverUrlRepo: ServerUrlRepoImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors().appColor),
          useMaterial3: true,
        ),
        home: const ServerUrlPage(),
      ),
    );
  }
}
