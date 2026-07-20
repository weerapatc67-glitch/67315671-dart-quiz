const double vatRate = 0.07;

void main() {
  final String shopName = 'Dart Cafe';

  print('ร้าน: $shopName');
  print('อัตราภาษี (vatRate): $vatRate');

  print('---');

  List<String> typemenu = ['เครื่องดื่ม', 'ของคาว, ของหวาน'];
  print('หมวดเมนู: $typemenu');

  Map<String, int> menu = {
    'ชาไทย': 45,
    'คาปูชิโน่': 55,
    'ไข่': 45,
    'ข้าวผัดทะเล': 60,
  };

  print('จำนวนเมนูทั้งหมด: ${menu.length} รายการ');
  print('ราคานม: ${menu['ชาไทย']} บาท');

  print('---');

  print('เมนูราคาตั้งแต่ 50 บาทขึ้นไป: ');

  for (MapEntry<String, int> item in menu.entries) {
    if (item.value >= 50) {
      print('${item.key} : ${item.value}');
    }
  }

  double calcTotal(int price, int qty, [double discount = 0]) {
    return (price * qty - discount) * (1 + vatRate);
  }
  print('---');
  
  print('ยอดสุทธิ (ไม่มีส่วนลด): ${calcTotal(55, 2)} บาท');
  print('ยอดสุทธิ (ส่วนลด10บาท): ${calcTotal(55, 2, 10)} บาท');

  print('---');

  String? coupon;

  print('ความยาวคูปอง: ${coupon?.length ?? 0}');

  coupon ??= 'NO-COUPON';

  print('คูปองหลังกำหนดค่า: $coupon');
}
