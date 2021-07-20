class MoviesItemModel {
  String _name;
  String _genre;
  String _director;
  String _starring;
  String _language;
  String _releaseDate;
  String _views;
  String _votes;
  String _posterLink;

  String get name => _name;

  MoviesItemModel(
      this._name,
      this._genre,
      this._director,
      this._starring,
      this._language,
      this._releaseDate,
      this._views,
      this._votes,
      this._posterLink);

  factory MoviesItemModel.fromJson(Map<String, dynamic> json) =>
      MoviesItemModel(
          json['title'],
          json['genre'],
          json['director'].join(" "),
          json['stars'].join(" "),
          json['language'],
          json['releasedDate'].toString(),
          json['pageViews'].toString(),
          json['totalVoted'].toString(),
          json['poster']);

  String get genre => _genre;

  String get posterLink => _posterLink;

  String get votes => _votes;

  String get views => _views;

  String get releaseDate => _releaseDate;

  String get language => _language;

  String get starring => _starring;

  String get director => _director;
}
