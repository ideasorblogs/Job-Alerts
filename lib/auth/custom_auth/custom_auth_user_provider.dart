import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class JobAlertsAuthUser {
  JobAlertsAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<JobAlertsAuthUser> jobAlertsAuthUserSubject =
    BehaviorSubject.seeded(JobAlertsAuthUser(loggedIn: false));
Stream<JobAlertsAuthUser> jobAlertsAuthUserStream() => jobAlertsAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
