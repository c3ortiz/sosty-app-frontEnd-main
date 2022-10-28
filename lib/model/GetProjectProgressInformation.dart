class GetProjectProgressInformation {
  String? investmendID;
  dynamic amountInvested;
  String? projectName;
  String? projectCode;
  String? projectID;
  dynamic investmentRequired;
  dynamic investmentCollected;
  String? projectProgres;
  String? locationAddress;
  dynamic farmName;
  String? locationState;
  String? locationCity;
  String? locationArrivalLIndications;
  String? startDate;
  String? endDate;
  dynamic cattleWeightAverageGain;
  dynamic initialWeight;
  dynamic finalWeight;
  String? projectDuration;
  dynamic totalProjectWeigthGain;
  dynamic amountOfCattles;
  dynamic projectProfitability;
  List<Weights>? weights;
  List<int>? weightsList;
  List<String>? weightsDatesList;
  String? firstName;
  String? lastName;
  String? contactEmail;
  List<Events>? events;

  GetProjectProgressInformation(
      {this.investmendID,
      this.amountInvested,
      this.projectName,
      this.projectCode,
      this.projectID,
      this.investmentRequired,
      this.investmentCollected,
      this.projectProgres,
      this.locationAddress,
      this.farmName,
      this.locationState,
      this.locationCity,
      this.locationArrivalLIndications,
      this.startDate,
      this.endDate,
      this.cattleWeightAverageGain,
      this.initialWeight,
      this.finalWeight,
      this.projectDuration,
      this.totalProjectWeigthGain,
      this.amountOfCattles,
      this.projectProfitability,
      this.weights,
      this.weightsList,
      this.weightsDatesList,
      this.firstName,
      this.lastName,
      this.contactEmail,
      this.events});

  GetProjectProgressInformation.fromJson(Map<String, dynamic> json) {
    investmendID = json['investmendID'];
    amountInvested = json['amountInvested'];
    projectName = json['projectName'];
    projectCode = json['projectCode'];
    projectID = json['projectID'];
    investmentRequired = json['investmentRequired'];
    investmentCollected = json['investmentCollected'];
    projectProgres = json['projectProgres'];
    locationAddress = json['locationAddress'];
    farmName = json['farmName'];
    locationState = json['locationState'];
    locationCity = json['locationCity'];
    locationArrivalLIndications = json['locationArrivalLIndications'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    cattleWeightAverageGain = json['cattleWeightAverageGain'];
    initialWeight = json['initialWeight'];
    finalWeight = json['finalWeight'];
    projectDuration = json['projectDuration'];
    totalProjectWeigthGain = json['totalProjectWeigthGain'];
    amountOfCattles = json['amountOfCattles'];
    projectProfitability = json['projectProfitability'];
    if (json['weights'] != null) {
      weights = <Weights>[];
      json['weights'].forEach((v) {
        weights!.add(new Weights.fromJson(v));
      });
    }
    weightsList = json['weightsList'].cast<int>();
    weightsDatesList = json['weightsDatesList'].cast<String>();
    firstName = json['firstName'];
    lastName = json['lastName'];
    contactEmail = json['contactEmail'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['investmendID'] = this.investmendID;
    data['amountInvested'] = this.amountInvested;
    data['projectName'] = this.projectName;
    data['projectCode'] = this.projectCode;
    data['projectID'] = this.projectID;
    data['investmentRequired'] = this.investmentRequired;
    data['investmentCollected'] = this.investmentCollected;
    data['projectProgres'] = this.projectProgres;
    data['locationAddress'] = this.locationAddress;
    data['farmName'] = this.farmName;
    data['locationState'] = this.locationState;
    data['locationCity'] = this.locationCity;
    data['locationArrivalLIndications'] = this.locationArrivalLIndications;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['cattleWeightAverageGain'] = this.cattleWeightAverageGain;
    data['initialWeight'] = this.initialWeight;
    data['finalWeight'] = this.finalWeight;
    data['projectDuration'] = this.projectDuration;
    data['totalProjectWeigthGain'] = this.totalProjectWeigthGain;
    data['amountOfCattles'] = this.amountOfCattles;
    data['projectProfitability'] = this.projectProfitability;
    if (this.weights != null) {
      data['weights'] = this.weights!.map((v) => v.toJson()).toList();
    }
    data['weightsList'] = this.weightsList;
    data['weightsDatesList'] = this.weightsDatesList;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['contactEmail'] = this.contactEmail;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weights {
  String? projectWeightID;
  String? projectID;
  dynamic pesoManada;
  dynamic cantidadDeAnimalesGanananDe0a7;
  dynamic cantidadDeAnimalesGanananDe7a10;
  dynamic cantidadDeAnimalesGanananMasDe10;
  String? weightDate;
  String? createDate;
  dynamic deleteDate;

  Weights(
      {this.projectWeightID,
      this.projectID,
      this.pesoManada,
      this.cantidadDeAnimalesGanananDe0a7,
      this.cantidadDeAnimalesGanananDe7a10,
      this.cantidadDeAnimalesGanananMasDe10,
      this.weightDate,
      this.createDate,
      this.deleteDate});

  Weights.fromJson(Map<String, dynamic> json) {
    projectWeightID = json['projectWeightID'];
    projectID = json['projectID'];
    pesoManada = json['pesoManada'];
    cantidadDeAnimalesGanananDe0a7 = json['cantidadDeAnimalesGanananDe0a7'];
    cantidadDeAnimalesGanananDe7a10 = json['cantidadDeAnimalesGanananDe7a10'];
    cantidadDeAnimalesGanananMasDe10 = json['cantidadDeAnimalesGanananMasDe10'];
    weightDate = json['weightDate'];
    createDate = json['createDate'];
    deleteDate = json['deleteDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectWeightID'] = this.projectWeightID;
    data['projectID'] = this.projectID;
    data['pesoManada'] = this.pesoManada;
    data['cantidadDeAnimalesGanananDe0a7'] =
        this.cantidadDeAnimalesGanananDe0a7;
    data['cantidadDeAnimalesGanananDe7a10'] =
        this.cantidadDeAnimalesGanananDe7a10;
    data['cantidadDeAnimalesGanananMasDe10'] =
        this.cantidadDeAnimalesGanananMasDe10;
    data['weightDate'] = this.weightDate;
    data['createDate'] = this.createDate;
    data['deleteDate'] = this.deleteDate;
    return data;
  }
}

class Events {
  String? projectEventID;
  String? projectID;
  String? projectWeightID;
  String? eventType;
  String? description;
  String? eventDate;
  String? createDate;
  dynamic deleteDate;
  String? picture1Url;
  dynamic picture2Url;
  dynamic picture3Url;
  dynamic picture4Url;
  dynamic picture5Url;
  String? file1Url;
  dynamic file2Url;
  dynamic file3Url;

  Events(
      {this.projectEventID,
      this.projectID,
      this.projectWeightID,
      this.eventType,
      this.description,
      this.eventDate,
      this.createDate,
      this.deleteDate,
      this.picture1Url,
      this.picture2Url,
      this.picture3Url,
      this.picture4Url,
      this.picture5Url,
      this.file1Url,
      this.file2Url,
      this.file3Url});

  Events.fromJson(Map<String, dynamic> json) {
    projectEventID = json['projectEventID'];
    projectID = json['projectID'];
    projectWeightID = json['projectWeightID'];
    eventType = json['eventType'];
    description = json['description'];
    eventDate = json['eventDate'];
    createDate = json['createDate'];
    deleteDate = json['deleteDate'];
    picture1Url = json['picture1Url'];
    picture2Url = json['picture2Url'];
    picture3Url = json['picture3Url'];
    picture4Url = json['picture4Url'];
    picture5Url = json['picture5Url'];
    file1Url = json['file1Url'];
    file2Url = json['file2Url'];
    file3Url = json['file3Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectEventID'] = this.projectEventID;
    data['projectID'] = this.projectID;
    data['projectWeightID'] = this.projectWeightID;
    data['eventType'] = this.eventType;
    data['description'] = this.description;
    data['eventDate'] = this.eventDate;
    data['createDate'] = this.createDate;
    data['deleteDate'] = this.deleteDate;
    data['picture1Url'] = this.picture1Url;
    data['picture2Url'] = this.picture2Url;
    data['picture3Url'] = this.picture3Url;
    data['picture4Url'] = this.picture4Url;
    data['picture5Url'] = this.picture5Url;
    data['file1Url'] = this.file1Url;
    data['file2Url'] = this.file2Url;
    data['file3Url'] = this.file3Url;
    return data;
  }
}
