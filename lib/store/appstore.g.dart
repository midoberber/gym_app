// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on AppStoreBase, Store {
  final _$loadDataFutureAtom = Atom(name: 'AppStoreBase.loadDataFuture');

  @override
  ObservableFuture<AppData> get loadDataFuture {
    _$loadDataFutureAtom.context.enforceReadPolicy(_$loadDataFutureAtom);
    _$loadDataFutureAtom.reportObserved();
    return super.loadDataFuture;
  }

  @override
  set loadDataFuture(ObservableFuture<AppData> value) {
    _$loadDataFutureAtom.context.conditionallyRunInAction(() {
      super.loadDataFuture = value;
      _$loadDataFutureAtom.reportChanged();
    }, _$loadDataFutureAtom, name: '${_$loadDataFutureAtom.name}_set');
  }

  final _$setTokenAsyncAction = AsyncAction('setToken');

  @override
  Future<dynamic> setToken(String token) {
    return _$setTokenAsyncAction.run(() => super.setToken(token));
  }

  final _$setIsSeenTutorialAsyncAction = AsyncAction('setIsSeenTutorial');

  @override
  Future<dynamic> setIsSeenTutorial(bool isSeenTutorial) {
    return _$setIsSeenTutorialAsyncAction
        .run(() => super.setIsSeenTutorial(isSeenTutorial));
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  Future intializeAppState() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.intializeAppState();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
