import 'package:bloc/bloc.dart';


class ResumeTabCubit extends Cubit<int> {
  ResumeTabCubit() : super(0);

  void selectTab(int index) => emit(index);
}
