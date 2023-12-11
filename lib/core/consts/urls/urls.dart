class Urls {
  //Auth
  static const String register = "User/Add";
  static const String login = "Auth/Login";
  static const String getMe = "User/GetMe";
  static const String updateUser = "User/Update";
  static const String changePassword = "User/UpdateUserPassword";
  static const String getAddresses = "Address/GetListFromFirmAndUser?userId=";
  static const String addAddress = "Address/Add";
  static const String deleteAddress = "Address/Delete/";
  static const String updateAddress = "Address/Update";
  static const String getCountries = "Address/GetCountries/countries";
  static const String getCities = "Address/GetCities/cities/";
  static const String getDistricts = "Address/GetDistricts/districts/";
  static const String getLanguages = "Languages/Get";
  static const String createOTP = "Auth/CreateOtp?";
  static const String getUser = "User/GetById/";
  static const String uploadDocument = "UserDocuments/Add";
  static const String getDocumentTypes = "DocumentType/List";
  static const String getMyDocuments = "UserDocuments/GetByUserId/";
  static const String deleteDocument = "UserDocuments/Delete/";
  static const String userFiles = "UserFiles";
  static const String addPrefferedLocation = "PreferredLocation/Add";
  static const String getPrefferedLocations = "PreferredLocation/GetByUserId/";
  static const String deletePrefferedLocation = "PreferredLocation/Delete/";
  
  //Egaraj
  static const String getVehicles = "Vehicle/GetList?PageIndex=0&PageSize=10";
  static const String getVehicleDetail = "Vehicle/GetVehicleDetail";
  static const String getLoadFeatures = "LoadFeatures/GetList?PageIndex=0&PageSize=999";
  static const String createCarREquest = "Demand/Add";
  static const String updateCarRequest = "Demand/UpdateDemand";
  static const String getCarRequests = "Demand/GetListByQuery?";
  static const String getMyOFfers = "Offers/GetListMyOffers?";
  static const String deleteDemand = "Demand/Delete/";
  static const String addOffer = "Offers/Add";

}
