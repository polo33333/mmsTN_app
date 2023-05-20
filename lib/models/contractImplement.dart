
class ContractImplement {
int contractImplementID;
String reportDate;
int employeeID;
int contractID;
String documentNo;
int contractContentTypeID;
String contractContentTypeName;
String description;
String note;
int marketID;
int companyID;

ContractImplement(
{this.contractImplementID,
this.reportDate,
this.employeeID,
this.contractID,
this.documentNo,
this.contractContentTypeID,
this.contractContentTypeName,
this.description,
this.note,
this.marketID,
this.companyID});

ContractImplement.fromJson(Map<String, dynamic> json) {
contractImplementID = json['ContractImplementID'];
reportDate = json['ReportDate'];
employeeID = json['EmployeeID'];
contractID = json['ContractID'];
documentNo = json['DocumentNo'];
contractContentTypeID = json['ContractContentTypeID'];
contractContentTypeName = json['ContractContentTypeName'];
description = json['Description'];
note = json['Note'];
marketID = json['MarketID'];
companyID = json['CompanyID'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['ContractImplementID'] = this.contractImplementID;
data['ReportDate'] = this.reportDate;
data['EmployeeID'] = this.employeeID;
data['ContractID'] = this.contractID;
data['DocumentNo'] = this.documentNo;
data['ContractContentTypeID'] = this.contractContentTypeID;
data['ContractContentTypeName'] = this.contractContentTypeName;
data['Description'] = this.description;
data['Note'] = this.note;
data['MarketID'] = this.marketID;
data['CompanyID'] = this.companyID;
return data;
}
}