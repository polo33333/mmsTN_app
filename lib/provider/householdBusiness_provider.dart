import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../models/householdBusiness.dart';

class HouseholdBusinessProvider extends ChangeNotifier {
  bool _isHouseholdBusinessProcessing = true;
  int _currentPage = 1;
  List<HouseholdBusiness> _householdBusinessList = [];
  List<HouseholdBusiness> _tempHouseholdBusinessList = [];
  bool _shouldRefresh = true;
  //String _searchString = "";

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isHouseholdBusinessProcessing => _isHouseholdBusinessProcessing;



  setIsHouseholdBusinessProcessing(bool value) {
    _isHouseholdBusinessProcessing = value;
    notifyListeners();
  }

  List<HouseholdBusiness> get householdBusinessList => _householdBusinessList;

  setHouseholdBusinessList(List<HouseholdBusiness> list, {bool notify = true}) {
    _householdBusinessList = list;
    _tempHouseholdBusinessList = _householdBusinessList;
    if (notify) notifyListeners();
  }

  mergeHouseholdBusinessList(List<HouseholdBusiness> list, {bool notify = true}) {
    _householdBusinessList.addAll(list);
    if (notify) notifyListeners();
  }

  addHouseholdBusiness(HouseholdBusiness householdBusiness, {bool notify = true}) {
    _householdBusinessList.add(householdBusiness);
    if (notify) notifyListeners();
  }

  changeSearchString(String _mobile,String _householdBusinessName,String _iDNo) {

    _householdBusinessList= _tempHouseholdBusinessList.where((h) => h.mobile.contains(_mobile) && h.iDNo.contains(_iDNo) && h.householdBusinessName.toLowerCase().contains(_householdBusinessName.toLowerCase())).toList();
    print(_householdBusinessList);
    notifyListeners();
  }

  HouseholdBusiness getHouseholdBusinessByIndex(int index) => _householdBusinessList[index];

  int get householdBusinessListLength => _householdBusinessList.length;
}