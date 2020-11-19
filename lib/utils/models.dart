import 'dart:convert';

List<Country> countriesFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countriesToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    this.name,
    this.topLevelDomain,
    this.alpha2Code,
    this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    this.gini,
    this.timezones,
    this.borders,
    this.nativeName,
    this.numericCode,
    this.currencies,
    this.languages,
    this.translations,
    this.flag,
    this.regionalBlocs,
    this.cioc,
  });

  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  Region region;
  String subregion;
  int population;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  List<Currency> currencies;
  List<Language> languages;
  Translations translations;
  String flag;
  List<RegionalBloc> regionalBlocs;
  String cioc;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
    alpha2Code: json["alpha2Code"],
    alpha3Code: json["alpha3Code"],
    callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
    capital: json["capital"],
    altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
    region: regionValues.map[json["region"]],
    subregion: json["subregion"],
    population: json["population"],
    latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
    demonym: json["demonym"],
    area: json["area"] == null ? null : json["area"].toDouble(),
    gini: json["gini"] == null ? null : json["gini"].toDouble(),
    timezones: List<String>.from(json["timezones"].map((x) => x)),
    borders: List<String>.from(json["borders"].map((x) => x)),
    nativeName: json["nativeName"],
    numericCode: json["numericCode"] == null ? null : json["numericCode"],
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    translations: Translations.fromJson(json["translations"]),
    flag: json["flag"],
    regionalBlocs: List<RegionalBloc>.from(json["regionalBlocs"].map((x) => RegionalBloc.fromJson(x))),
    cioc: json["cioc"] == null ? null : json["cioc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
    "alpha2Code": alpha2Code,
    "alpha3Code": alpha3Code,
    "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
    "capital": capital,
    "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
    "region": regionValues.reverse[region],
    "subregion": subregion,
    "population": population,
    "latlng": List<dynamic>.from(latlng.map((x) => x)),
    "demonym": demonym,
    "area": area == null ? null : area,
    "gini": gini == null ? null : gini,
    "timezones": List<dynamic>.from(timezones.map((x) => x)),
    "borders": List<dynamic>.from(borders.map((x) => x)),
    "nativeName": nativeName,
    "numericCode": numericCode == null ? null : numericCode,
    "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "translations": translations.toJson(),
    "flag": flag,
    "regionalBlocs": List<dynamic>.from(regionalBlocs.map((x) => x.toJson())),
    "cioc": cioc == null ? null : cioc,
  };
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  String code;
  String name;
  String symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    symbol: json["symbol"] == null ? null : json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "symbol": symbol == null ? null : symbol,
  };
}

class Language {
  Language({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  String iso6391;
  String iso6392;
  String name;
  String nativeName;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    iso6391: json["iso639_1"] == null ? null : json["iso639_1"],
    iso6392: json["iso639_2"],
    name: json["name"],
    nativeName: json["nativeName"],
  );

  Map<String, dynamic> toJson() => {
    "iso639_1": iso6391 == null ? null : iso6391,
    "iso639_2": iso6392,
    "name": name,
    "nativeName": nativeName,
  };
}

enum Region { ASIA, EUROPE, AFRICA, OCEANIA, AMERICAS, POLAR, EMPTY }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Asia": Region.ASIA,
  "": Region.EMPTY,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA,
  "Polar": Region.POLAR
});

class RegionalBloc {
  RegionalBloc({
    this.acronym,
    this.name,
    this.otherAcronyms,
    this.otherNames,
  });

  Acronym acronym;
  Name name;
  List<OtherAcronym> otherAcronyms;
  List<OtherName> otherNames;

