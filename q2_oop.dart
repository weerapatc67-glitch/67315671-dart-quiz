abstract class MenuItem {                      // คลาสต้นแบบ สร้าง Object โดยตรงไม่ได้
  static int itemCount = 0;                   // นับจำนวนเมนูที่ถูกสร้างทั้งหมด

  final String name;                          // ชื่อเมนู (แก้ไขไม่ได้)
  final double basePrice;                     // ราคาพื้นฐาน (แก้ไขไม่ได้)

  MenuItem(this.name, this.basePrice) {       // Constructor รับชื่อและราคาพื้นฐาน
    itemCount++;                              // เพิ่มจำนวนเมนูทุกครั้งที่สร้าง Object
  }

  double price();                             // เมธอดนามธรรม ลูกคลาสต้องเขียนเอง

  void show() {                               // เมธอดแสดงข้อมูลเมนู
    print('$name - ${price()} บาท');          // เรียก price() ของคลาสลูก
  }
}

class Drink extends MenuItem {                // Drink สืบทอดจาก MenuItem
  final int toppings;                         // จำนวนท็อปปิ้ง

  Drink(String name, double basePrice, this.toppings)
      : super(name, basePrice);               // ส่ง name และ basePrice ไปยังคลาสแม่

  @override                                   // Override เมธอดจากคลาสแม่
  double price() {
    return basePrice + (10 * toppings);       // ราคา = basePrice + (10 × toppings)
  }
}

class Food extends MenuItem {                 // Food สืบทอดจาก MenuItem
  final String size;                          // ขนาด S, M หรือ L

  Food(String name, double basePrice, this.size)
      : super(name, basePrice);               // ส่งข้อมูลไปยังคลาสแม่

  @override                                   // Override เมธอด price()
  double price() {
    Map<String, double> multiplier = {        // เก็บตัวคูณของแต่ละขนาด
      'S': 1.0,
      'M': 1.2,
      'L': 1.5,
    };

    return basePrice * multiplier[size]!;     // คำนวณราคาตามขนาด
  }
}



class Wallet {
  double _balance = 0;                        // ตัวแปร private

  Wallet(this._balance);                      // Constructor

  double get balance => _balance;             // Getter

  set balance(double value) {                 // Setter
    if (value < 0) {                          // ตรวจสอบยอดเงิน
      print('ผิดพลาด: ยอดเงินติดลบไม่ได้');
    } else {
      _balance = value;                       // เปลี่ยนยอดเงิน
    }
  }

  bool pay(double money) {                    // เมธอดชำระเงิน
    if (_balance >= money) {                  // ถ้าเงินพอ
      _balance -= money;                      // หักเงิน
      print('ชำระเงินสำเร็จ');
      return true;                            // คืนค่า true
    }

    print('ยอดเงินไม่พอ');                    // เงินไม่พอ
    return false;                             // คืนค่า false
  }
}

enum OrderStatus {                            // สถานะคำสั่งซื้อ
  pending,
  paid,
  cancelled,
}

String statusText(OrderStatus status) {       // แปลง enum เป็นข้อความ
  switch (status) {
    case OrderStatus.pending:
      return 'รอชำระเงิน';

    case OrderStatus.paid:
      return 'ชำระเงินแล้ว';

    case OrderStatus.cancelled:
      return 'ยกเลิกคำสั่งซื้อ';
  }
}

void main() {
  List<MenuItem> order = [                    // List เก็บ MenuItem ทุกชนิด
    Drink('ลาเต้', 45, 2),                    // 45 + (10×2) = 65
    Food('ข้าวผัด', 75, 'M'),                 // 75 × 1.2 = 90
    Drink('อเมริกาโน่', 45, 0),              // 45 + (10×0) = 45
  ];

  double total = 0;                           // เก็บยอดรวม

  for (MenuItem item in order) {              // วนลูปทุกเมนู
    item.show();                              // แสดงข้อมูลเมนู
    total += item.price();                    // รวมราคา
  }

  print('ยอดรวมทั้งสิ้น: $total บาท');        // แสดงยอดรวม

  print('---');

  Wallet wallet = Wallet(300);                // สร้าง Wallet

  wallet.balance = -10;                       // ทดลองกำหนดยอดติดลบ

  bool success = wallet.pay(total);           // ทดลองชำระเงิน

  OrderStatus status;                         // ตัวแปรเก็บสถานะ

  if (success) {                              // ถ้าจ่ายสำเร็จ
    status = OrderStatus.paid;
  } else {
    status = OrderStatus.pending;
  }

  print('สถานะ: ${statusText(status)}');      // แสดงสถานะ
  print('ยอดคงเหลือ: ${wallet.balance} บาท'); // แสดงเงินคงเหลือ

  wallet.pay(500);                            // ทดลองจ่ายเงินเกิน

  status = OrderStatus.pending;               // เปลี่ยนสถานะ

  print('สถานะ: ${statusText(status)}');      // แสดงสถานะ
  print('ยอดคงเหลือ: ${wallet.balance} บาท'); // แสดงเงินคงเหลือ

  print('---');

  print('จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}'); // แสดงจำนวนเมนูที่สร้าง
}