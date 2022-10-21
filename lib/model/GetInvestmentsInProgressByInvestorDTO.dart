class GetInvestmentsInProgressByInvestorDTO {
  List<Items>? items;

  GetInvestmentsInProgressByInvestorDTO({this.items});

  GetInvestmentsInProgressByInvestorDTO.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  Producer? producer;
  Project? project;
  Investment? investment;

  Items({this.producer, this.project, this.investment});

  Items.fromJson(Map<String, dynamic> json) {
    producer = json['producer'] != null
        ? new Producer.fromJson(json['producer'])
        : null;
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    investment = json['investment'] != null
        ? new Investment.fromJson(json['investment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.producer != null) {
      data['producer'] = this.producer!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.investment != null) {
      data['investment'] = this.investment!.toJson();
    }
    return data;
  }
}

class Producer {
  String? profileDetailsID;
  String? userID;
  String? profileType;
  String? isCompany;
  String? firstName;
  String? lastName;
  String? companyName;
  String? nit;
  String? documentType;
  String? documentNumber;
  String? documentUrl;
  String? contactEmail;
  String? contactCellphone;
  String? contactPhone;
  String? address;
  String? isForeignPerson;
  String? state;
  String? city;
  String? country;
  String? birthDate;
  String? createDate;
  String? updateDate;
  String? gender;
  String? description;
  String? patrimonyAmount;
  String? bankAccountNumber;
  String? bankAccountType;
  String? bankAccountBank;
  String? bankAccountCertificationUrl;
  String? producerFormatUrl;
  String? investorFormatUrl;
  String? clientFormatUrl;
  String? rutUrl;
  String? chamberOfCommerceUrl;
  String? declaracionDeRentaUrl;
  String? motivationToInvest;
  String? phraseIdentifiesMe;
  String? knowledgeAboutCattleRaising;
  String? holdingTaxEnabled;

  Producer(
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

  Producer.fromJson(Map<String, dynamic> json) {
    profileDetailsID = json['profileDetailsID'] ?? '';
    userID = json['userID'] ?? '';
    profileType = json['profileType'] ?? '';
    isCompany = json['isCompany'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    companyName = json['companyName'] ?? '';
    nit = json['nit'] ?? '';
    documentType = json['documentType'] ?? '';
    documentNumber = json['documentNumber'] ?? '';
    documentUrl = json['documentUrl'] ?? '';
    contactEmail = json['contactEmail'] ?? '';
    contactCellphone = json['contactCellphone'] ?? '';
    contactPhone = json['contactPhone'] ?? '';
    address = json['address'] ?? '';
    isForeignPerson = json['isForeignPerson'] ?? '';
    state = json['state'] ?? '';
    city = json['city'] ?? '';
    country = json['country'] ?? '';
    birthDate = json['birthDate'] ?? '';
    createDate = json['createDate'] ?? '';
    updateDate = json['updateDate'] ?? '';
    gender = json['gender'] ?? '';
    description = json['description'] ?? '';
    patrimonyAmount = json['patrimonyAmount'] ?? '';
    bankAccountNumber = json['bankAccountNumber'] ?? '';
    bankAccountType = json['bankAccountType'] ?? '';
    bankAccountBank = json['bankAccountBank'] ?? '';
    bankAccountCertificationUrl = json['bankAccountCertificationUrl'] ?? '';
    producerFormatUrl = json['producerFormatUrl'] ?? '';
    investorFormatUrl = json['investorFormatUrl'] ?? '';
    clientFormatUrl = json['clientFormatUrl'] ?? '';
    rutUrl = json['rutUrl'] ?? '';
    chamberOfCommerceUrl = json['chamberOfCommerceUrl'] ?? '';
    declaracionDeRentaUrl = json['declaracionDeRentaUrl'] ?? '';
    motivationToInvest = json['motivationToInvest'] ?? '';
    phraseIdentifiesMe = json['phraseIdentifiesMe'] ?? '';
    knowledgeAboutCattleRaising = json['knowledgeAboutCattleRaising'] ?? '';
    holdingTaxEnabled = json['holdingTaxEnabled'] ?? '';
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

class Project {
  String? projectID;
  String? producerID;
  String? projectName;
  String? projectCode;
  String? projectStatus;
  String? projectVideoUrl;
  String? projectImageUrl1;
  String? projectImageUrl2;
  String? projectImageUrl3;
  String? projectImageUrl4;
  int? investmentRequired;
  int? minimumInvestmentRequired;
  dynamic investmentCollected;
  String? collectDeadline;
  String? createDate;
  String? updateDate;
  String? deleteDate;
  String? submitDate;
  String? startDate;
  String? endDate;
  String? details;
  String? risksManagement;
  String? communicationPlan;
  String? objectivesAndDetails;
  String? projectType;
  String? projectSex;
  String? projectCattleType;
  int? cattleWeightAverageGain;
  int? totalBatchWeight;
  int? amountOfCattles;
  double? projectProfitability;
  String? hasSostyAudit;
  String? hasSostyInsurance;
  String? farmName;
  String? locationAddress;
  String? locationState;
  String? locationCity;
  String? locationArrivalLIndications;
  String? locationSize;
  int? producerCommission;
  dynamic estimatedFreightCost;
  String? locationLatitude;
  String? locationLongitude;
  String? locationIsRented;
  String? financialProjectionUrl;
  String? libertadYTradicionCertificateUrl;
  String? usoDelSueloCertificateUrl;
  String? registroSanitarioUrl;
  String? ultimoSoporteVacunacionUrl;
  String? contratoDeArriendoUrl;
  String? contratoColaboracionUrl;
  String? contratoPrestacionServiciosUrl;
  String? determinantesRiesgosAmbientalesYSocialesUrl;
  String? suraRelacionHatoGanaderoUrl;
  String? suraDeclaracionBovinoUrl;
  String? suraDeclaracionTipoDeProductorUrl;
  String? suraCotizacionSeguroUrl;
  int? sostyComission;
  int? initialKilogramPrice;
  int? finalKilogramPrice;
  int? initialWeight;
  int? finalWeight;
  String? projectStory;
  dynamic insurancePricePerKilogram;
  int? totalMoneyCollected;
  dynamic mandatoPercentage;
  bool? isBlockedForInvestment;
  dynamic fourPerThousandPerKilogram;
  dynamic orejerasPerKilogram;
  dynamic totalPricePerKilogram;
  int? sostyComissionOnSale;
  int? calvesPercentage;
  int? calveWeigthAtWeaning;
  int? amountOfBulls;
  int? amountOfCows;
  int? totalCostCows;
  int? totalCostBulls;
  int? totalFreightCost;
  int? totalInsurance;
  int? totalOrejeras;
  int? totalFourPerThousand;
  int? totalSostyComercialization;
  int? totalCostBreedingProject;
  int? totalUnits;
  dynamic unitPrice;
  String? calvesRevenue;
  String? liquidationRevenue;
  String? amountOfCalvesToSell;
  String? whatsappGroupLink;
  bool? rutNotificationSent;
  String? clickUpTaskID;

  Project(
      {this.projectID,
      this.producerID,
      this.projectName,
      this.projectCode,
      this.projectStatus,
      this.projectVideoUrl,
      this.projectImageUrl1,
      this.projectImageUrl2,
      this.projectImageUrl3,
      this.projectImageUrl4,
      this.investmentRequired,
      this.minimumInvestmentRequired,
      this.investmentCollected,
      this.collectDeadline,
      this.createDate,
      this.updateDate,
      this.deleteDate,
      this.submitDate,
      this.startDate,
      this.endDate,
      this.details,
      this.risksManagement,
      this.communicationPlan,
      this.objectivesAndDetails,
      this.projectType,
      this.projectSex,
      this.projectCattleType,
      this.cattleWeightAverageGain,
      this.totalBatchWeight,
      this.amountOfCattles,
      this.projectProfitability,
      this.hasSostyAudit,
      this.hasSostyInsurance,
      this.farmName,
      this.locationAddress,
      this.locationState,
      this.locationCity,
      this.locationArrivalLIndications,
      this.locationSize,
      this.producerCommission,
      this.estimatedFreightCost,
      this.locationLatitude,
      this.locationLongitude,
      this.locationIsRented,
      this.financialProjectionUrl,
      this.libertadYTradicionCertificateUrl,
      this.usoDelSueloCertificateUrl,
      this.registroSanitarioUrl,
      this.ultimoSoporteVacunacionUrl,
      this.contratoDeArriendoUrl,
      this.contratoColaboracionUrl,
      this.contratoPrestacionServiciosUrl,
      this.determinantesRiesgosAmbientalesYSocialesUrl,
      this.suraRelacionHatoGanaderoUrl,
      this.suraDeclaracionBovinoUrl,
      this.suraDeclaracionTipoDeProductorUrl,
      this.suraCotizacionSeguroUrl,
      this.sostyComission,
      this.initialKilogramPrice,
      this.finalKilogramPrice,
      this.initialWeight,
      this.finalWeight,
      this.projectStory,
      this.insurancePricePerKilogram,
      this.totalMoneyCollected,
      this.mandatoPercentage,
      this.isBlockedForInvestment,
      this.fourPerThousandPerKilogram,
      this.orejerasPerKilogram,
      this.totalPricePerKilogram,
      this.sostyComissionOnSale,
      this.calvesPercentage,
      this.calveWeigthAtWeaning,
      this.amountOfBulls,
      this.amountOfCows,
      this.totalCostCows,
      this.totalCostBulls,
      this.totalFreightCost,
      this.totalInsurance,
      this.totalOrejeras,
      this.totalFourPerThousand,
      this.totalSostyComercialization,
      this.totalCostBreedingProject,
      this.totalUnits,
      this.unitPrice,
      this.calvesRevenue,
      this.liquidationRevenue,
      this.amountOfCalvesToSell,
      this.whatsappGroupLink,
      this.rutNotificationSent,
      this.clickUpTaskID});

  Project.fromJson(Map<String, dynamic> json) {
    projectID = json['projectID'] ?? '';
    producerID = json['producerID'] ?? '';
    projectName = json['projectName'] ?? '';
    projectCode = json['projectCode'] ?? '';
    projectStatus = json['projectStatus'] ?? '';
    projectVideoUrl = json['projectVideoUrl'] ?? '';
    projectImageUrl1 = json['projectImageUrl1'] ?? '';
    projectImageUrl2 = json['projectImageUrl2'] ?? '';
    projectImageUrl3 = json['projectImageUrl3'] ?? '';
    projectImageUrl4 = json['projectImageUrl4'] ?? '';
    investmentRequired = json['investmentRequired'] ?? 0;
    minimumInvestmentRequired = json['minimumInvestmentRequired'] ?? 0;
    investmentCollected = json['investmentCollected'] ?? '';
    collectDeadline = json['collectDeadline'] ?? '';
    createDate = json['createDate'] ?? '';
    updateDate = json['updateDate'] ?? '';
    deleteDate = json['deleteDate'] ?? '';
    submitDate = json['submitDate'] ?? '';
    startDate = json['startDate'] ?? '';
    endDate = json['endDate'] ?? '';
    details = json['details'] ?? '';
    risksManagement = json['risksManagement'] ?? '';
    communicationPlan = json['communicationPlan'] ?? '';
    objectivesAndDetails = json['objectivesAndDetails'] ?? '';
    projectType = json['projectType'] ?? '';
    projectSex = json['projectSex'] ?? '';
    projectCattleType = json['projectCattleType'] ?? '';
    cattleWeightAverageGain = json['cattleWeightAverageGain'] ?? 0;
    totalBatchWeight = json['totalBatchWeight'] ?? 0;
    amountOfCattles = json['amountOfCattles'] ?? 0;
    projectProfitability = json['projectProfitability'] ?? 0.0;
    hasSostyAudit = json['hasSostyAudit'] ?? '';
    hasSostyInsurance = json['hasSostyInsurance'] ?? '';
    farmName = json['farmName'] ?? '';
    locationAddress = json['locationAddress'] ?? '';
    locationState = json['locationState'] ?? '';
    locationCity = json['locationCity'] ?? '';
    locationArrivalLIndications = json['locationArrivalLIndications'] ?? '';
    locationSize = json['locationSize'] ?? '';
    producerCommission = json['producerCommission'] ?? 0;
    estimatedFreightCost = json['estimatedFreightCost'] ?? 0.0;
    locationLatitude = json['locationLatitude'] ?? '';
    locationLongitude = json['locationLongitude'] ?? '';
    locationIsRented = json['locationIsRented'] ?? '';
    financialProjectionUrl = json['financialProjectionUrl'] ?? '';
    libertadYTradicionCertificateUrl =
        json['libertadYTradicionCertificateUrl'] ?? '';
    usoDelSueloCertificateUrl = json['usoDelSueloCertificateUrl'] ?? '';
    registroSanitarioUrl = json['registroSanitarioUrl'] ?? '';
    ultimoSoporteVacunacionUrl = json['ultimoSoporteVacunacionUrl'] ?? '';
    contratoDeArriendoUrl = json['contratoDeArriendoUrl'] ?? '';
    contratoColaboracionUrl = json['contratoColaboracionUrl'] ?? '';
    contratoPrestacionServiciosUrl =
        json['contratoPrestacionServiciosUrl'] ?? '';
    determinantesRiesgosAmbientalesYSocialesUrl =
        json['determinantesRiesgosAmbientalesYSocialesUrl'] ?? '';
    suraRelacionHatoGanaderoUrl = json['suraRelacionHatoGanaderoUrl'] ?? '';
    suraDeclaracionBovinoUrl = json['suraDeclaracionBovinoUrl'] ?? '';
    suraDeclaracionTipoDeProductorUrl =
        json['suraDeclaracionTipoDeProductorUrl'] ?? '';
    suraCotizacionSeguroUrl = json['suraCotizacionSeguroUrl'] ?? '';
    sostyComission = json['sostyComission'] ?? 0;
    initialKilogramPrice = json['initialKilogramPrice'] ?? 0;
    finalKilogramPrice = json['finalKilogramPrice'] ?? 0;
    initialWeight = json['initialWeight'] ?? 0;
    finalWeight = json['finalWeight'] ?? 0;
    projectStory = json['projectStory'] ?? '';
    insurancePricePerKilogram = json['insurancePricePerKilogram'] ?? 0.0;
    totalMoneyCollected = json['totalMoneyCollected'] ?? 0;
    mandatoPercentage = json['mandatoPercentage'] ?? 0.0;
    isBlockedForInvestment = json['isBlockedForInvestment'] ?? true;
    fourPerThousandPerKilogram = json['fourPerThousandPerKilogram'] ?? 0.0;
    orejerasPerKilogram = json['orejerasPerKilogram'] ?? 0.0;
    totalPricePerKilogram = json['totalPricePerKilogram'] ?? 0.0;
    sostyComissionOnSale = json['sostyComissionOnSale'] ?? 0;
    calvesPercentage = json['calvesPercentage'] ?? 0;
    calveWeigthAtWeaning = json['calveWeigthAtWeaning'] ?? 0;
    amountOfBulls = json['amountOfBulls'] ?? 0;
    amountOfCows = json['amountOfCows'] ?? 0;
    totalCostCows = json['totalCostCows'] ?? 0;
    totalCostBulls = json['totalCostBulls'] ?? 0;
    totalFreightCost = json['totalFreightCost'] ?? 0;
    totalInsurance = json['totalInsurance'] ?? 0;
    totalOrejeras = json['totalOrejeras'] ?? 0;
    totalFourPerThousand = json['totalFourPerThousand'] ?? 0;
    totalSostyComercialization = json['totalSostyComercialization'] ?? 0;
    totalCostBreedingProject = json['totalCostBreedingProject'] ?? 0;
    totalUnits = json['totalUnits'] ?? 0;
    unitPrice = json['unitPrice'] ?? 0.0;
    calvesRevenue = json['calvesRevenue'] ?? '';
    liquidationRevenue = json['liquidationRevenue'] ?? '';
    amountOfCalvesToSell = json['amountOfCalvesToSell'] ?? '';
    whatsappGroupLink = json['whatsappGroupLink'] ?? '';
    rutNotificationSent = json['rutNotificationSent'] ?? true;
    clickUpTaskID = json['clickUpTaskID'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectID'] = this.projectID;
    data['producerID'] = this.producerID;
    data['projectName'] = this.projectName;
    data['projectCode'] = this.projectCode;
    data['projectStatus'] = this.projectStatus;
    data['projectVideoUrl'] = this.projectVideoUrl;
    data['projectImageUrl1'] = this.projectImageUrl1;
    data['projectImageUrl2'] = this.projectImageUrl2;
    data['projectImageUrl3'] = this.projectImageUrl3;
    data['projectImageUrl4'] = this.projectImageUrl4;
    data['investmentRequired'] = this.investmentRequired;
    data['minimumInvestmentRequired'] = this.minimumInvestmentRequired;
    data['investmentCollected'] = this.investmentCollected;
    data['collectDeadline'] = this.collectDeadline;
    data['createDate'] = this.createDate;
    data['updateDate'] = this.updateDate;
    data['deleteDate'] = this.deleteDate;
    data['submitDate'] = this.submitDate;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['details'] = this.details;
    data['risksManagement'] = this.risksManagement;
    data['communicationPlan'] = this.communicationPlan;
    data['objectivesAndDetails'] = this.objectivesAndDetails;
    data['projectType'] = this.projectType;
    data['projectSex'] = this.projectSex;
    data['projectCattleType'] = this.projectCattleType;
    data['cattleWeightAverageGain'] = this.cattleWeightAverageGain;
    data['totalBatchWeight'] = this.totalBatchWeight;
    data['amountOfCattles'] = this.amountOfCattles;
    data['projectProfitability'] = this.projectProfitability;
    data['hasSostyAudit'] = this.hasSostyAudit;
    data['hasSostyInsurance'] = this.hasSostyInsurance;
    data['farmName'] = this.farmName;
    data['locationAddress'] = this.locationAddress;
    data['locationState'] = this.locationState;
    data['locationCity'] = this.locationCity;
    data['locationArrivalLIndications'] = this.locationArrivalLIndications;
    data['locationSize'] = this.locationSize;
    data['producerCommission'] = this.producerCommission;
    data['estimatedFreightCost'] = this.estimatedFreightCost;
    data['locationLatitude'] = this.locationLatitude;
    data['locationLongitude'] = this.locationLongitude;
    data['locationIsRented'] = this.locationIsRented;
    data['financialProjectionUrl'] = this.financialProjectionUrl;
    data['libertadYTradicionCertificateUrl'] =
        this.libertadYTradicionCertificateUrl;
    data['usoDelSueloCertificateUrl'] = this.usoDelSueloCertificateUrl;
    data['registroSanitarioUrl'] = this.registroSanitarioUrl;
    data['ultimoSoporteVacunacionUrl'] = this.ultimoSoporteVacunacionUrl;
    data['contratoDeArriendoUrl'] = this.contratoDeArriendoUrl;
    data['contratoColaboracionUrl'] = this.contratoColaboracionUrl;
    data['contratoPrestacionServiciosUrl'] =
        this.contratoPrestacionServiciosUrl;
    data['determinantesRiesgosAmbientalesYSocialesUrl'] =
        this.determinantesRiesgosAmbientalesYSocialesUrl;
    data['suraRelacionHatoGanaderoUrl'] = this.suraRelacionHatoGanaderoUrl;
    data['suraDeclaracionBovinoUrl'] = this.suraDeclaracionBovinoUrl;
    data['suraDeclaracionTipoDeProductorUrl'] =
        this.suraDeclaracionTipoDeProductorUrl;
    data['suraCotizacionSeguroUrl'] = this.suraCotizacionSeguroUrl;
    data['sostyComission'] = this.sostyComission;
    data['initialKilogramPrice'] = this.initialKilogramPrice;
    data['finalKilogramPrice'] = this.finalKilogramPrice;
    data['initialWeight'] = this.initialWeight;
    data['finalWeight'] = this.finalWeight;
    data['projectStory'] = this.projectStory;
    data['insurancePricePerKilogram'] = this.insurancePricePerKilogram;
    data['totalMoneyCollected'] = this.totalMoneyCollected;
    data['mandatoPercentage'] = this.mandatoPercentage;
    data['isBlockedForInvestment'] = this.isBlockedForInvestment;
    data['fourPerThousandPerKilogram'] = this.fourPerThousandPerKilogram;
    data['orejerasPerKilogram'] = this.orejerasPerKilogram;
    data['totalPricePerKilogram'] = this.totalPricePerKilogram;
    data['sostyComissionOnSale'] = this.sostyComissionOnSale;
    data['calvesPercentage'] = this.calvesPercentage;
    data['calveWeigthAtWeaning'] = this.calveWeigthAtWeaning;
    data['amountOfBulls'] = this.amountOfBulls;
    data['amountOfCows'] = this.amountOfCows;
    data['totalCostCows'] = this.totalCostCows;
    data['totalCostBulls'] = this.totalCostBulls;
    data['totalFreightCost'] = this.totalFreightCost;
    data['totalInsurance'] = this.totalInsurance;
    data['totalOrejeras'] = this.totalOrejeras;
    data['totalFourPerThousand'] = this.totalFourPerThousand;
    data['totalSostyComercialization'] = this.totalSostyComercialization;
    data['totalCostBreedingProject'] = this.totalCostBreedingProject;
    data['totalUnits'] = this.totalUnits;
    data['unitPrice'] = this.unitPrice;
    data['calvesRevenue'] = this.calvesRevenue;
    data['liquidationRevenue'] = this.liquidationRevenue;
    data['amountOfCalvesToSell'] = this.amountOfCalvesToSell;
    data['whatsappGroupLink'] = this.whatsappGroupLink;
    data['rutNotificationSent'] = this.rutNotificationSent;
    data['clickUpTaskID'] = this.clickUpTaskID;
    return data;
  }
}

class Investment {
  String? investmendID;
  String? investorID;
  String? projectID;
  int? amountInvested;
  int? amountReceived;
  String? contractUrl;
  bool? isConfirmed;
  String? balanceLoaded;
  String? paymentProofUrl;
  String? contratoColaboracionUrl;
  String? contratoMandatoUrl;
  String? createDate;
  String? deleteDate;
  dynamic totalKilograms;
  dynamic totalCattles;
  bool? reviewMade;
  int? totalUnits;
  String? epaycoTransactionRef;
  String? epaycoTransactionStatus;
  bool? isPreInvestment;
  bool? agreeToInvestTheBalance;
  int? balanceToInvest;
  bool? allowedToLoadBalance;

  Investment(
      {this.investmendID,
      this.investorID,
      this.projectID,
      this.amountInvested,
      this.amountReceived,
      this.contractUrl,
      this.isConfirmed,
      this.balanceLoaded,
      this.paymentProofUrl,
      this.contratoColaboracionUrl,
      this.contratoMandatoUrl,
      this.createDate,
      this.deleteDate,
      this.totalKilograms,
      this.totalCattles,
      this.reviewMade,
      this.totalUnits,
      this.epaycoTransactionRef,
      this.epaycoTransactionStatus,
      this.isPreInvestment,
      this.agreeToInvestTheBalance,
      this.balanceToInvest,
      this.allowedToLoadBalance});

  Investment.fromJson(Map<String, dynamic> json) {
    investmendID = json['investmendID'] ?? '';
    investorID = json['investorID'] ?? '';
    projectID = json['projectID'] ?? '';
    amountInvested = json['amountInvested'] ?? 0;
    amountReceived = json['amountReceived'] ?? 0;
    contractUrl = json['contractUrl'] ?? '';
    isConfirmed = json['isConfirmed'] ?? true;
    balanceLoaded = json['balanceLoaded'] ?? '';
    paymentProofUrl = json['paymentProofUrl'] ?? '';
    contratoColaboracionUrl = json['contratoColaboracionUrl'] ?? '';
    contratoMandatoUrl = json['contratoMandatoUrl'] ?? '';
    createDate = json['createDate'] ?? '';
    deleteDate = json['deleteDate'] ?? '';
    totalKilograms = json['totalKilograms'] ?? 0.0;
    totalCattles = json['totalCattles'] ?? 0.0;
    reviewMade = json['reviewMade'] ?? true;
    totalUnits = json['totalUnits'] ?? 0;
    epaycoTransactionRef = json['epaycoTransactionRef'] ?? '';
    epaycoTransactionStatus = json['epaycoTransactionStatus'] ?? '';
    isPreInvestment = json['isPreInvestment'] ?? true;
    agreeToInvestTheBalance = json['agreeToInvestTheBalance'] ?? true;
    balanceToInvest = json['balanceToInvest'] ?? 0;
    allowedToLoadBalance = json['allowedToLoadBalance'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investmendID'] = this.investmendID;
    data['investorID'] = this.investorID;
    data['projectID'] = this.projectID;
    data['amountInvested'] = this.amountInvested;
    data['amountReceived'] = this.amountReceived;
    data['contractUrl'] = this.contractUrl;
    data['isConfirmed'] = this.isConfirmed;
    data['balanceLoaded'] = this.balanceLoaded;
    data['paymentProofUrl'] = this.paymentProofUrl;
    data['contratoColaboracionUrl'] = this.contratoColaboracionUrl;
    data['contratoMandatoUrl'] = this.contratoMandatoUrl;
    data['createDate'] = this.createDate;
    data['deleteDate'] = this.deleteDate;
    data['totalKilograms'] = this.totalKilograms;
    data['totalCattles'] = this.totalCattles;
    data['reviewMade'] = this.reviewMade;
    data['totalUnits'] = this.totalUnits;
    data['epaycoTransactionRef'] = this.epaycoTransactionRef;
    data['epaycoTransactionStatus'] = this.epaycoTransactionStatus;
    data['isPreInvestment'] = this.isPreInvestment;
    data['agreeToInvestTheBalance'] = this.agreeToInvestTheBalance;
    data['balanceToInvest'] = this.balanceToInvest;
    data['allowedToLoadBalance'] = this.allowedToLoadBalance;
    return data;
  }
}
