class AppConfig {
  //static final _baseUrl = 'http://103.226.248.147:90/api/v1';
  static final _baseUrl = 'http://103.226.248.147:89/api/v1';
  //static final _baseUrl = 'http://localhost:52751/api/v1';
  static final marketGetAll = _baseUrl + '/market/getAll';
  static final kiotForRentSearch = _baseUrl + '/KiotForRent/search';
  static final kiotForRentGetByRentCode= _baseUrl + '/KiotForRent/GetByRentCode';
  static final householdBusinessGetall = _baseUrl + '/householdBusiness/getAll';
  static final masterGetAll = _baseUrl + '/Master/GetByType/8/0';
  static final kiotSearch = _baseUrl + '/kiot/search';
  static final kiotEmpty = _baseUrl + '/kiot/empty/GetByMarketId/';
  static final nodata = 'Dữ liệu trống';

  static final URL_CREATEFCM = _baseUrl + "/FCM/SaveToken";
  static final URL_SIGNIN = _baseUrl + "/Auth/HouseholdBusiness/SignIn";
  static final URL_VERIFY = _baseUrl + "/Auth/Verify";
  static final URL_CHANGEPASSWORD = _baseUrl + "/Auth/ChangePassword";
  static final URL_GETINFOEMPLOYEE = _baseUrl + "/Auth/GetInfoEmployee/?token=";
  static final URL_GETNOTIFICATION = _baseUrl + "/Notification/GetNotification/?token=";
  static final URL_REMOVENOTIFICATION = _baseUrl + "/Notification/REMOVENotification/?id=";
  static final URL_SIGNOUT = _baseUrl + "/Auth/SignOut/?token=";
  static final URL_SENDREPORT = _baseUrl + "/Feedback";
  static final URL_REVENUESEARCH = _baseUrl + "/Revenue/Search";
  static final URL_GETINFOHOUSEHOLDBUSINESS = _baseUrl +  "/HouseholdBusiness/Info/";
  //key
  static final FCM_token = 'FCM_TOKEN';
  static final RentCode = 'RentCode';
  static final MarketId = 'MarketID';
  static final login = 'NO';
}
