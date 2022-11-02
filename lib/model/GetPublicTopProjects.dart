class GetPublicTopProjects {
  dynamic projectID;
  dynamic projectVideoUrl;
  dynamic projectImageUrl1;
  dynamic projectImageUrl2;
  dynamic projectImageUrl3;
  dynamic projectImageUrl4;
  dynamic projectName;
  dynamic projectCode;
  dynamic amountOfInvestors;
  dynamic projectProfitability;
  dynamic daysLeft;
  dynamic startDate;
  dynamic endDate;
  dynamic lastWeigthDate;
  dynamic projectDuration;
  dynamic locationSize;
  dynamic producerCommission;
  dynamic investmentRequired;
  dynamic investmentCollected;
  dynamic projectProgres;
  dynamic projectStatus;
  dynamic amountOfCattles;
  dynamic totalBatchWeight;
  dynamic estimatedFreightCost;
  dynamic cattleWeightAverageGain;
  dynamic projectType;
  dynamic projectSex;
  dynamic projectCattleType;
  dynamic totalProjectWeigthGain;
  dynamic producerName;
  dynamic producerID;
  dynamic producerProfilePictureUrl;
  dynamic locationAddress;
  dynamic farmName;
  dynamic locationArrivalLIndications;
  dynamic details;
  dynamic risksManagement;
  dynamic communicationPlan;
  dynamic projectStory;
  dynamic financialProjectionUrl;
  dynamic libertadYTradicionCertificateUrl;
  dynamic usoDelSueloCertificateUrl;
  dynamic registroSanitarioUrl;
  dynamic ultimoSoporteVacunacionUrl;
  dynamic contratoDeArriendoUrl;
  dynamic contratoColaboracionUrl;
  dynamic contratoPrestacionServiciosUrl;
  dynamic determinantesRiesgosAmbientalesYSocialesUrl;
  dynamic suraRelacionHatoGanaderoUrl;
  dynamic suraDeclaracionBovinoUrl;
  dynamic suraDeclaracionTipoDeProductorUrl;
  dynamic suraCotizacionSeguroUrl;
  dynamic sostyComission;
  dynamic initialKilogramPrice;
  dynamic finalKilogramPrice;
  dynamic initialWeight;
  dynamic finalWeight;
  dynamic insurancePricePerKilogram;
  dynamic mandatoPercentage;
  dynamic isBlockedForInvestment;
  dynamic totalMoneyCollected;
  dynamic fourPerThousandPerKilogram;
  dynamic orejerasPerKilogram;
  dynamic totalPricePerKilogram;
  dynamic sostyComissionOnSale;
  dynamic calvesPercentage;
  dynamic calveWeigthAtWeaning;
  dynamic amountOfBulls;
  dynamic amountOfCows;
  dynamic totalCostCows;
  dynamic totalCostBulls;
  dynamic totalFreightCost;
  dynamic totalInsurance;
  dynamic totalOrejeras;
  dynamic totalFourPerThousand;
  dynamic totalSostyComercialization;
  dynamic totalCostBreedingProject;
  dynamic totalUnits;
  dynamic unitPrice;
  dynamic calvesRevenue;
  dynamic liquidationRevenue;
  dynamic amountOfCalvesToSell;
  dynamic whatsappGroupLink;
  dynamic invoicesCreated;
  dynamic testProject;

  GetPublicTopProjects(
      {this.projectID,
      this.projectVideoUrl,
      this.projectImageUrl1,
      this.projectImageUrl2,
      this.projectImageUrl3,
      this.projectImageUrl4,
      this.projectName,
      this.projectCode,
      this.amountOfInvestors,
      this.projectProfitability,
      this.daysLeft,
      this.startDate,
      this.endDate,
      this.lastWeigthDate,
      this.projectDuration,
      this.locationSize,
      this.producerCommission,
      this.investmentRequired,
      this.investmentCollected,
      this.projectProgres,
      this.projectStatus,
      this.amountOfCattles,
      this.totalBatchWeight,
      this.estimatedFreightCost,
      this.cattleWeightAverageGain,
      this.projectType,
      this.projectSex,
      this.projectCattleType,
      this.totalProjectWeigthGain,
      this.producerName,
      this.producerID,
      this.producerProfilePictureUrl,
      this.locationAddress,
      this.farmName,
      this.locationArrivalLIndications,
      this.details,
      this.risksManagement,
      this.communicationPlan,
      this.projectStory,
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
      this.insurancePricePerKilogram,
      this.mandatoPercentage,
      this.isBlockedForInvestment,
      this.totalMoneyCollected,
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
      this.invoicesCreated,
      this.testProject});

  GetPublicTopProjects.fromJson(Map<String, dynamic> json) {
    projectID = json['projectID'];
    projectVideoUrl = json['projectVideoUrl'];
    projectImageUrl1 = json['projectImageUrl1'];
    projectImageUrl2 = json['projectImageUrl2'];
    projectImageUrl3 = json['projectImageUrl3'];
    projectImageUrl4 = json['projectImageUrl4'];
    projectName = json['projectName'];
    projectCode = json['projectCode'];
    amountOfInvestors = json['amountOfInvestors'];
    projectProfitability = json['projectProfitability'];
    daysLeft = json['daysLeft'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    lastWeigthDate = json['lastWeigthDate'];
    projectDuration = json['projectDuration'];
    locationSize = json['locationSize'];
    producerCommission = json['producerCommission'];
    investmentRequired = json['investmentRequired'];
    investmentCollected = json['investmentCollected'];
    projectProgres = json['projectProgres'];
    projectStatus = json['projectStatus'];
    amountOfCattles = json['amountOfCattles'];
    totalBatchWeight = json['totalBatchWeight'];
    estimatedFreightCost = json['estimatedFreightCost'];
    cattleWeightAverageGain = json['cattleWeightAverageGain'];
    projectType = json['projectType'];
    projectSex = json['projectSex'];
    projectCattleType = json['projectCattleType'];
    totalProjectWeigthGain = json['totalProjectWeigthGain'];
    producerName = json['producerName'];
    producerID = json['producerID'];
    producerProfilePictureUrl = json['producerProfilePictureUrl'];
    locationAddress = json['locationAddress'];
    farmName = json['farmName'];
    locationArrivalLIndications = json['locationArrivalLIndications'];
    details = json['details'];
    risksManagement = json['risksManagement'];
    communicationPlan = json['communicationPlan'];
    projectStory = json['projectStory'];
    financialProjectionUrl = json['financialProjectionUrl'];
    libertadYTradicionCertificateUrl = json['libertadYTradicionCertificateUrl'];
    usoDelSueloCertificateUrl = json['usoDelSueloCertificateUrl'];
    registroSanitarioUrl = json['registroSanitarioUrl'];
    ultimoSoporteVacunacionUrl = json['ultimoSoporteVacunacionUrl'];
    contratoDeArriendoUrl = json['contratoDeArriendoUrl'];
    contratoColaboracionUrl = json['contratoColaboracionUrl'];
    contratoPrestacionServiciosUrl = json['contratoPrestacionServiciosUrl'];
    determinantesRiesgosAmbientalesYSocialesUrl =
        json['determinantesRiesgosAmbientalesYSocialesUrl'];
    suraRelacionHatoGanaderoUrl = json['suraRelacionHatoGanaderoUrl'];
    suraDeclaracionBovinoUrl = json['suraDeclaracionBovinoUrl'];
    suraDeclaracionTipoDeProductorUrl =
        json['suraDeclaracionTipoDeProductorUrl'];
    suraCotizacionSeguroUrl = json['suraCotizacionSeguroUrl'];
    sostyComission = json['sostyComission'];
    initialKilogramPrice = json['initialKilogramPrice'];
    finalKilogramPrice = json['finalKilogramPrice'];
    initialWeight = json['initialWeight'];
    finalWeight = json['finalWeight'];
    insurancePricePerKilogram = json['insurancePricePerKilogram'];
    mandatoPercentage = json['mandatoPercentage'];
    isBlockedForInvestment = json['isBlockedForInvestment'];
    totalMoneyCollected = json['totalMoneyCollected'];
    fourPerThousandPerKilogram = json['fourPerThousandPerKilogram'];
    orejerasPerKilogram = json['orejerasPerKilogram'];
    totalPricePerKilogram = json['totalPricePerKilogram'];
    sostyComissionOnSale = json['sostyComissionOnSale'];
    calvesPercentage = json['calvesPercentage'];
    calveWeigthAtWeaning = json['calveWeigthAtWeaning'];
    amountOfBulls = json['amountOfBulls'];
    amountOfCows = json['amountOfCows'];
    totalCostCows = json['totalCostCows'];
    totalCostBulls = json['totalCostBulls'];
    totalFreightCost = json['totalFreightCost'];
    totalInsurance = json['totalInsurance'];
    totalOrejeras = json['totalOrejeras'];
    totalFourPerThousand = json['totalFourPerThousand'];
    totalSostyComercialization = json['totalSostyComercialization'];
    totalCostBreedingProject = json['totalCostBreedingProject'];
    totalUnits = json['totalUnits'];
    unitPrice = json['unitPrice'];
    calvesRevenue = json['calvesRevenue'];
    liquidationRevenue = json['liquidationRevenue'];
    amountOfCalvesToSell = json['amountOfCalvesToSell'];
    whatsappGroupLink = json['whatsappGroupLink'];
    invoicesCreated = json['invoicesCreated'];
    testProject = json['testProject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectID'] = this.projectID;
    data['projectVideoUrl'] = this.projectVideoUrl;
    data['projectImageUrl1'] = this.projectImageUrl1;
    data['projectImageUrl2'] = this.projectImageUrl2;
    data['projectImageUrl3'] = this.projectImageUrl3;
    data['projectImageUrl4'] = this.projectImageUrl4;
    data['projectName'] = this.projectName;
    data['projectCode'] = this.projectCode;
    data['amountOfInvestors'] = this.amountOfInvestors;
    data['projectProfitability'] = this.projectProfitability;
    data['daysLeft'] = this.daysLeft;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['lastWeigthDate'] = this.lastWeigthDate;
    data['projectDuration'] = this.projectDuration;
    data['locationSize'] = this.locationSize;
    data['producerCommission'] = this.producerCommission;
    data['investmentRequired'] = this.investmentRequired;
    data['investmentCollected'] = this.investmentCollected;
    data['projectProgres'] = this.projectProgres;
    data['projectStatus'] = this.projectStatus;
    data['amountOfCattles'] = this.amountOfCattles;
    data['totalBatchWeight'] = this.totalBatchWeight;
    data['estimatedFreightCost'] = this.estimatedFreightCost;
    data['cattleWeightAverageGain'] = this.cattleWeightAverageGain;
    data['projectType'] = this.projectType;
    data['projectSex'] = this.projectSex;
    data['projectCattleType'] = this.projectCattleType;
    data['totalProjectWeigthGain'] = this.totalProjectWeigthGain;
    data['producerName'] = this.producerName;
    data['producerID'] = this.producerID;
    data['producerProfilePictureUrl'] = this.producerProfilePictureUrl;
    data['locationAddress'] = this.locationAddress;
    data['farmName'] = this.farmName;
    data['locationArrivalLIndications'] = this.locationArrivalLIndications;
    data['details'] = this.details;
    data['risksManagement'] = this.risksManagement;
    data['communicationPlan'] = this.communicationPlan;
    data['projectStory'] = this.projectStory;
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
    data['insurancePricePerKilogram'] = this.insurancePricePerKilogram;
    data['mandatoPercentage'] = this.mandatoPercentage;
    data['isBlockedForInvestment'] = this.isBlockedForInvestment;
    data['totalMoneyCollected'] = this.totalMoneyCollected;
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
    data['invoicesCreated'] = this.invoicesCreated;
    data['testProject'] = this.testProject;
    return data;
  }
}
