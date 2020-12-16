// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    this.cards,
  });

  List<CardPoke> cards;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
    cards: List<CardPoke>.from(json["cards"].map((x) => CardPoke.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
  };
}

class CardPoke {
  CardPoke({
    this.id,
    this.name,
    this.nationalPokedexNumber,
    this.imageUrl,
    this.imageUrlHiRes,
    this.types,
    this.supertype,
    this.subtype,
    this.evolvesFrom,
    this.hp,
    this.number,
    this.artist,
    this.rarity,
    this.series,
    this.cardSet,
    this.setCode,
    this.attacks,
    this.weaknesses,
    this.retreatCost,
    this.convertedRetreatCost,
    this.resistances,
    this.text,
    this.ability,
  });

  String id;
  String name;
  int nationalPokedexNumber;
  String imageUrl;
  String imageUrlHiRes;
  List<RetreatCost> types;
  Supertype supertype;
  String subtype;
  String evolvesFrom;
  String hp;
  String number;
  String artist;
  Rarity rarity;
  String series;
  String cardSet;
  String setCode;
  List<Attack> attacks;
  List<Resistance> weaknesses;
  List<RetreatCost> retreatCost;
  int convertedRetreatCost;
  List<Resistance> resistances;
  List<String> text;
  Ability ability;

