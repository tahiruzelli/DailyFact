extension GetVehicleImage on int {
  String get getVehicleImage {
    switch (this) {
      case 4:
        return "assets/images/tir.png";
      case 3:
        return "assets/images/kirkayak.png";
      case 2:
        return "assets/images/kamyon.png";
      case 1:
        return "assets/images/kamyonet.png";
      default:
        return "";
    }
  }
}
