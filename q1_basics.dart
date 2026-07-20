const double vatRate =
    0.07; // ค่าคงที่ รู้ค่าตั้งแต่ Compile Time จึงใช้ const ไม่ใช้ final

void main() {  // ฟังก์ชันหลัก เริ่มทำงานของโปรแกรม
  
  final String shopName = 'Dart Cafe'; // ตัวแปรกำหนดค่าได้ครั้งเดียวตอนรันโปรแกรม
    
  print('ร้าน: $shopName'); // แสดงชื่อร้าน
  print('อัตราภาษี (vatRate): $vatRate'); // แสดงอัตราภาษี

  print('---'); // คั่นผลลัพธ์

  List<String> typemenu = [
    'เครื่องดื่ม',
    'ของคาว, ของหวาน',
  ]; // List เก็บหมวดหมู่เมนู
  print('หมวดเมนู: $typemenu'); // แสดง List ทั้งหมด

  Map<String, int> menu = {
    // Map เก็บ ชื่อเมนู(Key) และราคา(Value)
    'ชาไทย': 45,
    'คาปูชิโน่': 55,
    'ไข่': 45,
    'ข้าวผัดทะเล': 60,
  };

  print(
    'จำนวนเมนูทั้งหมด: ${menu.length} รายการ',
  ); // menu.length นับจำนวนข้อมูลใน Map
  print('ราคานม: ${menu['ชาไทย']} บาท'); // เข้าถึงราคาของชาไทยด้วย Key

  print('---'); // คั่นผลลัพธ์

  print('เมนูราคาตั้งแต่ 50 บาทขึ้นไป: '); // แสดงหัวข้อ

  for (MapEntry<String, int> item in menu.entries) {
    // วนลูปอ่านข้อมูลทุกคู่ Key-Value
    if (item.value >= 50) {
      // ถ้าราคามากกว่าหรือเท่ากับ 50
      print('${item.key} : ${item.value}'); // แสดงชื่อเมนูและราคา
    }
  }

  double calcTotal(int price, int qty, [double discount = 0]) {
    // ฟังก์ชันคำนวณยอดรวม
    return (price * qty - discount) *
        (1 + vatRate); // (ราคา×จำนวน-ส่วนลด) แล้วบวก VAT
  }

  print(
    'ยอดสุทธิ (ไม่มีส่วนลด): ${calcTotal(55, 1)} บาท',
  ); // discount ใช้ค่าเริ่มต้น 0
  print(
    'ยอดสุทธิ (ส่วนลด10บาท): ${calcTotal(55, 1, 10)} บาท',
  ); // ส่งส่วนลด 10 บาท

  print('---'); // คั่นผลลัพธ์

  String? coupon; // String? หมายถึงตัวแปรสามารถเป็น null ได้

  print(
    'ความยาวคูปอง: ${coupon?.length ?? 0}',
  ); // ?. ถ้า coupon เป็น null จะไม่เรียก length และ ?? ใช้ 0 แทน

  coupon ??= 'NO-COUPON'; // ถ้า coupon ยังเป็น null ให้กำหนดค่า NO-COUPON

  print('คูปองหลังกำหนดค่า: $coupon'); // แสดงค่าคูปอง
}