  factory RegionalBloc.fromJson(Map<String, dynamic> json) => RegionalBloc(
    acronym: acronymValues.map[json["acronym"]],
    name: nameValues.map[json["name"]],
    otherAcronyms: List<OtherAcronym>.from(json["otherAcronyms"].map((x) => otherAcronymValues.map[x])),
    otherNames: List<OtherName>.from(json["otherNames"].map((x) => otherNameValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "acronym": acronymValues.reverse[acronym],
    "name": nameValues.reverse[name],
    "otherAcronyms": List<dynamic>.from(otherAcronyms.map((x) => otherAcronymValues.reverse[x])),
    "otherNames": List<dynamic>.from(otherNames.map((x) => otherNameValues.reverse[x])),
  };
}

enum Acronym { SAARC, EU, CEFTA, AU, AL, CARICOM, USAN, EEU, CAIS, ASEAN, NAFTA, PA, EFTA }

final acronymValues = EnumValues({
  "AL": Acronym.AL,
  "ASEAN": Acronym.ASEAN,
  "AU": Acronym.AU,
  "CAIS": Acronym.CAIS,
  "CARICOM": Acronym.CARICOM,
  "CEFTA": Acronym.CEFTA,
  "EEU": Acronym.EEU,
  "EFTA": Acronym.EFTA,
  "EU": Acronym.EU,
  "NAFTA": Acronym.NAFTA,
  "PA": Acronym.PA,
  "SAARC": Acronym.SAARC,
  "USAN": Acronym.USAN
});

enum Name { SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION, EUROPEAN_UNION, CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT, AFRICAN_UNION, ARAB_LEAGUE, CARIBBEAN_COMMUNITY, UNION_OF_SOUTH_AMERICAN_NATIONS, EURASIAN_ECONOMIC_UNION, CENTRAL_AMERICAN_INTEGRATION_SYSTEM, ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS, NORTH_AMERICAN_FREE_TRADE_AGREEMENT, PACIFIC_ALLIANCE, EUROPEAN_FREE_TRADE_ASSOCIATION }

final nameValues = EnumValues({
  "African Union": Name.AFRICAN_UNION,
  "Arab League": Name.ARAB_LEAGUE,
  "Association of Southeast Asian Nations": Name.ASSOCIATION_OF_SOUTHEAST_ASIAN_NATIONS,
  "Caribbean Community": Name.CARIBBEAN_COMMUNITY,
  "Central American Integration System": Name.CENTRAL_AMERICAN_INTEGRATION_SYSTEM,
  "Central European Free Trade Agreement": Name.CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
  "Eurasian Economic Union": Name.EURASIAN_ECONOMIC_UNION,
  "European Free Trade Association": Name.EUROPEAN_FREE_TRADE_ASSOCIATION,
  "European Union": Name.EUROPEAN_UNION,
  "North American Free Trade Agreement": Name.NORTH_AMERICAN_FREE_TRADE_AGREEMENT,
  "Pacific Alliance": Name.PACIFIC_ALLIANCE,
  "South Asian Association for Regional Cooperation": Name.SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
  "Union of South American Nations": Name.UNION_OF_SOUTH_AMERICAN_NATIONS
});

enum OtherAcronym { UNASUR, UNASUL, UZAN, EAEU, SICA }

final otherAcronymValues = EnumValues({
  "EAEU": OtherAcronym.EAEU,
  "SICA": OtherAcronym.SICA,
  "UNASUL": OtherAcronym.UNASUL,
  "UNASUR": OtherAcronym.UNASUR,
  "UZAN": OtherAcronym.UZAN
});

enum OtherName { EMPTY, UNION_AFRICAINE, UNIO_AFRICANA, UNIN_AFRICANA, UMOJA_WA_AFRIKA, OTHER_NAME, JMI_AT_AD_DUWAL_AL_ARABYAH, LEAGUE_OF_ARAB_STATES, COMUNIDAD_DEL_CARIBE, COMMUNAUT_CARIBENNE, CARIBISCHE_GEMEENSCHAP, UNIN_DE_NACIONES_SURAMERICANAS, UNIO_DE_NAES_SUL_AMERICANAS, UNIE_VAN_ZUID_AMERIKAANSE_NATIES, SOUTH_AMERICAN_UNION, SISTEMA_DE_LA_INTEGRACIN_CENTROAMERICANA, TRATADO_DE_LIBRE_COMERCIO_DE_AMRICA_DEL_NORTE, ACCORD_DE_LIBRE_CHANGE_NORD_AMRICAIN, ALIANZA_DEL_PACFICO }

final otherNameValues = EnumValues({
  "Accord de Libre-échange Nord-Américain": OtherName.ACCORD_DE_LIBRE_CHANGE_NORD_AMRICAIN,
  "Alianza del Pacífico": OtherName.ALIANZA_DEL_PACFICO,
  "Caribische Gemeenschap": OtherName.CARIBISCHE_GEMEENSCHAP,
  "Communauté Caribéenne": OtherName.COMMUNAUT_CARIBENNE,
  "Comunidad del Caribe": OtherName.COMUNIDAD_DEL_CARIBE,
  "الاتحاد الأفريقي": OtherName.EMPTY,
  "Jāmiʻat ad-Duwal al-ʻArabīyah": OtherName.JMI_AT_AD_DUWAL_AL_ARABYAH,
  "League of Arab States": OtherName.LEAGUE_OF_ARAB_STATES,
  "جامعة الدول العربية": OtherName.OTHER_NAME,
  "Sistema de la Integración Centroamericana,": OtherName.SISTEMA_DE_LA_INTEGRACIN_CENTROAMERICANA,
  "South American Union": OtherName.SOUTH_AMERICAN_UNION,
  "Tratado de Libre Comercio de América del Norte": OtherName.TRATADO_DE_LIBRE_COMERCIO_DE_AMRICA_DEL_NORTE,
  "Umoja wa Afrika": OtherName.UMOJA_WA_AFRIKA,
  "Unie van Zuid-Amerikaanse Naties": OtherName.UNIE_VAN_ZUID_AMERIKAANSE_NATIES,
  "Unión Africana": OtherName.UNIN_AFRICANA,
  "Unión de Naciones Suramericanas": OtherName.UNIN_DE_NACIONES_SURAMERICANAS,
  "Union africaine": OtherName.UNION_AFRICAINE,
  "União Africana": OtherName.UNIO_AFRICANA,
  "União de Nações Sul-Americanas": OtherName.UNIO_DE_NAES_SUL_AMERICANAS
});

class Translations {
  Translations({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  });

  String de;
  String es;
  String fr;
  String ja;
  String it;
  String br;
  String pt;
  String nl;
  String hr;
  String fa;

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    de: json["de"] == null ? null : json["de"],
    es: json["es"] == null ? null : json["es"],
    fr: json["fr"] == null ? null : json["fr"],
    ja: json["ja"] == null ? null : json["ja"],
    it: json["it"] == null ? null : json["it"],
    br: json["br"],
    pt: json["pt"],
    nl: json["nl"] == null ? null : json["nl"],
    hr: json["hr"] == null ? null : json["hr"],
    fa: json["fa"],
  );

  Map<String, dynamic> toJson() => {
    "de": de == null ? null : de,
    "es": es == null ? null : es,
    "fr": fr == null ? null : fr,
    "ja": ja == null ? null : ja,
    "it": it == null ? null : it,
    "br": br,
    "pt": pt,
    "nl": nl == null ? null : nl,
    "hr": hr == null ? null : hr,
    "fa": fa,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}