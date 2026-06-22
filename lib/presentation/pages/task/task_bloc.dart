import 'package:bloc/bloc.dart';
import 'package:notelife/presentation/pages/task/task_event.dart';
import 'package:notelife/presentation/pages/task/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState());
}
