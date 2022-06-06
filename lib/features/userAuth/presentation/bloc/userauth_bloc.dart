import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'userauth_event.dart';
part 'userauth_state.dart';

class UserauthBloc extends Bloc<UserauthEvent, UserauthState> {
  UserauthBloc() : super(UserauthInitial()) {
    on<UserauthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
