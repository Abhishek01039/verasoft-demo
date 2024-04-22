part of 'server_url_bloc.dart';

@immutable
sealed class ServerUrlState {}

final class ServerUrlInitial extends ServerUrlState {}

final class ServerUrlLoading extends ServerUrlState {}

final class ServerUrlSuccess extends ServerUrlState {}

final class ServerUrlError extends ServerUrlState {
  ServerUrlError({this.error});

  final String? error;
}
