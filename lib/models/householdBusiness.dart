class HouseholdBusiness {
  int householdBusinessID;
  String householdBusinessCode;
  String householdBusinessName;
  int formID;
  String formName;
  String taxCode;
  String iDNo;
  String email;
  String phone;
  String mobile;
  String temporaryAddress;
  String permanentAddress;
  String licenseNo;
  String licenseDate;
  String changeDate;
  String commitBusinessField;
  String description;
  int statusID;
  String statusName;
  String note;
  bool isActive;
  bool isLockApp;
  int marketID;
  String marketName;
  int companyID;
  String companyName;
  bool isATTPLicense;

  HouseholdBusiness(
      {this.householdBusinessID,
        this.householdBusinessCode,
        this.householdBusinessName,
        this.formID,
        this.formName,
        this.taxCode,
        this.iDNo,
        this.email,
        this.phone,
        this.mobile,
        this.temporaryAddress,
        this.permanentAddress,
        this.licenseNo,
        this.licenseDate,
        this.changeDate,
        this.commitBusinessField,
        this.description,
        this.statusID,
        this.statusName,
        this.note,
        this.isActive,
        this.isLockApp,
        this.marketID,
        this.marketName,
        this.companyID,
        this.companyName,
        this.isATTPLicense});

  HouseholdBusiness.fromJson(Map<String, dynamic> json) {
    householdBusinessID = json['HouseholdBusinessID'];
    householdBusinessCode = json['HouseholdBusinessCode'];
    householdBusinessName = json['HouseholdBusinessName'];
    formID = json['FormID'];
    formName = json['FormName'];
    taxCode = json['TaxCode'];
    iDNo = json['IDNo'];
    email = json['Email'];
    phone = json['Phone'];
    mobile = json['Mobile'];
    temporaryAddress = json['TemporaryAddress'];
    permanentAddress = json['PermanentAddress'];
    licenseNo = json['LicenseNo'];
    licenseDate = json['LicenseDate'];
    changeDate = json['ChangeDate'];
    commitBusinessField = json['CommitBusinessField'];
    description = json['Description'];
    statusID = json['StatusID'];
    statusName = json['StatusName'];
    note = json['Note'];
    isActive = json['isActive'];
    isLockApp = json['isLockApp'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    isATTPLicense = json['isATTPLicense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HouseholdBusinessID'] = this.householdBusinessID;
    data['HouseholdBusinessCode'] = this.householdBusinessCode;
    data['HouseholdBusinessName'] = this.householdBusinessName;
    data['FormID'] = this.formID;
    data['FormName'] = this.formName;
    data['TaxCode'] = this.taxCode;
    data['IDNo'] = this.iDNo;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['TemporaryAddress'] = this.temporaryAddress;
    data['PermanentAddress'] = this.permanentAddress;
    data['LicenseNo'] = this.licenseNo;
    data['LicenseDate'] = this.licenseDate;
    data['ChangeDate'] = this.changeDate;
    data['CommitBusinessField'] = this.commitBusinessField;
    data['Description'] = this.description;
    data['StatusID'] = this.statusID;
    data['StatusName'] = this.statusName;
    data['Note'] = this.note;
    data['isActive'] = this.isActive;
    data['isLockApp'] = this.isLockApp;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    data['isATTPLicense'] = this.isATTPLicense;
    return data;
  }
}