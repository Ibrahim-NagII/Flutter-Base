

import 'package:flutter_base/features/login/bloc/login_bloc.dart';
import 'package:flutter_base/features/splah/splash_bloc.dart';
import 'package:flutter_base/main_blocs/user_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart'
    show BlocProvider, BlocProviderSingleChildWidget;


abstract class ProviderList {
  static List<BlocProviderSingleChildWidget> providers = [
    BlocProvider<SplashBloc>(create: (_) => SplashBloc()),
    BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
    BlocProvider<UserBloc>(create: (_) => UserBloc()),
  ];
}
