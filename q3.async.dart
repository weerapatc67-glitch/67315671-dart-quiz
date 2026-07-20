import 'dart:async'; 

Future<Map<String, dynamic>> fetchOrder(int orderId) async { // ฟังก์ชันคืนค่า Future ของ Map
  await Future.delayed(Duration(seconds: 2)); // หน่วงเวลา 2 วินาที

  if (orderId <= 0) { // ถ้า orderId ไม่ถูกต้อง
    throw Exception('รหัสคำสั่งซื้อไม่ถูกต้อง'); // ส่งข้อผิดพลาด
  }

  return { // คืนข้อมูลออเดอร์
    'id': orderId,
    'menu': 'ลาเต้',
    'total': 65.0,
  };
}


Stream<String> trackOrder() async* { // สร้าง Stream แบบ async generator
  yield 'รับออเดอร์แล้ว'; // ส่งข้อความแรก
  await Future.delayed(Duration(seconds: 1)); // รอ 1 วินาที

  yield 'กำลังจัดทำ'; // ส่งข้อความที่สอง
  await Future.delayed(Duration(seconds: 1)); // รอ 1 วินาที

  yield 'จัดส่งเรียบร้อย'; // ส่งข้อความสุดท้าย
}

// ---------------------------
// main
// ---------------------------

Future<void> main() async { // main เป็น async

  print('เริ่มโหลดข้อมูล...'); // แสดงข้อความเริ่มต้น

  await fetchOrder(7) // เรียกกรณีข้อมูลถูกต้อง
      .then((order) { // ได้ข้อมูลสำเร็จ
    print('ได้ข้อมูลออเดอร์: $order');
  }).catchError((error) { // ถ้าเกิดข้อผิดพลาด
    print('เกิดข้อผิดพลาด: $error');
  });

  print('จบรายการ'); // จบการทำงานรอบแรก

  print('---'); // คั่นผลลัพธ์

  await fetchOrder(0) // ทดลองรหัสไม่ถูกต้อง
      .then((order) { // กรณีสำเร็จ
    print('ได้ข้อมูลออเดอร์: $order');
  }).catchError((error) { // กรณีผิดพลาด
    print('เกิดข้อผิดพลาด: $error');
  });

  print('จบรายการ'); // จบการทำงานรอบที่สอง

  print('---'); // คั่นผลลัพธ์

  await for (String status in trackOrder()) { // รับค่าจาก Stream ทีละค่า
    print('สถานะ: $status'); // แสดงสถานะ
  }

  print('ติดตามสถานะเสร็จสิ้น'); // Stream จบแล้ว
}