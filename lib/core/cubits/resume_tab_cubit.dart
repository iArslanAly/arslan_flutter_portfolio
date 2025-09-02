import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeTabCubit extends Cubit<int?> {
  ResumeTabCubit() : super(0); // default tab selected on desktop

  void selectTab(int index, {bool isDesktop = false}) {
    if (isDesktop) {
      emit(index); // always select new tab
    } else {
      // toggle expand/collapse
      if (state == index) {
        emit(null); // collapse
      } else {
        emit(index); // expand
      }
    }
  }
}
