String normalizeModelNumber(String modelNumber) {
  return modelNumber.replaceAll(' ', '');
}

String normalizeVehicleColor(String Vcolor) {
  return Vcolor.replaceAll(" ", "").toUpperCase();
}

String convertGoogleDriveUrl(String url) {
  var fileId = url.split('/d/')[1].split('/')[0];
  var newUrl = 'https://drive.google.com/uc?export=download&id=$fileId';

  return newUrl;
}
