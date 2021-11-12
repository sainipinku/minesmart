class CompanyProfileModel {
  String success= "";
  String message = "";
  List<Data> data = [];

  CompanyProfileModel(this.success, this.message, this.data);

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
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
  int cOMPANYID = 0;
  String cOMPANYNAME = "";
  String aDDRESS = "";
  String cITY = "";
  String sTATE = "";
  String mOBILE = "";
  String eMAIL = "";
  String gSTNO = "";
  String pANCARD = "";

  Data(
      this.cOMPANYID,
        this.cOMPANYNAME,
        this.aDDRESS,
        this.cITY,
        this.sTATE,
        this.mOBILE,
        this.eMAIL,
        this.gSTNO,
        this.pANCARD);

  Data.fromJson(Map<String, dynamic> json) {
    cOMPANYID = json['COMPANYID']!= null ? json['COMPANYID']: 0;
    cOMPANYNAME = json['COMPANYNAME']!= null ? json['COMPANYNAME'] : '';
    aDDRESS = json['ADDRESS']!= null ? json['ADDRESS'] : '';
    cITY = json['CITY']!= null ? json['CITY'] : '';
    sTATE = json['STATE']!= null ? json['STATE'] : '';
    mOBILE = json['MOBILE']!= null ? json['MOBILE'] : '';
    eMAIL = json['EMAIL']!= null ? json['EMAIL'] : '';
    gSTNO = json['GSTNO']!= null ? json['GSTNO'] : '';
    pANCARD = json['PANCARD']!= null ? json['PANCARD'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COMPANYID'] = this.cOMPANYID;
    data['COMPANYNAME'] = this.cOMPANYNAME;
    data['ADDRESS'] = this.aDDRESS;
    data['CITY'] = this.cITY;
    data['STATE'] = this.sTATE;
    data['MOBILE'] = this.mOBILE;
    data['EMAIL'] = this.eMAIL;
    data['GSTNO'] = this.gSTNO;
    data['PANCARD'] = this.pANCARD;
    return data;
  }
}