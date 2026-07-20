abstract class MenuItem {                      
  static int itemCount = 0;                   

  final String name;                         
  final double basePrice;                     

  MenuItem(this.name, this.basePrice) {       
    itemCount++;                            
  }

  double price();                             

  void show() {                               
    print('$name - ${price()} บาท');          
  }
}

class Drink extends MenuItem {                
  final int toppings;                        

  Drink(String name, double basePrice, this.toppings)
      : super(name, basePrice);              

                                   
  double price() {
    return basePrice + (10 * toppings);      
  }
}

class Food extends MenuItem {                
  final String size;                          

  Food(String name, double basePrice, this.size)
      : super(name, basePrice);               
                                  
  double price() {
    Map<String, double> multiplier = {        
      'S': 1.0,
      'M': 1.2,
      'L': 1.5,
    };

    return basePrice * multiplier[size]!;     
  }
}



class Wallet {
  double _balance = 0;                        

  Wallet(this._balance);                      

  double get balance => _balance;             

  set balance(double value) {                 
    if (value < 0) {                          
      print('ผิดพลาด: ยอดเงินติดลบไม่ได้');
    } else {
      _balance = value;                       
    }
  }

  bool pay(double money) {                    
    if (_balance >= money) {                  
      _balance -= money;                      
      print('ชำระเงินสำเร็จ');
      return true;                            
    }

    print('ยอดเงินไม่พอ');                   
    return false;                             
  }
}

enum OrderStatus {                            
  pending,
  paid,
  cancelled,
}

String statusText(OrderStatus status) {       
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
  List<MenuItem> order = [                    
    Drink('ลาเต้', 45, 2),                   
    Food('ข้าวผัด', 75, 'M'),                 
    Drink('อเมริกาโน่', 45, 0),              
  ];

  double total = 0;                           

  for (MenuItem item in order) {              
    item.show();                             
    total += item.price();                    
  }

  print('ยอดรวมทั้งสิ้น: $total บาท');        

  print('---');

  Wallet wallet = Wallet(300);                

  wallet.balance = -10;                       

  bool success = wallet.pay(total);           

  OrderStatus status;                         

  if (success) {                             
    status = OrderStatus.paid;
  } else {
    status = OrderStatus.pending;
  }

  print('สถานะ: ${statusText(status)}');      
  print('ยอดคงเหลือ: ${wallet.balance} บาท'); 

  wallet.pay(500);                           

  status = OrderStatus.pending;               

  print('สถานะ: ${statusText(status)}');      
  print('ยอดคงเหลือ: ${wallet.balance} บาท'); 

  print('---');

  print('จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}');
}