
class ContractAttachFile {
  int attachFileID;
  String fileName;
  int valueID;
  String tableName;
  String fileLink;

  ContractAttachFile(
      {this.attachFileID,
        this.fileName,
        this.valueID,
        this.tableName,
        this.fileLink});

  ContractAttachFile.fromJson(Map<String, dynamic> json) {
    attachFileID = json['AttachFileID'];
    fileName = json['FileName'];
    valueID = json['ValueID'];
    tableName = json['TableName'];
    fileLink = json['FileLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AttachFileID'] = this.attachFileID;
    data['FileName'] = this.fileName;
    data['ValueID'] = this.valueID;
    data['TableName'] = this.tableName;
    data['FileLink'] = this.fileLink;
    return data;
  }
}