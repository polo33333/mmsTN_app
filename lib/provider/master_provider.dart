import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mms_1/models/master.dart';

import '../models/contract.dart';

class MasterProvider extends ChangeNotifier {
  bool _isMasterPageProcessing = true;
  int _currentPage = 1;
  List<Master> _masterList = [];
  List<Master> _tempMasterList = [];
  bool _shouldRefresh = true;
  String _searchString = "";

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isMasterPageProcessing => _isMasterPageProcessing;



  setIsContractProcessing(bool value) {
    _isMasterPageProcessing = value;
    notifyListeners();
  }

  List<Master> get masterList => _masterList;

  setMasterList(List<Master> list, {bool notify = true}) {
    _masterList = list;
    //print(_masterList);
    _tempMasterList = _masterList;
    if (notify) notifyListeners();
  }

  mergeMasterList(List<Master> list, {bool notify = true}) {
    _masterList.addAll(list);
    if (notify) notifyListeners();
  }

  addMaster(Master master, {bool notify = true}) {
    _masterList.add(master);
    if (notify) notifyListeners();
  }

  // changeSearchString(String searchString) {
  //   _searchString = searchString;
  //   _masterList= _tempMasterList.where((dog) => dog.rentCode.contains(_searchString)).toList();
  //   notifyListeners();
  // }

  Master getMasterByIndex(int index) => _masterList[index];

  int get masterListLength => _masterList.length;
}