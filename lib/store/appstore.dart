
import 'dart:async';

import 'package:gym/Repositories/app_repository.dart';
import 'package:gym/models/appData.dart';
import 'package:mobx/mobx.dart';

part 'appstore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  AppRepository repository = new AppRepository();

  @observable
  // String token = repository.getToken();

  
  @observable
  ObservableFuture<AppData> loadDataFuture = ObservableFuture<AppData>.value(null);

  @action
  Future intializeAppState() =>
      loadDataFuture = ObservableFuture(repository.loadAppData());

  @action
  Future setToken(String token) async {
    await repository.setToken(token);
    intializeAppState();
  }

  @action
  Future setIsSeenTutorial(bool isSeenTutorial) async {
    await repository.persistOnboarding(isSeenTutorial);
    intializeAppState();
  }

}
