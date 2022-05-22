class Revenue {
  int revenueID;
  int typeID;
  String typeName;
  String revenueCode;
  String revenueDate;
  int employeeID;
  String employeeName;
  int amount;
  String reason;
  int householdBusinessID;
  String householdBusinessName;
  int kiotID;
  String kiotName;
  int revenueTypeID;
  String revenueTypeName;
  String customerName;
  String mobile;
  String address;
  String note;
  bool isRevenue;
  int marketID;
  String marketName;
  int companyID;
  String companyName;
  int productGroupID;
  String productGroupName;

  Revenue(
      {this.revenueID,
        this.typeID,
        this.typeName,
        this.revenueCode,
        this.revenueDate,
        this.employeeID,
        this.employeeName,
        this.amount,
        this.reason,
        this.householdBusinessID,
        this.householdBusinessName,
        this.kiotID,
        this.kiotName,
        this.revenueTypeID,
        this.revenueTypeName,
        this.customerName,
        this.mobile,
        this.address,
        this.note,
        this.isRevenue,
        this.marketID,
        this.marketName,
        this.companyID,
        this.companyName,
        this.productGroupID,
        this.productGroupName});

  Revenue.fromJson(Map<String, dynamic> json) {
    revenueID = json['RevenueID'];
    typeID = json['TypeID'];
    typeName = json['TypeName'];
    revenueCode = json['RevenueCode'];
    revenueDate = json['RevenueDate'];
    employeeID = json['EmployeeID'];
    employeeName = json['EmployeeName'];
    amount = json['Amount'];
    reason = json['Reason'];
    householdBusinessID = json['HouseholdBusinessID'];
    householdBusinessName = json['HouseholdBusinessName'];
    kiotID = json['KiotID'];
    kiotName = json['KiotName'];
    revenueTypeID = json['RevenueTypeID'];
    revenueTypeName = json['RevenueTypeName'];
    customerName = json['CustomerName'];
    mobile = json['Mobile'];
    address = json['Address'];
    note = json['Note'];
    isRevenue = json['isRevenue'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    productGroupID = json['ProductGroupID'];
    productGroupName = json['ProductGroupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RevenueID'] = this.revenueID;
    data['TypeID'] = this.typeID;
    data['TypeName'] = this.typeName;
    data['RevenueCode'] = this.revenueCode;
    data['RevenueDate'] = this.revenueDate;
    data['EmployeeID'] = this.employeeID;
    data['EmployeeName'] = this.employeeName;
    data['Amount'] = this.amount;
    data['Reason'] = this.reason;
    data['HouseholdBusinessID'] = this.householdBusinessID;
    data['HouseholdBusinessName'] = this.householdBusinessName;
    data['KiotID'] = this.kiotID;
    data['KiotName'] = this.kiotName;
    data['RevenueTypeID'] = this.revenueTypeID;
    data['RevenueTypeName'] = this.revenueTypeName;
    data['CustomerName'] = this.customerName;
    data['Mobile'] = this.mobile;
    data['Address'] = this.address;
    data['Note'] = this.note;
    data['isRevenue'] = this.isRevenue;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    data['ProductGroupID'] = this.productGroupID;
    data['ProductGroupName'] = this.productGroupName;
    return data;
  }
}