class Contract {
  int kiotForRentID;
  String rentCode;
  String rentDate;
  int employeeID;
  String employeeName;
  String kiotName;
  int householdBusinessID;
  String householdBusinessName;
  int contractTypeID;
  String contractTypeName;
  num totalAmount;
  int statusID;
  String statusName;
  String statusDate;
  String description;
  String note;
  int approverID;
  String approveDate;
  bool isApprove;
  int marketID;
  String marketName;
  List<DSDKD> dSDKD;
  int companyID;
  String companyName;

  Contract(
      {this.kiotForRentID,
        this.rentCode,
        this.rentDate,
        this.employeeID,
        this.employeeName,
        this.kiotName,
        this.householdBusinessID,
        this.householdBusinessName,
        this.contractTypeID,
        this.contractTypeName,
        this.totalAmount,
        this.statusID,
        this.statusName,
        this.statusDate,
        this.description,
        this.note,
        this.approverID,
        this.approveDate,
        this.isApprove,
        this.marketID,
        this.marketName,
        this.dSDKD,
        this.companyID,
        this.companyName});

  Contract.fromJson(Map<String, dynamic> json) {
    kiotForRentID = json['KiotForRentID'];
    rentCode = json['RentCode'];
    rentDate = json['RentDate'];
    employeeID = json['EmployeeID'];
    employeeName = json['EmployeeName'];
    kiotName = json['KiotName'];
    householdBusinessID = json['HouseholdBusinessID'];
    householdBusinessName = json['HouseholdBusinessName'];
    contractTypeID = json['ContractTypeID'];
    contractTypeName = json['ContractTypeName'];
    totalAmount = json['TotalAmount'];
    statusID = json['StatusID'];
    statusName = json['StatusName'];
    statusDate = json['StatusDate'];
    description = json['Description'];
    note = json['Note'];
    approverID = json['ApproverID'];
    approveDate = json['ApproveDate'];
    isApprove = json['IsApprove'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
    if (json['DS_DKD'] != null) {
      dSDKD = <DSDKD>[];
      json['DS_DKD'].forEach((v) {
        dSDKD.add(new DSDKD.fromJson(v));
      });
    }
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KiotForRentID'] = this.kiotForRentID;
    data['RentCode'] = this.rentCode;
    data['RentDate'] = this.rentDate;
    data['EmployeeID'] = this.employeeID;
    data['EmployeeName'] = this.employeeName;
    data['KiotName'] = this.kiotName;
    data['HouseholdBusinessID'] = this.householdBusinessID;
    data['HouseholdBusinessName'] = this.householdBusinessName;
    data['ContractTypeID'] = this.contractTypeID;
    data['ContractTypeName'] = this.contractTypeName;
    data['TotalAmount'] = this.totalAmount;
    data['StatusID'] = this.statusID;
    data['StatusName'] = this.statusName;
    data['StatusDate'] = this.statusDate;
    data['Description'] = this.description;
    data['Note'] = this.note;
    data['ApproverID'] = this.approverID;
    data['ApproveDate'] = this.approveDate;
    data['IsApprove'] = this.isApprove;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    if (this.dSDKD != null) {
      data['DS_DKD'] = this.dSDKD.map((v) => v.toJson()).toList();
    }
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    return data;
  }
}

class DSDKD {
  int kFRDetailID;
  int kiotForRentID;
  int kiotID;
  String kiotName;
  int productGroupID;
  String productGroupName;
  int regionID;
  String regionName;
  String size;
  num area;
  num qty;
  num price;
  num amount;
  String startDate;
  String endDate;

  DSDKD(
      {this.kFRDetailID,
        this.kiotForRentID,
        this.kiotID,
        this.kiotName,
        this.productGroupID,
        this.productGroupName,
        this.regionID,
        this.regionName,
        this.size,
        this.area,
        this.qty,
        this.price,
        this.amount,
        this.startDate,
        this.endDate});

  DSDKD.fromJson(Map<String, dynamic> json) {
    kFRDetailID = json['KFRDetailID'];
    kiotForRentID = json['KiotForRentID'];
    kiotID = json['KiotID'];
    kiotName = json['KiotName'];
    productGroupID = json['ProductGroupID'];
    productGroupName = json['ProductGroupName'];
    regionID = json['RegionID'];
    regionName = json['RegionName'];
    size = json['Size'];
    area = json['Area'];
    qty = json['Qty'];
    price = json['Price'];
    amount = json['Amount'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KFRDetailID'] = this.kFRDetailID;
    data['KiotForRentID'] = this.kiotForRentID;
    data['KiotID'] = this.kiotID;
    data['KiotName'] = this.kiotName;
    data['ProductGroupID'] = this.productGroupID;
    data['ProductGroupName'] = this.productGroupName;
    data['RegionID'] = this.regionID;
    data['RegionName'] = this.regionName;
    data['Size'] = this.size;
    data['Area'] = this.area;
    data['Qty'] = this.qty;
    data['Price'] = this.price;
    data['Amount'] = this.amount;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    return data;
  }
}