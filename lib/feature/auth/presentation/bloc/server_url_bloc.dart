import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_test_ui/feature/auth/domain/repository/server_url_repo.dart';
import 'package:meta/meta.dart';

part 'server_url_event.dart';
part 'server_url_state.dart';

class ServerUrlBloc extends Bloc<ServerUrlEvent, ServerUrlState> {
  ServerUrlBloc({required ServerUrlRepo serverUrlRepo})
      : _serverUrlRepo = serverUrlRepo,
        super(ServerUrlInitial()) {
    on<ConnectButtonPressed>(_onConnectButtonPressed);
  }

  final ServerUrlRepo _serverUrlRepo;

  FutureOr<void> _onConnectButtonPressed(event, emit) async {
    emit(ServerUrlLoading());
    final result = await _serverUrlRepo.getServerUrl();
    result.fold((l) => emit(ServerUrlError(error: l.toString())),
        (r) => emit(ServerUrlSuccess()));
  }
}
