import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'poli_event.dart';
part 'poli_state.dart';

class PoliBloc extends Bloc<PoliEvent, PoliState> {
  PoliBloc() : super(PoliInitial()) {
    on<PoliEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
