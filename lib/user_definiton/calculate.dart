import 'user_data.dart';

class Calculate {
  UserData _userData;

  Calculate(this._userData);

  double calculating() {
    double sonuc;

    sonuc = 90 + _userData.gym! - _userData.smokedCigg!;
    sonuc = sonuc + (_userData.height! / _userData.weight!);

    if (_userData.pickedGender == 'Female') {
      return sonuc + 3;
    } else {
      return sonuc - 3;
    }
  }
}
