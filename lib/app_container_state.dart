part of 'app_container_cubit.dart';

@immutable
abstract class AppContainerState {}

class AppContainerUnauthenticated extends AppContainerState {}

class AppContainerAuthenticated extends AppContainerState {}
