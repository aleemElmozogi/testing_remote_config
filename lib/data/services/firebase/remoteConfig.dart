import 'package:firebase_remote_config/firebase_remote_config.dart';

class FireBaseRemoteConfigObj {
  final remoteConfig = FirebaseRemoteConfig.instance;
  Future initializeConfig() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 20),
        minimumFetchInterval: const Duration(minutes: 5),
      ),
    );

    await remoteConfig.fetchAndActivate();

    var remoteConfigJson = remoteConfig.getString('DynamicWidget');
    return remoteConfigJson;
  }
}
