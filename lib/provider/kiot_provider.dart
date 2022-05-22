import 'package:flutter/foundation.dart';

import '../models/kiot.dart';

class KiotProvider extends ChangeNotifier {
  bool _isKiotPageProcessing = true;
  int _currentPage = 1;
  List<Kiot> _kiotList,_tempKiotList = [];
  bool _shouldRefresh = true;

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isKiotPageProcessing => _isKiotPageProcessing;

  setIsKiotPageProcessing(bool value) {
    _isKiotPageProcessing = value;
    notifyListeners();
  }

  List<Kiot> get kiottList => _kiotList;

  setKiotList(List<Kiot> list, {bool notify = true}) {
    _kiotList = list;
    _tempKiotList = _kiotList;
    if (notify) notifyListeners();
  }

  mergeKiotList(List<Kiot> list, {bool notify = true}) {
    _kiotList.addAll(list);
    if (notify) notifyListeners();
  }

  changeSearchString(String _kiotName ) {
    _kiotList= _tempKiotList.where((k) => k.kiotName.toLowerCase().contains(_kiotName.toLowerCase()) ).toList();
    notifyListeners();
  }

  addKiot(Kiot kiot, {bool notify = true}) {
    _kiotList.add(kiot);
    if (notify) notifyListeners();
  }

  Kiot getKiotByIndex(int index) => _kiotList[index];

  int get kiotListLength => _kiotList.length;
}