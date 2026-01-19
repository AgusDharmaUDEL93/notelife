import 'package:bloc/bloc.dart';
import 'package:notelife/presentation/link/link_event.dart';
import 'package:notelife/presentation/link/link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  LinkBloc() : super(LinkState()) {}
}
