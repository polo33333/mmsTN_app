class Contract {
  int kiotForRentID;
  String rentCode;
  String rentDate;
  int employeeID;
  String employeeName;
  int kiotID;
  String kiotName;
  int householdBusinessID;
  String householdBusinessName;
  int productGroupID;
  String productGroupName;
  int regionID;
  String regionName;
  int contractTypeID;
  String contractTypeName;
  String size;
  dynamic area;
  String startDate;
  String endDate;
  int qty;
  dynamic price;
  dynamic amount;
  int statusID;
  String statusName;
  String statusDate;
  String description;
  String note;
  int marketID;
  String marketName;
  int companyID;
  String companyName;

  Contract(
      {this.kiotForRentID,
        this.rentCode,
        this.rentDate,
        this.employeeID,
        this.employeeName,
        this.kiotID,
        this.kiotName,
        this.householdBusinessID,
        this.householdBusinessName,
        this.productGroupID,
        this.productGroupName,
        this.regionID,
        this.regionName,
        this.contractTypeID,
        this.contractTypeName,
        this.size,
        this.area,
        this.startDate,
        this.endDate,
        this.qty,
        this.price,
        this.amount,
        this.statusID,
        this.statusName,
        this.statusDate,
        this.description,
        this.note,
        this.marketID,
        this.marketName,
        this.companyID,
        this.companyName});

  Contract.fromJson(Map<String, dynamic> json) {
    kiotForRentID = json['KiotForRentID'];
    rentCode = json['RentCode'];
    rentDate = json['RentDate'];
    employeeID = json['EmployeeID'];
    employeeName = json['EmployeeName'];
    kiotID = json['KiotID'];
    kiotName = json['KiotName'];
    householdBusinessID = json['HouseholdBusinessID'];
    householdBusinessName = json['HouseholdBusinessName'];
    productGroupID = json['ProductGroupID'];
    productGroupName = json['ProductGroupName'];
    regionID = json['RegionID'];
    regionName = json['RegionName'];
    contractTypeID = json['ContractTypeID'];
    contractTypeName = json['ContractTypeName'];
    size = json['Size'];
    area = json['Area'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    qty = json['Qty'];
    price = json['Price'];
    amount = json['Amount'];
    statusID = json['StatusID'];
    statusName = json['StatusName'];
    statusDate = json['StatusDate'];
    description = json['Description'];
    note = json['Note'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
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
    data['KiotID'] = this.kiotID;
    data['KiotName'] = this.kiotName;
    data['HouseholdBusinessID'] = this.householdBusinessID;
    data['HouseholdBusinessName'] = this.householdBusinessName;
    data['ProductGroupID'] = this.productGroupID;
    data['ProductGroupName'] = this.productGroupName;
    data['RegionID'] = this.regionID;
    data['RegionName'] = this.regionName;
    data['ContractTypeID'] = this.contractTypeID;
    data['ContractTypeName'] = this.contractTypeName;
    data['Size'] = this.size;
    data['Area'] = this.area;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Qty'] = this.qty;
    data['Price'] = this.price;
    data['Amount'] = this.amount;
    data['StatusID'] = this.statusID;
    data['StatusName'] = this.statusName;
    data['StatusDate'] = this.statusDate;
    data['Description'] = this.description;
    data['Note'] = this.note;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    return data;
  }
}