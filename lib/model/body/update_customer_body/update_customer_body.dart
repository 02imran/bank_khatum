
//{
//     "Msisdn": "85516666777",
//     "FirstName": "md",
//     "LastName": "imran",
//     "Email": "example@gmail.com",
//     "IdNumber": "1111111111111111",
//     "IdType": "3",
//     "IdExpiryDate": "2023-06-26",
//     "Gender": "M",
//     "Dob": "2004-06-27",
//     "Nationality": "Cambodian",
//     "PermanentDistrict": "Chhloung",
//     "PermanentCity": "Banteay Meanchey",
//     "CustomerMsisdn": "85588665713",
//     "Pin": "1478",
//     "frontIdImage": "",
//     "backIdImage": ""
// }


class KycUpdateBody {
  String? msisdn;
  String? firstName;
  String? lastName;
  String? email;
  String? idNumber;
  String? idType;
  String? idExpiryDate;
  String? gender;
  String? dob;
  String? nationality;
  String? permanentDistrict;
  String? permanentCity;
  String? customerMsisdn;
  String? pin;

  KycUpdateBody(
      {this.msisdn,
        this.firstName,
        this.lastName,
        this.email,
        this.idNumber,
        this.idType,
        this.idExpiryDate,
        this.gender,
        this.dob,
        this.nationality,
        this.permanentDistrict,
        this.permanentCity,
        this.customerMsisdn,
        this.pin,
        });

  KycUpdateBody.fromJson(Map<String, dynamic> json) {
    msisdn = json['Msisdn'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    idNumber = json['IdNumber'];
    idType = json['IdType'];
    idExpiryDate = json['IdExpiryDate'];
    gender = json['Gender'];
    dob = json['Dob'];
    nationality = json['Nationality'];
    permanentDistrict = json['PermanentDistrict'];
    permanentCity = json['PermanentCity'];
    customerMsisdn = json['CustomerMsisdn'];
    pin = json['Pin'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msisdn'] = this.msisdn;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['IdNumber'] = this.idNumber;
    data['IdType'] = this.idType;
    data['IdExpiryDate'] = this.idExpiryDate;
    data['Gender'] = this.gender;
    data['Dob'] = this.dob;
    data['Nationality'] = this.nationality;
    data['PermanentDistrict'] = this.permanentDistrict;
    data['PermanentCity'] = this.permanentCity;
    data['CustomerMsisdn'] = this.customerMsisdn;
    data['Pin'] = this.pin;
    return data;
  }
}