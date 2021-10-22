class UserRole{
  String? designation;
  int? level;

  UserRole({this.designation, this.level});
  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      designation : json["designation"] ?? "non defini",
      level : json["level"] ?? 0,
    );
  }

}

class Organisation{
  int? id;
  String? designation;
  String? descripttion;
  Type? type;

  Organisation({this.id, this.designation, this.descripttion, this.type});

  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
      id : json["id"] ?? 0,
      designation : json["designation"] ?? "non defini",
      descripttion: json["description"] ?? "non defini",
      type : Type.fromJson(json["type"])
    );
  }
}


class Type  {
  String? designation;

  Type({this.designation});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      designation : json["designation"] ?? "non defini",
    );
  }
}

class UserModel {
  int? id;
  String? email;
  String? nom;
  String? prenom;
  String? profil; //pdp link
  UserRole? role;
  String? code;
  Organisation? organisation;

  UserModel({this.id, this.email, this.nom, this.prenom, this.profil, this.role, this.code, this.organisation});

    factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id : json["id"] ?? 0,
      email : json["email"] ?? "...",
      nom : json["nom"] ?? "nom",
      prenom : json["prenom"] ?? "prenom",
      profil : json["profil"] ?? "/assets/default_pdp.png",
      role : UserRole.fromJson(json["useRole"]),
      code : json["code"] ?? " ",
      organisation: Organisation.fromJson(json["organisation"])
    );
  }
}