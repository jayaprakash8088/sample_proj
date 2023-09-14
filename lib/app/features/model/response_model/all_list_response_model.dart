class AllListResponseModel {
    String bodyPart;
    String equipment;
    String gifUrl;
    String id;
    String name;
    String target;

    AllListResponseModel({required this.bodyPart, required this.equipment, required this.gifUrl, required this.id,
      required this.name, required this.target});

    factory AllListResponseModel.fromJson(Map<String, dynamic> json) {
        return AllListResponseModel(
            bodyPart: json['bodyPart'],
            equipment: json['equipment'],
            gifUrl: json['gifUrl'],
            id: json['id'],
            name: json['name'],
            target: json['target'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['bodyPart'] = bodyPart;
        data['equipment'] = equipment;
        data['gifUrl'] = gifUrl;
        data['id'] = id;
        data['name'] = name;
        data['target'] = target;
        return data;
    }
}