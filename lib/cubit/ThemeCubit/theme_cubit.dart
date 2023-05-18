import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/shared_helper/shared_preferance_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) =>BlocProvider.of(context);
  bool isDark= false;
  void changeThemeMode(){
    isDark =!isDark;
   emit(ThemeChanged());

  }
}
