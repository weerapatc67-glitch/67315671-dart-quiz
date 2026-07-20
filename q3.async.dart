Future<Map<String, dynamic>> fetchOrder(int OrderId) async {
  await Future.delayed(Duration(seconds: 2));

  if (OrderId <= 0) {
    throw Exception("รหัสคำสั่งซื้อไม่ถูกต้อง");
  }

  return {"id": OrderId, "menu": "ลาเต้", "total": 65.0};
}

Stream<String> trackOrder() async* {
  yield('รับออร์เดอร์แล้ว');
   await Future.delayed(Duration(seconds: 1));

  yield('กำลังจัดทำ');
   await Future.delayed(Duration(seconds: 1));

  yield('จัดส่งเรียบร้อย');
   await Future.delayed(Duration(seconds: 1));

}

Future<void> main() async {
  print('เริ่มโหลดข้อมูล...');

  await fetchOrder(7)
      .then((order) {
        print('ได้ข้อมูลออเดอร์: $order');
      })
      .catchError((error) {
        print('เกิดข้อผิดพลาด: $error');
      });

  print('จบรายการ');

  print('---');

  await fetchOrder(0)
      .then((order) {
        print('ได้ข้อมูลออเดอร์: $order');
      })
      .catchError((error) {
        print('เกิดข้อผิดพลาด: $error');
      });

  print('จบรายการ');

  print('---');

  await for (String status in trackOrder()) {
    print("สถานะ: $status");
  }

  print('ติดตามสถานะเสร็จสิ้น');
}
