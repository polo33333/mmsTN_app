class Kiot {
  int kiotID;
  String kiotCode;
  String kiotName;
  int kiotTypeID;
  String kiotTypeName;
  int marketID;
  String marketName;
  dynamic  area;
  String position;
  int regionID;
  String regionName;
  int productGroupID;
  String productGroupName;
  String productName;
  String qSDLicenseNo;
  String qSDLicenseDate;
  String qSDFullName;
  String qSDIDNo;
  String qSDEmail;
  String qSDPhone;
  String qSDAddress;
  String description;
  String note;
  bool isGovernment;
  bool isStore;
  int statusID;
  String statusName;
  String other1;
  String other2;
  String other3;
  int companyID;
  String companyName;
  int nKDKiotForRentID;
  int nKDHouseholdBusinessID;
  String nKDFullName;
  String nKDIDNo;
  String nKDEmail;
  String nKDPhone;
  String nKDAddress;
  String nKDTaxCode;
  String nKDLicenseNo;
  String nKDLicenseDate;
  String nKDContractNo;
  String nKDContractTypeName;
  String nKDFormName;

  Kiot(
      {this.kiotID,
        this.kiotCode,
        this.kiotName,
        this.kiotTypeID,
        this.kiotTypeName,
        this.marketID,
        this.marketName,
        this.area,
        this.position,
        this.regionID,
        this.regionName,
        this.productGroupID,
        this.productGroupName,
        this.productName,
        this.qSDLicenseNo,
        this.qSDLicenseDate,
        this.qSDFullName,
        this.qSDIDNo,
        this.qSDEmail,
        this.qSDPhone,
        this.qSDAddress,
        this.description,
        this.note,
        this.isGovernment,
        this.isStore,
        this.statusID,
        this.statusName,
        this.other1,
        this.other2,
        this.other3,
        this.companyID,
        this.companyName,
        this.nKDKiotForRentID,
        this.nKDHouseholdBusinessID,
        this.nKDFullName,
        this.nKDIDNo,
        this.nKDEmail,
        this.nKDPhone,
        this.nKDAddress,
        this.nKDTaxCode,
        this.nKDLicenseNo,
        this.nKDLicenseDate,
        this.nKDContractNo,
        this.nKDContractTypeName,
        this.nKDFormName});

  Kiot.fromJson(Map<String, dynamic> json) {
    kiotID = json['KiotID'];
    kiotCode = json['KiotCode'];
    kiotName = json['KiotName'];
    kiotTypeID = json['KiotTypeID'];
    kiotTypeName = json['KiotTypeName'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
    area = json['Area'];
    position = json['Position'];
    regionID = json['RegionID'];
    regionName = json['RegionName'];
    productGroupID = json['ProductGroupID'];
    productGroupName = json['ProductGroupName'];
    productName = json['ProductName'];
    qSDLicenseNo = json['QSD_LicenseNo'];
    qSDLicenseDate = json['QSD_LicenseDate'];
    qSDFullName = json['QSD_FullName'];
    qSDIDNo = json['QSD_IDNo'];
    qSDEmail = json['QSD_Email'];
    qSDPhone = json['QSD_Phone'];
    qSDAddress = json['QSD_Address'];
    description = json['Description'];
    note = json['Note'];
    isGovernment = json['isGovernment'];
    isStore = json['isStore'];
    statusID = json['StatusID'];
    statusName = json['StatusName'];
    other1 = json['Other1'];
    other2 = json['Other2'];
    other3 = json['Other3'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    nKDKiotForRentID = json['NKD_KiotForRentID'];
    nKDHouseholdBusinessID = json['NKD_HouseholdBusinessID'];
    nKDFullName = json['NKD_FullName'];
    nKDIDNo = json['NKD_IDNo'];
    nKDEmail = json['NKD_Email'];
    nKDPhone = json['NKD_Phone'];
    nKDAddress = json['NKD_Address'];
    nKDTaxCode = json['NKD_TaxCode'];
    nKDLicenseNo = json['NKD_LicenseNo'];
    nKDLicenseDate = json['NKD_LicenseDate'];
    nKDContractNo = json['NKD_ContractNo'];
    nKDContractTypeName = json['NKD_ContractTypeName'];
    nKDFormName = json['NKD_FormName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KiotID'] = this.kiotID;
    data['KiotCode'] = this.kiotCode;
    data['KiotName'] = this.kiotName;
    data['KiotTypeID'] = this.kiotTypeID;
    data['KiotTypeName'] = this.kiotTypeName;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    data['Area'] = this.area;
    data['Position'] = this.position;
    data['RegionID'] = this.regionID;
    data['RegionName'] = this.regionName;
    data['ProductGroupID'] = this.productGroupID;
    data['ProductGroupName'] = this.productGroupName;
    data['ProductName'] = this.productName;
    data['QSD_LicenseNo'] = this.qSDLicenseNo;
    data['QSD_LicenseDate'] = this.qSDLicenseDate;
    data['QSD_FullName'] = this.qSDFullName;
    data['QSD_IDNo'] = this.qSDIDNo;
    data['QSD_Email'] = this.qSDEmail;
    data['QSD_Phone'] = this.qSDPhone;
    data['QSD_Address'] = this.qSDAddress;
    data['Description'] = this.description;
    data['Note'] = this.note;
    data['isGovernment'] = this.isGovernment;
    data['isStore'] = this.isStore;
    data['StatusID'] = this.statusID;
    data['StatusName'] = this.statusName;
    data['Other1'] = this.other1;
    data['Other2'] = this.other2;
    data['Other3'] = this.other3;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    data['NKD_KiotForRentID'] = this.nKDKiotForRentID;
    data['NKD_HouseholdBusinessID'] = this.nKDHouseholdBusinessID;
    data['NKD_FullName'] = this.nKDFullName;
    data['NKD_IDNo'] = this.nKDIDNo;
    data['NKD_Email'] = this.nKDEmail;
    data['NKD_Phone'] = this.nKDPhone;
    data['NKD_Address'] = this.nKDAddress;
    data['NKD_TaxCode'] = this.nKDTaxCode;
    data['NKD_LicenseNo'] = this.nKDLicenseNo;
    data['NKD_LicenseDate'] = this.nKDLicenseDate;
    data['NKD_ContractNo'] = this.nKDContractNo;
    data['NKD_ContractTypeName'] = this.nKDContractTypeName;
    data['NKD_FormName'] = this.nKDFormName;
    return data;
  }
}