import 'package:flutter/foundation.dart';
import '../models/market.dart';

class MarketProvider extends ChangeNotifier {
  bool _isMarketPageProcessing = true;
  int _currentPage = 1;
  List<Market> _marketList = [];
  bool _shouldRefresh = true;
  Market _currentItemSelect = null;

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isMarketPageProcessing => _isMarketPageProcessing;

  setIsMarketlPageProcessing(bool value) {
    _isMarketPageProcessing = value;
    notifyListeners();
  }

  List<Market> get marketList => _marketList;
  Market get currentItemSelect => _currentItemSelect;

  setMarketList(List<Market> list, {bool notify = true}) {
    _marketList = list;
    if (notify) notifyListeners();
  }

  mergeMarketList(List<Market> list, {bool notify = true}) {
    _marketList.addAll(list);
    if (notify) notifyListeners();
  }

  addMarket(Market market, {bool notify = true}) {
    _marketList.add(market);
    if (notify) notifyListeners();
  }

  getMarketById(int _marketId ) {
    _currentItemSelect  = _marketList.where((k) => k.marketID == _marketId ).first;
    // _currentItemSelect = x.length == 0? null: x[0]
     notifyListeners();
  }

  Market getMarketByIndex(int index) => _marketList[index];

  int get marketListLength => _marketList.length;
}