class Master {
  int masterID;
  int masterType;
  int parentID;
  String parentName;
  String code;
  String name;
  String parameter1;
  String parameter2;
  String note;
  bool isCheck;
  int companyID;
  String companyName;

  Master(
      {this.masterID,
        this.masterType,
        this.parentID,
        this.parentName,
        this.code,
        this.name,
        this.parameter1,
        this.parameter2,
        this.note,
        this.isCheck,
        this.companyID,
        this.companyName});

  Master.fromJson(Map<String, dynamic> json) {
    masterID = json['MasterID'];
    masterType = json['MasterType'];
    parentID = json['ParentID'];
    parentName = json['ParentName'];
    code = json['Code'];
    name = json['Name'];
    parameter1 = json['Parameter1'];
    parameter2 = json['Parameter2'];
    note = json['Note'];
    isCheck = json['isCheck'];
    companyID = json['CompanyID'];
    companyName = json['CompanyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MasterID'] = this.masterID;
    data['MasterType'] = this.masterType;
    data['ParentID'] = this.parentID;
    data['ParentName'] = this.parentName;
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['Parameter1'] = this.parameter1;
    data['Parameter2'] = this.parameter2;
    data['Note'] = this.note;
    data['isCheck'] = this.isCheck;
    data['CompanyID'] = this.companyID;
    data['CompanyName'] = this.companyName;
    return data;
  }
}