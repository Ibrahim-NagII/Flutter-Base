import 'package:flutter_base/network/mapper.dart';
import 'package:flutter_base/utility/utility.dart';

class UserModel extends SingleMapper {
  String? accessToken;
  int? expiresIn;
  GSettings? gSettings;
  int? agentId;
  String? firstName;
  String? userId;
  String? middleName;
  String? lastName;
  String? scope;
  String? message;
  UserData? userData;
  Permissions? permissions;

  UserModel(
      {this.accessToken,
      this.expiresIn,
      this.gSettings,
      this.agentId,
      this.firstName,
      this.middleName,
      this.userId,
      this.lastName,
      this.message,
      this.scope,
      this.permissions,
      this.userData});

  @override
  Mapper fromJson(Map<String, dynamic> json) {
    cprint(json["user_data"]);
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    message = json['message'];
    gSettings = json['g_settings'] != null
        ? GSettings.fromJson(json['g_settings'])
        : null;
    agentId = json['agent_id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    scope = json['scope'];
    userData =
        json["user_data"] != null ? UserData.fromJson(json["user_data"]) : null;
    permissions = json["permissions"] != null
        ? Permissions.fromJson(json["permissions"])
        : null;
    return UserModel(
        accessToken: accessToken,
        expiresIn: expiresIn,
        scope: scope,
        firstName: firstName,
        message: message,
        middleName: middleName,
        lastName: lastName,
        agentId: agentId,
        userId: userId,
        gSettings: gSettings,
        permissions: permissions,
        userData: userData);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    if (gSettings != null) {
      data['g_settings'] = gSettings!.toJson();
    }
    data['agent_id'] = agentId;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['scope'] = scope;
    data['user_id'] = userId;
    data["user_data"] = userData;
    data["permissions"] = permissions;
    return data;
  }
}

class GSettings {
  String? id;
  String? companyName;
  String? companyType;
  String? email;
  String? currency;
  String? phone;
  String? physicalAddress;
  String? postalAddress;
  String? websiteUrl;
  String? postalCode;
  String? logo;
  dynamic favicon;
  String? dateFormat;
  String? amountThousandSeparator;
  String? amountDecimalSeparator;
  String? amountDecimal;
  String? theme;
  dynamic language;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  GSettings(
      {this.id,
      this.companyName,
      this.companyType,
      this.email,
      this.currency,
      this.phone,
      this.physicalAddress,
      this.postalAddress,
      this.websiteUrl,
      this.postalCode,
      this.logo,
      this.favicon,
      this.dateFormat,
      this.amountThousandSeparator,
      this.amountDecimalSeparator,
      this.amountDecimal,
      this.theme,
      this.language,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  GSettings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyType = json['company_type'];
    email = json['email'];
    currency = json['currency'];
    phone = json['phone'];
    physicalAddress = json['physical_address'];
    postalAddress = json['postal_address'];
    websiteUrl = json['website_url'];
    postalCode = json['postal_code'];
    logo = json['logo'];
    favicon = json['favicon'];
    dateFormat = json['date_format'];
    amountThousandSeparator = json['amount_thousand_separator'];
    amountDecimalSeparator = json['amount_decimal_separator'];
    amountDecimal = json['amount_decimal'];
    theme = json['theme'];
    language = json['language'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_type'] = companyType;
    data['email'] = email;
    data['currency'] = currency;
    data['phone'] = phone;
    data['physical_address'] = physicalAddress;
    data['postal_address'] = postalAddress;
    data['website_url'] = websiteUrl;
    data['postal_code'] = postalCode;
    data['logo'] = logo;
    data['favicon'] = favicon;
    data['date_format'] = dateFormat;
    data['amount_thousand_separator'] = amountThousandSeparator;
    data['amount_decimal_separator'] = amountDecimalSeparator;
    data['amount_decimal'] = amountDecimal;
    data['theme'] = theme;
    data['language'] = language;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserData {
  UserData({
    this.id,
    this.agentId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.phone,
    this.email,
    this.registrationDate,
    this.idNumber,
    this.city,
    this.state,
    this.country,
    this.postalAddress,
    this.physicalAddress,
    this.residentialAddress,
    this.confirmed,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.rememberToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.nationalEstablishmentNo,
    this.representative,
    this.representativeId,
  });

  String? id;
  dynamic agentId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? phone;
  String? email;
  String? registrationDate;
  String? idNumber;
  String? city;
  String? state;
  String? country;
  String? postalAddress;
  String? physicalAddress;
  String? residentialAddress;
  int? confirmed;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  dynamic rememberToken;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? nationalEstablishmentNo;
  String? representative;
  String? representativeId;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    registrationDate = json['registration_date'];
    idNumber = json['id_number'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalAddress = json['postal_address'];
    physicalAddress = json['physical_address'];
    residentialAddress = json['residential_address'];
    confirmed = json['confirmed'];
    createdBy = json['created_by'];
    updatedBy = json['created_by'];
    deletedBy = json['deleted_by'];
    rememberToken = json['remember_token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nationalEstablishmentNo = json['national_establishment_no'];
    representative = json['representative'];
    representativeId = json['representative_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['agent_id'] = agentId;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['registration_date'] = registrationDate;
    data['id_number'] = idNumber;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_address'] = postalAddress;
    data['physical_address'] = physicalAddress;
    data['residential_address'] = residentialAddress;
    data['confirmed'] = confirmed;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['remember_token'] = rememberToken;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['national_establishment_no'] = nationalEstablishmentNo;
    data['representative'] = representative;
    data['representative_id'] = representativeId;
    return data;
  }
}

class Permissions {
  bool? editTenant;
  bool? cancelPayment;
  bool? approvePayment;
  bool? editLandlord;
  bool? manageSetting;
  bool? editProperty;
  bool? viewNotice;
  bool? viewInvoice;
  bool? createProperty;
  bool? createReading;
  bool? terminateLease;
  bool? createPayment;
  bool? editLease;
  bool? deleteLease;
  bool? deleteTenant;
  bool? viewPayment;
  bool? editProfile;
  bool? viewTenant;
  bool? deleteNotice;
  bool? viewReport;
  bool? createLandlord;
  bool? createTenant;
  bool? deleteProperty;
  bool? viewLease;
  bool? viewProperty;
  bool? createNotice;
  bool? waiveInvoice;
  bool? createLease;
  bool? deleteLandlord;
  bool? editReading;
  bool? viewReading;
  bool? editNotice;
  bool? deleteReading;
  bool? viewLandlord;

  Permissions(
      {this.editTenant,
      this.cancelPayment,
      this.approvePayment,
      this.editLandlord,
      this.manageSetting,
      this.editProperty,
      this.viewNotice,
      this.viewInvoice,
      this.createProperty,
      this.createReading,
      this.terminateLease,
      this.createPayment,
      this.editLease,
      this.deleteLease,
      this.deleteTenant,
      this.viewPayment,
      this.editProfile,
      this.viewTenant,
      this.deleteNotice,
      this.viewReport,
      this.createLandlord,
      this.createTenant,
      this.deleteProperty,
      this.viewLease,
      this.viewProperty,
      this.createNotice,
      this.waiveInvoice,
      this.createLease,
      this.deleteLandlord,
      this.editReading,
      this.viewReading,
      this.editNotice,
      this.deleteReading,
      this.viewLandlord});

  Permissions.fromJson(Map<String, dynamic> json) {
    editTenant = json['edit-tenant'] ?? false;
    cancelPayment = json['cancel-payment'] ?? false;
    approvePayment = json['approve-payment'] ?? false;
    editLandlord = json['edit-landlord'] ?? false;
    manageSetting = json['manage-setting'] ?? false;
    editProperty = json['edit-property'] ?? false;
    viewNotice = json['view-notice'] ?? false;
    viewInvoice = json['view-invoice'] ?? false;
    createProperty = json['create-property'] ?? false;
    createReading = json['create-reading'] ?? false;
    terminateLease = json['terminate-lease'] ?? false;
    createPayment = json['create-payment'] ?? false;
    editLease = json['edit-lease'] ?? false;
    deleteLease = json['delete-lease'] ?? false;
    deleteTenant = json['delete-tenant'] ?? false;
    viewPayment = json['view-payment'] ?? false;
    editProfile = json['edit-profile'] ?? false;
    viewTenant = json['view-tenant'] ?? false;
    deleteNotice = json['delete-notice'] ?? false;
    viewReport = json['view-report'] ?? false;
    createLandlord = json['create-landlord'] ?? false;
    createTenant = json['create-tenant'] ?? false;
    deleteProperty = json['delete-property'] ?? false;
    viewLease = json['view-lease'] ?? false;
    viewProperty = json['view-property'] ?? false;
    createNotice = json['create-notice'] ?? false;
    waiveInvoice = json['waive-invoice'] ?? false;
    createLease = json['create-lease'] ?? false;
    deleteLandlord = json['delete-landlord'] ?? false;
    editReading = json['edit-reading'] ?? false;
    viewReading = json['view-reading'] ?? false;
    editNotice = json['edit-notice'] ?? false;
    deleteReading = json['delete-reading'] ?? false;
    viewLandlord = json['view-landlord'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['edit-tenant'] = editTenant;
    data['cancel-payment'] = cancelPayment;
    data['approve-payment'] = approvePayment;
    data['edit-landlord'] = editLandlord;
    data['manage-setting'] = manageSetting;
    data['edit-property'] = editProperty;
    data['view-notice'] = viewNotice;
    data['view-invoice'] = viewInvoice;
    data['create-property'] = createProperty;
    data['create-reading'] = createReading;
    data['terminate-lease'] = terminateLease;
    data['create-payment'] = createPayment;
    data['edit-lease'] = editLease;
    data['delete-lease'] = deleteLease;
    data['delete-tenant'] = deleteTenant;
    data['view-payment'] = viewPayment;
    data['edit-profile'] = editProfile;
    data['view-tenant'] = viewTenant;
    data['delete-notice'] = deleteNotice;
    data['view-report'] = viewReport;
    data['create-landlord'] = createLandlord;
    data['create-tenant'] = createTenant;
    data['delete-property'] = deleteProperty;
    data['view-lease'] = viewLease;
    data['view-property'] = viewProperty;
    data['create-notice'] = createNotice;
    data['waive-invoice'] = waiveInvoice;
    data['create-lease'] = createLease;
    data['delete-landlord'] = deleteLandlord;
    data['edit-reading'] = editReading;
    data['view-reading'] = viewReading;
    data['edit-notice'] = editNotice;
    data['delete-reading'] = deleteReading;
    data['view-landlord'] = viewLandlord;
    return data;
  }
}
