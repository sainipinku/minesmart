
class UserData {
  int id= 0;
  String name ="";
  String deviceToken ="";
  String lastname ="";
  String email ="";
  String password ="";
  String cn_password ="";
  String gender ="";
  int mobileno =0;
  String address ="";
  String usertype ="";
  String emailVerifiedAt ="";
  String rememberToken ="";
  int status =0;
  String createdAt ="";
  int createdby =0;
  String updatedAt ="";
  int modifiedby =0;
  int mobileVerified =0;
  int emailVerified =0;
  int authType =0;
  int isVerified =0;
  String profileImage ="";
  String dob ="";
  int userinfoconfirm =0;
  int unitId =0;
  String profilepic ="";
  String stripeCustomerId ="";
  String vctoken="";

  UserData();

  UserData.fromJSON(Map<String, dynamic>jsonMap) {
    try {
      gender =jsonMap['gender']!= null ? jsonMap['gender'] : '';
      id =jsonMap['id']!= null ? jsonMap['id'] : 0 ;
      name =jsonMap['name']!= null ? jsonMap['name'] : '';
      lastname =jsonMap['lastname']!= null ? jsonMap['lastname'] : '';
      email =jsonMap['email']!= null ? jsonMap['email'] : '';
      mobileno =jsonMap['mobileno']!= null ? jsonMap['mobileno'] : 0;
      address =jsonMap['address']!= null ? jsonMap['address'] : '';
      usertype =jsonMap['usertype']!= null ? jsonMap['usertype'] : '';
      emailVerifiedAt =jsonMap['email_verified_at']!= null ? jsonMap['email_verified_at'] : '';
      password =jsonMap['password']!= null ? jsonMap['password'] : '';
      rememberToken =jsonMap['remember_token']!= null ? jsonMap['remember_token'] : '';
      status =jsonMap['status']!= null ? jsonMap['status'] : 0;
      createdAt =jsonMap['created_at']!= null ? jsonMap['created_at'] : '';
      deviceToken =jsonMap['device_token']!= null ? jsonMap['device_token'] : '';
      createdby =jsonMap['createdby']!= null ? jsonMap['createdby'] : 0;
      updatedAt =jsonMap['updated_at']!= null ? jsonMap['updated_at'] : '';
      modifiedby =jsonMap['modifiedby']!= null ? jsonMap['modifiedby'] : 0;
      mobileVerified =jsonMap['mobileVerified']!= null ? jsonMap['mobileVerified'] :0;
      emailVerified =jsonMap['emailVerified']!= null ? jsonMap['emailVerified'] : 0;
      authType =jsonMap['auth_type']!= null ? jsonMap['auth_type'] : 0;
      isVerified =jsonMap['isVerified']!= null ? jsonMap['isVerified'] : 0;
      profileImage =jsonMap['profile_image']!= null ? jsonMap['profile_image'] : '';
      dob =jsonMap['dob']!= null ? jsonMap['dob'] : '';
      userinfoconfirm =jsonMap['userinfoconfirm']!= null ? jsonMap['userinfoconfirm'] : 0;
      unitId =jsonMap['unit_id']!= null ? jsonMap['unit_id'] : 0;
      profilepic =jsonMap['profilepic']!= null ? jsonMap['profilepic'] : '';
      stripeCustomerId =jsonMap['stripe_customer_id']!= null ? jsonMap['stripe_customer_id'] : '';
      vctoken =jsonMap['vctoken']!= null ? jsonMap['vctoken'] : '';


    } catch (e) {
      print(e) ;
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>() ;

    map['gender'] = this.gender;
    map['id'] = this.id;
    map['name'] = this.name;
    map['lastname'] = this.lastname;
    map['email'] = this.email;
    map['mobileno'] = this.mobileno;
    map['address'] = this.address;
    map['usertype'] = this.usertype;
    map['email_verified_at'] = this.emailVerifiedAt;
    map['password'] = this.password;
    map['remember_token'] = this.rememberToken;
    map['status'] = this.status;
    map['created_at'] = this.createdAt;
    map['device_token'] = this.deviceToken;
    map['createdby'] = this.createdby ;
    map['updated_at'] = this.updatedAt ;
    map['modifiedby'] = this.modifiedby ;
    map['mobileVerified'] = this.mobileVerified ;
    map['emailVerified'] = this.emailVerified;
    map['auth_type'] = this.authType ;
    map['isVerified'] = this.isVerified ;
    map['profile_image'] = this.profileImage;
    map['dob'] = this.dob ;
    map['userinfoconfirm'] = this.userinfoconfirm;
    map['unit_id'] = this.unitId ;
    map['profilepic'] = this.profilepic;
    map['stripe_customer_id'] = this.stripeCustomerId;
    map['vctoken'] = this.vctoken;

    return map;
  }

/*@override
  String toString() {
    var map = this.toMap() ="";
    map["auth"] = this.auth ="";
    return map.toString() ="";
  }*/
}
