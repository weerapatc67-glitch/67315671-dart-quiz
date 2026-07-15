abstract class MenuItem {
  String name();
  double basePrice();

  void price() {
    return basePrice;
  }

  void show() {
    print('$name$price');
  }
  class Drink extends Menuitem {
  String? topping;
  print('basePrice + (10 × toppings'));

  void displaySchoolInfo() {
    print("โรงเรียน: $schoolName");
  }
}

}
