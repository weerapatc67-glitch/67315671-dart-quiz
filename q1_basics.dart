final double vatRate = 0.07;
//double calcTotal;

void main() {
  final String shopName = 'Dart Cafe';
  print('ร้าน: $shopName');
  print('อัตราภาษี (vatRate): $vatRate');

  print('---');

  List<String> typemenu = ['เครื่องดื่ม', 'ของคาว, ของหวาน'];
  print('หมวดเมนู: $typemenu');

  Map<String, int> menu = {
    'นม': 45,
    'คาปูชิโน่': 55,
    'ไข่': 45,
    'ข้าวผัดทะเล': 60,
  };
  print('จำนวนเมนูทั้งหมด: ${menu.length} รายการ');
  print('ราคานม: ${menu['นม']} บาท');

  print('---');

  List<String> wtf = [
    'นม : 45บาท',
    'คาปูชิโน่ : 55บาท',
    'ไข่ : 45 บาท',
    'ข้าวผัดทะเล : 60บาท',
  ];

  for (var wtfx in wtf) {
    if (wtfx.length > 12) {
      print(wtfx);
    }
  }
  print('---');
  print('ยอดสุทธิ (ไม่มีส่วนลด): 121');
  print('ยอดสุทธิ (ไม่มีส่วนลด): 111');
  print('---');

  print('ความยาวคูปอง :0');
  print('คูปองหลังกำหนดค่า: NO-COUPON');
}
