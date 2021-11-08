/*
class UserData {
  int UserId= 0;
  String SsoId ="";
  String WeighBridgeNo ="";
  UserData();

  UserData.fromJSON(Map<String, dynamic>jsonMap) {
    try {
      UserId =jsonMap['UserId']!= null ? jsonMap['UserId'] : 0 ;
      SsoId =jsonMap['SsoId']!= null ? jsonMap['SsoId'] : '';
      WeighBridgeNo =jsonMap['WeighBridgeNo']!= null ? jsonMap['WeighBridgeNo'] : '';

    } catch (e) {
      print(e) ;
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>() ;
    map['UserId'] = this.UserId;
    map['SsoId'] = this.SsoId;
    map['WeighBridgeNo'] = this.WeighBridgeNo;
    return map;
  }

}*/
class UserData {
  String success ="";
  String message = "";
  List<Data> data = [];
  UserData();
  UserData.fromJson(Map<String, dynamic> json) {
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
  int userId = 0;
  String ssoId = "";
  String weighBridgeNo = "";
  Data();
  Data.fromJson(Map<String, dynamic> json) {
    userId = json['UserId']!= null ? json['UserId'] : 0;
    ssoId = json['SsoId']!= null ? json['SsoId'] : '';
    weighBridgeNo = json['WeighBridgeNo']!= null ? json['WeighBridgeNo'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['SsoId'] = this.ssoId;
    data['WeighBridgeNo'] = this.weighBridgeNo;
    return data;
  }
}