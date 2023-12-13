class CategoryItem {
  late int id;
  late String title;
  late String color;
  late String iconPath;

  CategoryItem({
    required this.title,
    required this.color,
    required this.iconPath,
    required this.id,
  });

  CategoryItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    color = json['color'];
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['color'] = color;
    data['icon_path'] = iconPath;
    return data;
  }
}
