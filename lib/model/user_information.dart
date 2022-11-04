class UserInformation {
  String? userID;
  String? email;
  dynamic profilePictureUrl;
  bool? isLocked;
  String? userType;
  int? passwordRecoveryCode;
  String? createDate;
  dynamic updateDate;
  bool? notificationsEnabled;
  List<ProfileDetails>? profileDetails;
  dynamic projects;
  dynamic truoraCheckId;
  dynamic truoraCheckScore;
  dynamic truoraPdf;
  dynamic truoraCheckDate;
  String? emailConfirmationCode;
  bool? emailConfirmed;
  dynamic emailConfirmationDate;
  bool? termsAndConditionsAccepted;
  String? termsAndConditionsAcceptedDate;
  String? activeCampaignContactId;
  String? activeCampaignDealId;
  int? activeCampaignDealStatus;
  String? activeCampaignDealStage;
  dynamic balance;
  String? pageCreatedFrom;
  dynamic arrivalChannel;
  dynamic siigoCustomerID;
  dynamic siigoCustomerStatus;
  dynamic siigoCustomerStatusMessage;

  UserInformation(
      {this.userID,
      this.email,
      this.profilePictureUrl,
      this.isLocked,
      this.userType,
      this.passwordRecoveryCode,
      this.createDate,
      this.updateDate,
      this.notificationsEnabled,
      this.profileDetails,
      this.projects,
      this.truoraCheckId,
      this.truoraCheckScore,
      this.truoraPdf,
      this.truoraCheckDate,
      this.emailConfirmationCode,
      this.emailConfirmed,
      this.emailConfirmationDate,
      this.termsAndConditionsAccepted,
      this.termsAndConditionsAcceptedDate,
      this.activeCampaignContactId,
      this.activeCampaignDealId,
      this.activeCampaignDealStatus,
      this.activeCampaignDealStage,
      this.balance,
      this.pageCreatedFrom,
      this.arrivalChannel,
      this.siigoCustomerID,
      this.siigoCustomerStatus,
      this.siigoCustomerStatusMessage});

  UserInformation.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    email = json['email'];
    profilePictureUrl = json['profilePictureUrl'];
    isLocked = json['isLocked'];
    userType = json['userType'];
    passwordRecoveryCode = json['passwordRecoveryCode'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    notificationsEnabled = json['notificationsEnabled'];
    if (json['profileDetails'] != null) {
      profileDetails = <ProfileDetails>[];
      json['profileDetails'].forEach((v) {
        profileDetails!.add(new ProfileDetails.fromJson(v));
      });
    }
    projects = json['projects'];
    truoraCheckId = json['truoraCheckId'];
    truoraCheckScore = json['truoraCheckScore'];
    truoraPdf = json['truoraPdf'];
    truoraCheckDate = json['truoraCheckDate'];
    emailConfirmationCode = json['emailConfirmationCode'];
    emailConfirmed = json['emailConfirmed'];
    emailConfirmationDate = json['emailConfirmationDate'];
    termsAndConditionsAccepted = json['termsAndConditionsAccepted'];
    termsAndConditionsAcceptedDate = json['termsAndConditionsAcceptedDate'];
    activeCampaignContactId = json['activeCampaignContactId'];
    activeCampaignDealId = json['activeCampaignDealId'];
    activeCampaignDealStatus = json['activeCampaignDealStatus'];
    activeCampaignDealStage = json['activeCampaignDealStage'];
    balance = json['balance'] ?? int.parse("0");
    pageCreatedFrom = json['pageCreatedFrom'];
    arrivalChannel = json['arrivalChannel'];
    siigoCustomerID = json['siigoCustomerID'];
    siigoCustomerStatus = json['siigoCustomerStatus'];
    siigoCustomerStatusMessage = json['siigoCustomerStatusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['email'] = this.email;
    data['profilePictureUrl'] = this.profilePictureUrl;
    data['isLocked'] = this.isLocked;
    data['userType'] = this.userType;
    data['passwordRecoveryCode'] = this.passwordRecoveryCode;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['notificationsEnabled'] = this.notificationsEnabled;
    if (this.profileDetails != null) {
      data['profileDetails'] =
          this.profileDetails!.map((v) => v.toJson()).toList();
    }
    data['projects'] = this.projects;
    data['truoraCheckId'] = this.truoraCheckId;
    data['truoraCheckScore'] = this.truoraCheckScore;
    data['truoraPdf'] = this.truoraPdf;
    data['truoraCheckDate'] = this.truoraCheckDate;
    data['emailConfirmationCode'] = this.emailConfirmationCode;
    data['emailConfirmed'] = this.emailConfirmed;
    data['emailConfirmationDate'] = this.emailConfirmationDate;
    data['termsAndConditionsAccepted'] = this.termsAndConditionsAccepted;
    data['termsAndConditionsAcceptedDate'] =
        this.termsAndConditionsAcceptedDate;
    data['activeCampaignContactId'] = this.activeCampaignContactId;
    data['activeCampaignDealId'] = this.activeCampaignDealId;
    data['activeCampaignDealStatus'] = this.activeCampaignDealStatus;
    data['activeCampaignDealStage'] = this.activeCampaignDealStage;
    data['balance'] = this.balance;
    data['pageCreatedFrom'] = this.pageCreatedFrom;
    data['arrivalChannel'] = this.arrivalChannel;
    data['siigoCustomerID'] = this.siigoCustomerID;
    data['siigoCustomerStatus'] = this.siigoCustomerStatus;
    data['siigoCustomerStatusMessage'] = this.siigoCustomerStatusMessage;
    return data;
  }
}

class ProfileDetails {
  String? profileDetailsID;
  String? userID;
  String? profileType;
  dynamic isCompany;
  String? firstName;
  String? lastName;
  dynamic companyName;
  dynamic nit;
  dynamic documentType;
  dynamic documentNumber;
  dynamic documentUrl;
  String? contactEmail;
  String? contactCellphone;
  dynamic contactPhone;
  dynamic address;
  dynamic isForeignPerson;
  dynamic state;
  dynamic city;
  dynamic country;
  dynamic birthDate;
  String? createDate;
  dynamic updateDate;
  dynamic gender;
  dynamic description;
  dynamic patrimonyAmount;
  dynamic bankAccountNumber;
  dynamic bankAccountType;
  dynamic bankAccountBank;
  dynamic bankAccountCertificationUrl;
  dynamic producerFormatUrl;
  dynamic investorFormatUrl;
  dynamic clientFormatUrl;
  dynamic rutUrl;
  dynamic chamberOfCommerceUrl;
  dynamic declaracionDeRentaUrl;
  dynamic motivationToInvest;
  dynamic phraseIdentifiesMe;
  dynamic knowledgeAboutCattleRaising;
  dynamic holdingTaxEnabled;

  ProfileDetails(
      {this.profileDetailsID,
      this.userID,
      this.profileType,
      this.isCompany,
      this.firstName,
      this.lastName,
      this.companyName,
      this.nit,
      this.documentType,
      this.documentNumber,
      this.documentUrl,
      this.contactEmail,
      this.contactCellphone,
      this.contactPhone,
      this.address,
      this.isForeignPerson,
      this.state,
      this.city,
      this.country,
      this.birthDate,
      this.createDate,
      this.updateDate,
      this.gender,
      this.description,
      this.patrimonyAmount,
      this.bankAccountNumber,
      this.bankAccountType,
      this.bankAccountBank,
      this.bankAccountCertificationUrl,
      this.producerFormatUrl,
      this.investorFormatUrl,
      this.clientFormatUrl,
      this.rutUrl,
      this.chamberOfCommerceUrl,
      this.declaracionDeRentaUrl,
      this.motivationToInvest,
      this.phraseIdentifiesMe,
      this.knowledgeAboutCattleRaising,
      this.holdingTaxEnabled});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    profileDetailsID = json['profileDetailsID'];
    userID = json['userID'];
    profileType = json['profileType'];
    isCompany = json['isCompany'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    companyName = json['companyName'];
    nit = json['nit'];
    documentType = json['documentType'];
    documentNumber = json['documentNumber'];
    documentUrl = json['documentUrl'];
    contactEmail = json['contactEmail'];
    contactCellphone = json['contactCellphone'];
    contactPhone = json['contactPhone'];
    address = json['address'];
    isForeignPerson = json['isForeignPerson'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    birthDate = json['birthDate'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    gender = json['gender'];
    description = json['description'];
    patrimonyAmount = json['patrimonyAmount'];
    bankAccountNumber = json['bankAccountNumber'];
    bankAccountType = json['bankAccountType'];
    bankAccountBank = json['bankAccountBank'];
    bankAccountCertificationUrl = json['bankAccountCertificationUrl'];
    producerFormatUrl = json['producerFormatUrl'];
    investorFormatUrl = json['investorFormatUrl'];
    clientFormatUrl = json['clientFormatUrl'];
    rutUrl = json['rutUrl'];
    chamberOfCommerceUrl = json['chamberOfCommerceUrl'];
    declaracionDeRentaUrl = json['declaracionDeRentaUrl'];
    motivationToInvest = json['motivationToInvest'];
    phraseIdentifiesMe = json['phraseIdentifiesMe'];
    knowledgeAboutCattleRaising = json['knowledgeAboutCattleRaising'];
    holdingTaxEnabled = json['holdingTaxEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profileDetailsID'] = this.profileDetailsID;
    data['userID'] = this.userID;
    data['profileType'] = this.profileType;
    data['isCompany'] = this.isCompany;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['companyName'] = this.companyName;
    data['nit'] = this.nit;
    data['documentType'] = this.documentType;
    data['documentNumber'] = this.documentNumber;
    data['documentUrl'] = this.documentUrl;
    data['contactEmail'] = this.contactEmail;
    data['contactCellphone'] = this.contactCellphone;
    data['contactPhone'] = this.contactPhone;
    data['address'] = this.address;
    data['isForeignPerson'] = this.isForeignPerson;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['birthDate'] = this.birthDate;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['gender'] = this.gender;
    data['description'] = this.description;
    data['patrimonyAmount'] = this.patrimonyAmount;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['bankAccountType'] = this.bankAccountType;
    data['bankAccountBank'] = this.bankAccountBank;
    data['bankAccountCertificationUrl'] = this.bankAccountCertificationUrl;
    data['producerFormatUrl'] = this.producerFormatUrl;
    data['investorFormatUrl'] = this.investorFormatUrl;
    data['clientFormatUrl'] = this.clientFormatUrl;
    data['rutUrl'] = this.rutUrl;
    data['chamberOfCommerceUrl'] = this.chamberOfCommerceUrl;
    data['declaracionDeRentaUrl'] = this.declaracionDeRentaUrl;
    data['motivationToInvest'] = this.motivationToInvest;
    data['phraseIdentifiesMe'] = this.phraseIdentifiesMe;
    data['knowledgeAboutCattleRaising'] = this.knowledgeAboutCattleRaising;
    data['holdingTaxEnabled'] = this.holdingTaxEnabled;
    return data;
  }
}
