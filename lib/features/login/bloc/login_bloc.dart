import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/core/app_core.dart';
import 'package:flutter_base/core/app_event.dart';
import 'package:flutter_base/core/app_notification.dart';
import 'package:flutter_base/core/app_state.dart';
import 'package:flutter_base/core/vaildator.dart';
import 'package:flutter_base/features/login/model/user_model.dart';
import 'package:flutter_base/features/login/repo/login_repo.dart';
import 'package:flutter_base/helpers/shared_helper.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import 'package:flutter_base/navigation/routes.dart';
import 'package:rxdart/rxdart.dart';

import '../../../helpers/styles.dart';


class LoginBloc extends Bloc<AppEvent, AppState> {
  final username = BehaviorSubject<String?>();
  final password = BehaviorSubject<String?>();

  static LoginBloc get instance =>
      BlocProvider.of(CustomNavigator.navigatorState.currentContext!);


  LoginBloc() : super(Start());

  Function(String?) get updateUsername => username.sink.add;

  Function(String?) get updatePassword => password.sink.add;



  Stream<String?> get usernameStream => username.stream.asBroadcastStream();

  Stream<String?> get passwordStream => password.stream.asBroadcastStream();


  Stream<bool> get submitStream =>
      Rx.combineLatest2(usernameStream, passwordStream, (n, p) {
        if ( NameValidator.nameValidator(n) == null &&
        PasswordValidator.passwordValidator(p) == null ){
          return true;
        }
        return false;
      });

  clear() {
    updateUsername(null);
    updatePassword(null);
  }

  @override
  Future<void> close() {
    username.close();
    password.close();
    return super.close();
  }


  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try{
      if (event is Click) {
        UserModel model = await LoginRepo.login(
            password: password.valueOrNull,
            username: username.valueOrNull);
        if (model.accessToken != null) {
          SharedHelper.sharedHelper!.writeData(CachingKey.TOKEN, model.accessToken);
          SharedHelper.sharedHelper!.writeData(CachingKey.SKIP, true);
          SharedHelper.sharedHelper!.writeData(CachingKey.IS_LOGIN, true);
          SharedHelper.sharedHelper!.writeData(CachingKey.USER , json.encode(model.toJson()));
          CustomNavigator.push(Routes.MAIN_PAGE, clean: true);
          clear();
          yield Done();
        } else {
          AppCore.showSnackBar(notification: AppNotification(message: model.message!,backgroundColor: Styles.IN_ACTIVE,borderColor: Styles.DARK_RED,iconName: "fill-close-circle"));

          yield Start();
        }
      }
    }catch(e){
      AppCore.showSnackBar(notification: AppNotification(message: e.toString(),backgroundColor: Styles.IN_ACTIVE,borderColor: Styles.DARK_RED,iconName: "fill-close-circle"));
      yield Error();
    }

  }

}
