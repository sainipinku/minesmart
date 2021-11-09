class RawannaData {
  String success = "";
  String message = "";
  List<Data> data = [];

  RawannaData(this.success, this.message, this.data);

  RawannaData.fromJson(Map<String, dynamic> json) {
    success = json['success']!= null ? json['success'] : '';
    message = json['message']!= null ? json['message'] : '';
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int cRId = 0;
  String mineralName = "";
  String consigneeName= "";
  String vechicle= "";
  String unit= "";
  String vechicleRegistration= "";
  String driverMobileNo= "";
  String driverName= "";
  String tareWeight= "";
  String grossWeight= "";
  String totalWeight= "";
  String rawannastatus= "";
  String ERawannaNo = "";

  Data(
      this.cRId,
        this.mineralName,
        this.consigneeName,
        this.vechicle,
        this.unit,
        this.vechicleRegistration,
        this.driverMobileNo,
        this.driverName,
        this.tareWeight,
        this.grossWeight,
        this.totalWeight,
        this.rawannastatus,this.ERawannaNo);

  Data.fromJson(Map<String, dynamic> json) {
    cRId = json['CRId']!= null ? json['CRId'] : 0;
    mineralName = json['MineralName']!= null ? json['MineralName'] : '';
    consigneeName = json['ConsigneeName']!= null ? json['ConsigneeName'] : '';
    vechicle = json['Vechicle']!= null ? json['Vechicle'] : '';
    unit = json['Unit']!= null ? json['Unit'] : '';
    vechicleRegistration = json['VechicleRegistration']!= null ? json['VechicleRegistration'] : '';
    driverMobileNo = json['DriverMobileNo']!= null ? json['DriverMobileNo'] : '';
    driverName = json['DriverName']!= null ? json['DriverName'] : '';
    tareWeight = json['TareWeight']!= null ? json['TareWeight'] : '';
    grossWeight = json['GrossWeight']!= null ? json['GrossWeight'] : '';
    totalWeight = json['TotalWeight']!= null ? json['TotalWeight'] : '';
    rawannastatus = json['Rawannastatus']!= null ? json['Rawannastatus'] : '';
    ERawannaNo = json['ERawannaNo']!= null ? json['ERawannaNo'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CRId'] = this.cRId;
    data['MineralName'] = this.mineralName;
    data['ConsigneeName'] = this.consigneeName;
    data['Vechicle'] = this.vechicle;
    data['Unit'] = this.unit;
    data['VechicleRegistration'] = this.vechicleRegistration;
    data['DriverMobileNo'] = this.driverMobileNo;
    data['DriverName'] = this.driverName;
    data['TareWeight'] = this.tareWeight;
    data['GrossWeight'] = this.grossWeight;
    data['TotalWeight'] = this.totalWeight;
    data['Rawannastatus'] = this.rawannastatus;
    data['ERawannaNo'] = this.ERawannaNo;
    return data;
  }
}