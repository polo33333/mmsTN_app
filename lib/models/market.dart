class Market {
  int marketID;
  String marketCode;
  String marketName;
  String marketNameNN;
  num area;
  int marketTypeID;
  String marketTypeName;
  int region;
  int sDKDTTK;
  String contactName;
  String mobile;
  String email;
  String phone;
  String website;
  String address;
  String description;
  String other1;
  String other2;
  String other3;
  String other4;
  String other5;
  String other6;
  String other7;
  String other8;
  String other9;
  String note;
  bool isActive;
  int companyID;
  String companyName;
  int dKDTONG;
  int qSDDKDNN;
  int qSDDKDCNTC;
  int sDKDDHD;
  int sDKDLK;
  int sDKDCT;
  int sTNCGCNDKKD;
  int sTNCGCNATTP;
  int sTNCKSK;
  int tHCTNTONG;
  int tHCTNDHD;
  int tHCTNTNHD;
  int tHCTNNHD;
  int dKDKYHD;

  Market(
      {this.marketID,
        this.marketCode,
        this.marketName,
        this.marketNameNN,
        this.area,
        this.marketTypeID,
        this.marketTypeName,
        this.region,
        this.sDKDTTK,
        this.contactName,
        this.mobile,
        this.email,
        this.phone,
        this.website,
        this.address,
        this.description,
        this.other1,
        this.other2,
        this.other3,
        this.other4,
        this.other5,
        this.other6,
        this.other7,
        this.other8,
        this.other9,
        this.note,
        this.isActive,
        this.companyID,
        this.companyName,
        this.dKDTONG,
        this.qSDDKDNN,
        this.qSDDKDCNTC,
        this.sDKDDHD,
        this.sDKDLK,
        this.sDKDCT,
        this.sTNCGCNDKKD,
        this.sTNCGCNATTP,
        this.sTNCKSK,
        this.tHCTNTONG,
        this.tHCTNDHD,
        this.tHCTNTNHD,
        this.tHCTNNHD,
        this.dKDKYHD});

  Market.fromJson(Map<String, dynamic> json) {
    marketID = json['MarketID'];
    marketCode = json['MarketCode'];
    marketName = json['MarketName'];
    marketNameNN = json['MarketName_NN'];
    area = json['Area'];
    marketTypeID = json['MarketTypeID'];
    marketTypeName = json['MarketTypeName'];
    region = json['Region'];
    sDKDTTK = json['SDKDTTK'];
    contactName = json['ContactName'];
    mobile = json['Mobile'];
    email = json['Email'];
    phone = json['Phone'];
    website = json['Website'];
    address = json['Address'];
    description = json['Description'];
    other1 = json['Other_1'];
    other2 = json['Other_2'];
    other3 = json['Other_3'];
    other4 = json['Other_4'];
    other5 = json['Other_5'];
    other6 = json['Other_6'];
    other7 = json['Other_7'];
    other8 = json['Other_8'];
    other9 = json['Other_9'];
    note = json['Note'];
    isActive = json['isActive'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    dKDTONG = json['DKD_TONG'];
    qSDDKDNN = json['QSDDKDNN'];
    qSDDKDCNTC = json['QSDDKDCNTC'];
    sDKDDHD = json['SDKDDHD'];
    sDKDLK = json['SDKDLK'];
    sDKDCT = json['SDKDCT'];
    sTNCGCNDKKD = json['STNCGCNDKKD'];
    sTNCGCNATTP = json['STNCGCNATTP'];
    sTNCKSK = json['STNCKSK'];
    tHCTNTONG = json['THC_TN_TONG'];
    tHCTNDHD = json['THC_TN_DHD'];
    tHCTNTNHD = json['THC_TN_TNHD'];
    tHCTNNHD = json['THC_TN_NHD'];
    dKDKYHD = json['DKD_KY_HD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MarketID'] = this.marketID;
    data['MarketCode'] = this.marketCode;
    data['MarketName'] = this.marketName;
    data['MarketName_NN'] = this.marketNameNN;
    data['Area'] = this.area;
    data['MarketTypeID'] = this.marketTypeID;
    data['MarketTypeName'] = this.marketTypeName;
    data['Region'] = this.region;
    data['SDKDTTK'] = this.sDKDTTK;
    data['ContactName'] = this.contactName;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Website'] = this.website;
    data['Address'] = this.address;
    data['Description'] = this.description;
    data['Other_1'] = this.other1;
    data['Other_2'] = this.other2;
    data['Other_3'] = this.other3;
    data['Other_4'] = this.other4;
    data['Other_5'] = this.other5;
    data['Other_6'] = this.other6;
    data['Other_7'] = this.other7;
    data['Other_8'] = this.other8;
    data['Other_9'] = this.other9;
    data['Note'] = this.note;
    data['isActive'] = this.isActive;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    data['DKD_TONG'] = this.dKDTONG;
    data['QSDDKDNN'] = this.qSDDKDNN;
    data['QSDDKDCNTC'] = this.qSDDKDCNTC;
    data['SDKDDHD'] = this.sDKDDHD;
    data['SDKDLK'] = this.sDKDLK;
    data['SDKDCT'] = this.sDKDCT;
    data['STNCGCNDKKD'] = this.sTNCGCNDKKD;
    data['STNCGCNATTP'] = this.sTNCGCNATTP;
    data['STNCKSK'] = this.sTNCKSK;
    data['THC_TN_TONG'] = this.tHCTNTONG;
    data['THC_TN_DHD'] = this.tHCTNDHD;
    data['THC_TN_TNHD'] = this.tHCTNTNHD;
    data['THC_TN_NHD'] = this.tHCTNNHD;
    data['DKD_KY_HD'] = this.dKDKYHD;
    return data;
  }
}