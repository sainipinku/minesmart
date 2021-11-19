class TPassModel {
  String success = "";
  String message = "";
  List<Data> data = [];

  TPassModel(this.success, this.message, this.data);

  TPassModel.fromJson(Map<String, dynamic> json) {
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
  int cTRID = 0;
  String sSOID = "";
  String rAWANNADATE = "";
  String dEALERNAME = "";
  String lOCATION = "";
  String mINERALFORMATIOR = "";
  String cONSIGNEENAME = "";
  String cONSIGNEEADDRESS = "";
  String cONSIGNEEGSTNO = "";
  String vECHICLEREGISTRATION = "";
  String dRIVERMOBILENO = "";
  String dRIVERNAME = "";
  String tOTALWEIGHT = "";
  String tAREWEIGHT = "";
  String gROSSWEIGHT = "";
  String tRANSITPASSNUMBER = "";
  String mESSAGEDISCRIPTION = "";
  String rawannastatus = "";

  Data(
      this.cTRID,
        this.sSOID,
        this.rAWANNADATE,
        this.dEALERNAME,
        this.lOCATION,
        this.mINERALFORMATIOR,
        this.cONSIGNEENAME,
        this.cONSIGNEEADDRESS,
        this.cONSIGNEEGSTNO,
        this.vECHICLEREGISTRATION,
        this.dRIVERMOBILENO,
        this.dRIVERNAME,
        this.tOTALWEIGHT,
        this.tAREWEIGHT,
        this.gROSSWEIGHT,
        this.tRANSITPASSNUMBER,
        this.mESSAGEDISCRIPTION,
        this.rawannastatus);

  Data.fromJson(Map<String, dynamic> json) {
    cTRID = json['CTRID']!= null ? json['CTRID'] : 0;
    sSOID = json['SSOID']!= null ? json['SSOID'] : '';
    rAWANNADATE = json['RAWANNADATE']!= null ? json['RAWANNADATE'] : '';
    dEALERNAME = json['DEALERNAME']!= null ? json['DEALERNAME'] : '';
    lOCATION = json['LOCATION']!= null ? json['LOCATION'] : '';
    mINERALFORMATIOR = json['MINERALFORMATIOR']!= null ? json['MINERALFORMATIOR'] : '';
    cONSIGNEENAME = json['CONSIGNEENAME']!= null ? json['CONSIGNEENAME'] : '';
    cONSIGNEEADDRESS = json['CONSIGNEEADDRESS']!= null ? json['CONSIGNEEADDRESS'] : '';
    cONSIGNEEGSTNO = json['CONSIGNEEGSTNO']!= null ? json['CONSIGNEEGSTNO'] : '';
    vECHICLEREGISTRATION = json['VECHICLEREGISTRATION']!= null ? json['VECHICLEREGISTRATION'] : '';
    dRIVERMOBILENO = json['DRIVERMOBILENO']!= null ? json['DRIVERMOBILENO'] : '';
    dRIVERNAME = json['DRIVERNAME']!= null ? json['DRIVERNAME'] : '';
    tOTALWEIGHT = json['TOTALWEIGHT']!= null ? json['TOTALWEIGHT'] : '';
    tAREWEIGHT = json['TAREWEIGHT']!= null ? json['TAREWEIGHT'] : '';
    gROSSWEIGHT = json['GROSSWEIGHT']!= null ? json['GROSSWEIGHT'] : '';
    tRANSITPASSNUMBER = json['TRANSITPASSNUMBER']!= null ? json['TRANSITPASSNUMBER'] : '';
    mESSAGEDISCRIPTION = json['MESSAGEDISCRIPTION']!= null ? json['MESSAGEDISCRIPTION'] : '';
    rawannastatus = json['Rawannastatus']!= null ? json['Rawannastatus'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CTRID'] = this.cTRID;
    data['SSOID'] = this.sSOID;
    data['RAWANNADATE'] = this.rAWANNADATE;
    data['DEALERNAME'] = this.dEALERNAME;
    data['LOCATION'] = this.lOCATION;
    data['MINERALFORMATIOR'] = this.mINERALFORMATIOR;
    data['CONSIGNEENAME'] = this.cONSIGNEENAME;
    data['CONSIGNEEADDRESS'] = this.cONSIGNEEADDRESS;
    data['CONSIGNEEGSTNO'] = this.cONSIGNEEGSTNO;
    data['VECHICLEREGISTRATION'] = this.vECHICLEREGISTRATION;
    data['DRIVERMOBILENO'] = this.dRIVERMOBILENO;
    data['DRIVERNAME'] = this.dRIVERNAME;
    data['TOTALWEIGHT'] = this.tOTALWEIGHT;
    data['TAREWEIGHT'] = this.tAREWEIGHT;
    data['GROSSWEIGHT'] = this.gROSSWEIGHT;
    data['TRANSITPASSNUMBER'] = this.tRANSITPASSNUMBER;
    data['MESSAGEDISCRIPTION'] = this.mESSAGEDISCRIPTION;
    data['Rawannastatus'] = this.rawannastatus;
    return data;
  }
}