  factory CardPoke.fromJson(Map<String, dynamic> json) => CardPoke(
    id: json["id"],
    name: json["name"],
    nationalPokedexNumber: json["nationalPokedexNumber"] == null ? null : json["nationalPokedexNumber"],
    imageUrl: json["imageUrl"],
    imageUrlHiRes: json["imageUrlHiRes"],
    types: json["types"] == null ? null : List<RetreatCost>.from(json["types"].map((x) => retreatCostValues.map[x])),
    supertype: supertypeValues.map[json["supertype"]],
    subtype: json["subtype"],
    evolvesFrom: json["evolvesFrom"] == null ? null : json["evolvesFrom"],
    hp: json["hp"] == null ? null : json["hp"],
    number: json["number"],
    artist: json["artist"],
    rarity: rarityValues.map[json["rarity"]],
    series: json["series"],
    cardSet: json["set"],
    setCode: json["setCode"],
    attacks: json["attacks"] == null ? null : List<Attack>.from(json["attacks"].map((x) => Attack.fromJson(x))),
    weaknesses: json["weaknesses"] == null ? null : List<Resistance>.from(json["weaknesses"].map((x) => Resistance.fromJson(x))),
    retreatCost: json["retreatCost"] == null ? null : List<RetreatCost>.from(json["retreatCost"].map((x) => retreatCostValues.map[x])),
    convertedRetreatCost: json["convertedRetreatCost"] == null ? null : json["convertedRetreatCost"],
    resistances: json["resistances"] == null ? null : List<Resistance>.from(json["resistances"].map((x) => Resistance.fromJson(x))),
    text: json["text"] == null ? null : List<String>.from(json["text"].map((x) => x)),
    ability: json["ability"] == null ? null : Ability.fromJson(json["ability"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nationalPokedexNumber": nationalPokedexNumber == null ? null : nationalPokedexNumber,
    "imageUrl": imageUrl,
    "imageUrlHiRes": imageUrlHiRes,
    "types": types == null ? null : List<dynamic>.from(types.map((x) => retreatCostValues.reverse[x])),
    "supertype": supertypeValues.reverse[supertype],
    "subtype": subtype,
    "evolvesFrom": evolvesFrom == null ? null : evolvesFrom,
    "hp": hp == null ? null : hp,
    "number": number,
    "artist": artist,
    "rarity": rarityValues.reverse[rarity],
    "series": series,
    "set": cardSet,
    "setCode": setCode,
    "attacks": attacks == null ? null : List<dynamic>.from(attacks.map((x) => x.toJson())),
    "weaknesses": weaknesses == null ? null : List<dynamic>.from(weaknesses.map((x) => x.toJson())),
    "retreatCost": retreatCost == null ? null : List<dynamic>.from(retreatCost.map((x) => retreatCostValues.reverse[x])),
    "convertedRetreatCost": convertedRetreatCost == null ? null : convertedRetreatCost,
    "resistances": resistances == null ? null : List<dynamic>.from(resistances.map((x) => x.toJson())),
    "text": text == null ? null : List<dynamic>.from(text.map((x) => x)),
    "ability": ability == null ? null : ability.toJson(),
  };
}

class Ability {
  Ability({
    this.name,
    this.text,
    this.type,
  });

  String name;
  String text;
  Type type;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    name: json["name"],
    text: json["text"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "text": text,
    "type": typeValues.reverse[type],
  };
}

enum Type { POK_POWER, POK_BODY, ABILITY }

final typeValues = EnumValues({
  "Ability": Type.ABILITY,
  "Poké-Body": Type.POK_BODY,
  "Poké-Power": Type.POK_POWER
});

class Attack {
  Attack({
    this.cost,
    this.name,
    this.text,
    this.damage,
    this.convertedEnergyCost,
  });

  List<RetreatCost> cost;
  String name;
  String text;
  String damage;
  int convertedEnergyCost;

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
    cost: List<RetreatCost>.from(json["cost"].map((x) => retreatCostValues.map[x])),
    name: json["name"],
    text: json["text"],
    damage: json["damage"],
    convertedEnergyCost: json["convertedEnergyCost"],
  );

  Map<String, dynamic> toJson() => {
    "cost": List<dynamic>.from(cost.map((x) => retreatCostValues.reverse[x])),
    "name": name,
    "text": text,
    "damage": damage,
    "convertedEnergyCost": convertedEnergyCost,
  };
}

enum RetreatCost { COLORLESS, FIGHTING, DARKNESS, PSYCHIC, GRASS, METAL, LIGHTNING, WATER, FREE, FIRE, FAIRY }

final retreatCostValues = EnumValues({
  "Colorless": RetreatCost.COLORLESS,
  "Darkness": RetreatCost.DARKNESS,
  "Fairy": RetreatCost.FAIRY,
  "Fighting": RetreatCost.FIGHTING,
  "Fire": RetreatCost.FIRE,
  "Free": RetreatCost.FREE,
  "Grass": RetreatCost.GRASS,
  "Lightning": RetreatCost.LIGHTNING,
  "Metal": RetreatCost.METAL,
  "Psychic": RetreatCost.PSYCHIC,
  "Water": RetreatCost.WATER
});

enum Rarity { UNCOMMON, COMMON, RARE_HOLO_V, RARE_HOLO_LV_X, RARE_HOLO_EX, RARE_HOLO, EMPTY, RARE, RARE_HOLO_VMAX }

final rarityValues = EnumValues({
  "Common": Rarity.COMMON,
  "": Rarity.EMPTY,
  "Rare": Rarity.RARE,
  "Rare Holo": Rarity.RARE_HOLO,
  "Rare Holo EX": Rarity.RARE_HOLO_EX,
  "Rare Holo Lv.X": Rarity.RARE_HOLO_LV_X,
  "Rare Holo V": Rarity.RARE_HOLO_V,
  "Rare Holo VMAX": Rarity.RARE_HOLO_VMAX,
  "Uncommon": Rarity.UNCOMMON
});

class Resistance {
  Resistance({
    this.type,
    this.value,
  });

  RetreatCost type;
  String value;

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
    type: retreatCostValues.map[json["type"]],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": retreatCostValues.reverse[type],
    "value": value,
  };
}

enum Supertype { POKMON, TRAINER, ENERGY }

final supertypeValues = EnumValues({
  "Energy": Supertype.ENERGY,
  "Pokémon": Supertype.POKMON,
  "Trainer": Supertype.TRAINER
});

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
