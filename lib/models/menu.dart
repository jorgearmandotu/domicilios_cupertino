import 'dart:convert';

List<Menu> menuFromJson(String str) => new List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
    String id;
    String name;
    String portion;
    String image;
    String price;
    String category;

    Menu({
        this.id,
        this.name,
        this.portion,
        this.image,
        this.price,
        this.category,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => new Menu(
        id: json["id"],
        name: json["name"],
        portion: json["portion"],
        image: json["image"],
        price: json["price"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "portion": portion,
        "image": image,
        "price": price,
        "category": category,
    };
}

/*class Menu {
  String id;
  String name;
  String portion;
  String image;
  String price;
  String category;

  Menu({this.id, this.name, this.portion, this.image, this.price, this.category});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    portion = json['portion'];
    image = json['image'];
    price = json['price'];
    category = json['category'];
  }
}

class MenuModel {
  List<Menu> results;

  MenuModel.fromJson(Map<String, dynamic>json){
    if(json != null){
      results = new List<Menu>();
      json['Menu'].forEach((v){
        results.add(new Menu.fromJson(v));
      });
    }
  }
}*/