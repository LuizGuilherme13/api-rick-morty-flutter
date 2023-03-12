class CharacterDTO {
  int id;
  String name;
  String species;
  String image;
  String status;
  LocationDTO origin;
  LocationDTO location;

  CharacterDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.origin,
    required this.location,
  });

  CharacterDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        image = json['image'],
        status = json['status'],
        origin = LocationDTO.fromJson(json["origin"]),
        location = LocationDTO.fromJson(json["location"]);
}

class LocationDTO {
  String name;
  String url;

  LocationDTO({
    required this.name,
    required this.url,
  });

  LocationDTO.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

class Location {
  int id;
  String name;
  String type;
  String dimension;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
  });

  Location.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        dimension = json['dimension'];
}

class EpisodeDTO {
  int id;
  String name;
  String airDate;
  String episode;

  EpisodeDTO({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  EpisodeDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        airDate = json['air_date'],
        episode = json['episode'];
}
