class TPassFiltterModel {
  String success = "";
  String message = "";
  Data? data;

  TPassFiltterModel(this.success, this.message, this.data);

  TPassFiltterModel.fromJson(Map<String, dynamic> json) {
    success = json['success']!= null ? json['success'] : '';
    message = json['message']!= null ? json['message'] : '';
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Table> table = [];
  List<Table1> table1 = [];
  List<Table2> table2 = [];
  List<Table3> table3 = [];
  List<Table4> table4 = [];
  List<Table5> table5 = [];
  List<Table6> table6 = [];
  List<Table7> table7 = [];

  Data(
      this.table,
        this.table1,
        this.table2,
        this.table3,
        this.table4,
        this.table5,
        this.table6,
        this.table7);

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Table>[];
      json['Table'].forEach((v) {
        table.add(new Table.fromJson(v));
      });
    }
    if (json['Table1'] != null) {
      table1 = <Table1>[];
      json['Table1'].forEach((v) {
        table1.add(new Table1.fromJson(v));
      });
    }
    if (json['Table2'] != null) {
      table2 = <Table2>[];
      json['Table2'].forEach((v) {
        table2.add(new Table2.fromJson(v));
      });
    }
    if (json['Table3'] != null) {
      table3 = <Table3>[];
      json['Table3'].forEach((v) {
        table3.add(new Table3.fromJson(v));
      });
    }
    if (json['Table4'] != null) {
      table4 = <Table4>[];
      json['Table4'].forEach((v) {
        table4.add(new Table4.fromJson(v));
      });
    }
    if (json['Table5'] != null) {
      table5 = <Table5>[];
      json['Table5'].forEach((v) {
        table5.add(new Table5.fromJson(v));
      });
    }
    if (json['Table6'] != null) {
      table6 = <Table6>[];
      json['Table6'].forEach((v) {
        table6.add(new Table6.fromJson(v));
      });
    }
    if (json['Table7'] != null) {
      table7 = <Table7>[];
      json['Table7'].forEach((v) {
        table7.add(new Table7.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['Table'] = this.table.map((v) => v.toJson()).toList();
    }
    if (this.table1 != null) {
      data['Table1'] = this.table1.map((v) => v.toJson()).toList();
    }
    if (this.table2 != null) {
      data['Table2'] = this.table2.map((v) => v.toJson()).toList();
    }
    if (this.table3 != null) {
      data['Table3'] = this.table3.map((v) => v.toJson()).toList();
    }
    if (this.table4 != null) {
      data['Table4'] = this.table4.map((v) => v.toJson()).toList();
    }
    if (this.table5 != null) {
      data['Table5'] = this.table5.map((v) => v.toJson()).toList();
    }
    if (this.table6 != null) {
      data['Table6'] = this.table6.map((v) => v.toJson()).toList();
    }
    if (this.table7 != null) {
      data['Table7'] = this.table7.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  String dEALERNAME = "";

  Table(this.dEALERNAME);

  Table.fromJson(Map<String, dynamic> json) {
    dEALERNAME = json['DEALERNAME']!= null ? json['DEALERNAME'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DEALERNAME'] = this.dEALERNAME;
    return data;
  }
}

class Table1 {
  String mINERALFORMATIOR = "";

  Table1(this.mINERALFORMATIOR);

  Table1.fromJson(Map<String, dynamic> json) {
    mINERALFORMATIOR = json['MINERALFORMATIOR']!= null ? json['MINERALFORMATIOR'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MINERALFORMATIOR'] = this.mINERALFORMATIOR;
    return data;
  }
}

class Table2 {
  String cONSIGNEENAME = "";

  Table2(this.cONSIGNEENAME);

  Table2.fromJson(Map<String, dynamic> json) {
    cONSIGNEENAME = json['CONSIGNEENAME']!= null ? json['CONSIGNEENAME'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CONSIGNEENAME'] = this.cONSIGNEENAME;
    return data;
  }
}

class Table3 {
  String vECHICLEREGISTRATION = "";

  Table3(this.vECHICLEREGISTRATION);

  Table3.fromJson(Map<String, dynamic> json) {
    vECHICLEREGISTRATION = json['VECHICLEREGISTRATION']!= null ? json['VECHICLEREGISTRATION'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VECHICLEREGISTRATION'] = this.vECHICLEREGISTRATION;
    return data;
  }
}

class Table4 {
  String dRIVERMOBILENO = "";

  Table4(this.dRIVERMOBILENO);

  Table4.fromJson(Map<String, dynamic> json) {
    dRIVERMOBILENO = json['DRIVERMOBILENO']!= null ? json['DRIVERMOBILENO'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DRIVERMOBILENO'] = this.dRIVERMOBILENO;
    return data;
  }
}

class Table5 {
  String dRIVERNAME ="";

  Table5(this.dRIVERNAME);

  Table5.fromJson(Map<String, dynamic> json) {
    dRIVERNAME = json['DRIVERNAME']!= null ? json['DRIVERNAME'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DRIVERNAME'] = this.dRIVERNAME;
    return data;
  }
}

class Table6 {
  String tRANSITPASSNUMBER ="";

  Table6(this.tRANSITPASSNUMBER);

  Table6.fromJson(Map<String, dynamic> json) {
    tRANSITPASSNUMBER = json['TRANSITPASSNUMBER']!= null ? json['TRANSITPASSNUMBER'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TRANSITPASSNUMBER'] = this.tRANSITPASSNUMBER;
    return data;
  }
}

class Table7 {
  String tPASSSTATUS ="";

  Table7(this.tPASSSTATUS);

  Table7.fromJson(Map<String, dynamic> json) {
    tPASSSTATUS = json['TPASSSTATUS']!= null ? json['TPASSSTATUS'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TPASSSTATUS'] = this.tPASSSTATUS;
    return data;
  }
}