import 'package:flutter/foundation.dart';
import '/models/revenue.dart';


class RevenueProvider extends ChangeNotifier {
  bool _isRevenuePageProcessing = true;
  int _currentPage = 1;
  List<Revenue> _revenueList = [];
  List<Revenue> _tempRevenueList = [];
  bool _shouldRefresh = true;
  String _searchString = "";

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isRevenuePageProcessing => _isRevenuePageProcessing;



  setIsRevenueProcessing(bool value) {
    _isRevenuePageProcessing = value;
    notifyListeners();
  }

  List<Revenue> get revenueList => _revenueList;

  setRevenueList(List<Revenue> list, {bool notify = true}) {
    _revenueList = list;
    //print(list);
    _tempRevenueList = _revenueList;
    if (notify) notifyListeners();
  }

  mergeRevenueList(List<Revenue> list, {bool notify = true}) {
    _revenueList.addAll(list);
    if (notify) notifyListeners();
  }

  addRevenue(Revenue revenue, {bool notify = true}) {
    _revenueList.add(revenue);
    if (notify) notifyListeners();
  }

  Revenue getRevenueByIndex(int index) => _revenueList[index];

  int get revenueListLength => _revenueList.length;
}