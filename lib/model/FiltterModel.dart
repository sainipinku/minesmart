class FiltterModel {
  String success = "";
  String message = "";
  Data? data;

  FiltterModel(this.success, this.message, this.data);

  FiltterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
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
  List<Table1> table1= [];
  List<Table2> table2= [];
  List<Table3> table3= [];
  List<Table4> table4= [];
  List<Table5> table5= [];
  List<Table6> table6= [];

  Data(
      this.table,
        this.table1,
        this.table2,
        this.table3,
        this.table4,
        this.table5,
        this.table6);

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
    return data;
  }
}

class Table {
  String mINERALNAME = "";

  Table(this.mINERALNAME);

  Table.fromJson(Map<String, dynamic> json) {
    mINERALNAME = json['MINERALNAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MINERALNAME'] = this.mINERALNAME;
    return data;
  }
}

class Table1 {
  String cONSIGNEENAME = "";

  Table1(this.cONSIGNEENAME);

  Table1.fromJson(Map<String, dynamic> json) {
    cONSIGNEENAME = json['CONSIGNEENAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CONSIGNEENAME'] = this.cONSIGNEENAME;
    return data;
  }
}

class Table2 {
  String vECHICLEREGISTRATION ="";

  Table2(this.vECHICLEREGISTRATION);

  Table2.fromJson(Map<String, dynamic> json) {
    vECHICLEREGISTRATION = json['VECHICLEREGISTRATION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VECHICLEREGISTRATION'] = this.vECHICLEREGISTRATION;
    return data;
  }
}

class Table3 {
  String dRIVERMOBILENO ="";

  Table3(this.dRIVERMOBILENO);

  Table3.fromJson(Map<String, dynamic> json) {
    dRIVERMOBILENO = json['DRIVERMOBILENO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DRIVERMOBILENO'] = this.dRIVERMOBILENO;
    return data;
  }
}

class Table4 {
  String dRIVERNAME="";

  Table4(this.dRIVERNAME);

  Table4.fromJson(Map<String, dynamic> json) {
    dRIVERNAME = json['DRIVERNAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DRIVERNAME'] = this.dRIVERNAME;
    return data;
  }
}

class Table5 {
  String eRAWANNANO="";

  Table5(this.eRAWANNANO);

  Table5.fromJson(Map<String, dynamic> json) {
    eRAWANNANO = json['ERAWANNANO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ERAWANNANO'] = this.eRAWANNANO;
    return data;
  }
}

class Table6 {
  String rAWANNASTATUS ="";

  Table6(this.rAWANNASTATUS);

  Table6.fromJson(Map<String, dynamic> json) {
    rAWANNASTATUS = json['RAWANNASTATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RAWANNASTATUS'] = this.rAWANNASTATUS;
    return data;
  }
}