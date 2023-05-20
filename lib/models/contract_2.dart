import 'contractAttachFile.dart';
import 'contractImplement.dart';

class Contract_2 {
  int contractID;
  String contractNo;
  String contractDate;
  String decisionDate;
  String customerName;
  String phone;
  String address;
  int duration;
  String startDate;
  String endDate;
  int qty;
  num price;
  num amount;
  String description;
  String note;
  int marketID;
  String marketName;
  int companyID;
  String companyName;
  List<ContractImplement> contractImplement;
  List<ContractAttachFile> contractAttachFile;

  Contract_2(
      {this.contractID,
        this.contractNo,
        this.contractDate,
        this.decisionDate,
        this.customerName,
        this.phone,
        this.address,
        this.duration,
        this.startDate,
        this.endDate,
        this.qty,
        this.price,
        this.amount,
        this.description,
        this.note,
        this.marketID,
        this.marketName,
        this.companyID,
        this.companyName,
        this.contractImplement,
        this.contractAttachFile
      });

  Contract_2.fromJson(Map<String, dynamic> json) {
    contractID = json['ContractID'];
    contractNo = json['ContractNo'];
    contractDate = json['ContractDate'];
    decisionDate = json['DecisionDate'];
    customerName = json['CustomerName'];
    phone = json['Phone'];
    address = json['Address'];
    duration = json['Duration'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    qty = json['Qty'];
    price = json['Price'];
    amount = json['Amount'];
    description = json['Description'];
    note = json['Note'];
    marketID = json['MarketID'];
    marketName = json['MarketName'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
    if (json['contractImplement'] != null) {
      contractImplement = <ContractImplement>[];
      json['contractImplement'].forEach((v) {
        contractImplement.add(new ContractImplement.fromJson(v));
      });
    }
    if (json['contractAttachFile'] != null) {
      contractAttachFile = <ContractAttachFile>[];
      json['contractAttachFile'].forEach((v) {
        contractAttachFile.add(new ContractAttachFile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContractID'] = this.contractID;
    data['ContractNo'] = this.contractNo;
    data['ContractDate'] = this.contractDate;
    data['DecisionDate'] = this.decisionDate;
    data['CustomerName'] = this.customerName;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['Duration'] = this.duration;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Qty'] = this.qty;
    data['Price'] = this.price;
    data['Amount'] = this.amount;
    data['Description'] = this.description;
    data['Note'] = this.note;
    data['MarketID'] = this.marketID;
    data['MarketName'] = this.marketName;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    if (this.contractImplement != null) {
      data['contractImplement'] =
          this.contractImplement.map((v) => v.toJson()).toList();
    }
    if (this.contractAttachFile != null) {
      data['contractAttachFile'] =
          this.contractAttachFile.map((v) => v.toJson()).toList();
    }
    return data;
  }
}