import 'dart:convert';

PassengersResponseModel passengersResponseModelFromJson(String str) =>
    PassengersResponseModel.fromJson(json.decode(str));

String passengersResponseModelToJson(PassengersResponseModel data) =>
    json.encode(data.toJson());

class PassengersResponseModel {
  int? totalPassengers;
  int? totalPages;
  List<Passenger>? data;

  PassengersResponseModel({
    this.totalPassengers,
    this.totalPages,
    this.data,
  });

  factory PassengersResponseModel.fromJson(Map<String, dynamic> json) =>
      PassengersResponseModel(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Passenger>.from(
            json["data"].map((x) => Passenger.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Passenger {
  String? id;
  PassengerName? name;
  int? trips;
  List<Airline>? airline;
  int? v;

  Passenger({
    this.id,
    this.name,
    this.trips,
    this.airline,
    this.v,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"],
        name: PassengerNameValues.map[json["name"]],
        trips: json["trips"],
        airline:
            List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": PassengerNameValues.reverse[name],
        "trips": trips,
        "airline": List<dynamic>.from(airline!.map((x) => x.toJson())),
        "__v": v,
      };
}

class Airline {
  Id? id;
  int? airlineId;
  AirlineName? name;
  Country? country;
  String? logo;
  Slogan? slogan;
  HeadQuaters? headQuaters;
  Website? website;
  String? established;
  int? v;

  Airline({
    this.id,
    this.airlineId,
    this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headQuaters,
    this.website,
    this.established,
    this.v,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: idValues.map[json["_id"]],
        airlineId: json["id"],
        name: airlineNameValues.map[json["name"]],
        country: countryValues.map[json["country"]],
        logo: json["logo"],
        slogan: sloganValues.map[json["slogan"]],
        headQuaters: headQuatersValues.map[json["head_quaters"]],
        website: websiteValues.map[json["website"]],
        established: json["established"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "id": airlineId,
        "name": airlineNameValues.reverse[name],
        "country": countryValues.reverse[country],
        "logo": logo,
        "slogan": sloganValues.reverse[slogan],
        "head_quaters": headQuatersValues.reverse[headQuaters],
        "website": websiteValues.reverse[website],
        "established": established,
        "__v": v,
      };
}

enum Country { SRI_LANKA }

final countryValues = EnumValues({"Sri Lanka": Country.SRI_LANKA});

enum HeadQuaters { KATUNAYAKE_SRI_LANKA }

final headQuatersValues =
    EnumValues({"Katunayake, Sri Lanka": HeadQuaters.KATUNAYAKE_SRI_LANKA});

enum Id { THE_6453_BEB43837279254_E7_CEF1 }

final idValues = EnumValues(
    {"6453beb43837279254e7cef1": Id.THE_6453_BEB43837279254_E7_CEF1});

enum AirlineName { SRI_LANKAN_AIRWAYS_667 }

final airlineNameValues =
    EnumValues({"Sri Lankan Airways 667": AirlineName.SRI_LANKAN_AIRWAYS_667});

enum Slogan { FROM_SRI_LANKA }

final sloganValues = EnumValues({"From Sri Lanka": Slogan.FROM_SRI_LANKA});

enum Website { WWW_SRILANKAAIRWAYS_COM }

final websiteValues =
    EnumValues({"www.srilankaairways.com": Website.WWW_SRILANKAAIRWAYS_COM});

enum PassengerName { JOHN_DOE, FARIHA_PERVEZ }

final PassengerNameValues = EnumValues({
  "Fariha Pervez": PassengerName.FARIHA_PERVEZ,
  "John Doe": PassengerName.JOHN_DOE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
