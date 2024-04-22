part of 'server_url_bloc.dart';

@immutable
sealed class ServerUrlEvent {}

final class ConnectButtonPressed extends ServerUrlEvent {}
