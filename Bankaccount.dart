import 'dart:io';
void main() {
  Bankaccount user = Bankaccount();
  Bankaccount admin = Bankaccount();
  user.AccountHoldername = "admin";
  user.Accountnumber = "0123456789";
  user.Password = "admin123";
  user.isactive = true;
  user.amount = "50000";
  user._balance = -25000;
  admin.AccountHoldername = "admin";
  admin._balance = 1000;
  admin.isactive = true;
  List<Bankaccount> accounts = [user, admin];
  user.Register();
  user.setupLogin();
  user.Login();
  user.reactiveAccount();
  user.Transfer(accounts);
}

class Bankaccount{
  String? Accountnumber;
  String? AccountHoldername;
  String? Email;
  String? Password;
  String? Phonenumber;
  String? NIC;
  String? DateofBirth;
  String? Gender;
  bool? isactive;
  String? amount;
  double? _balance = 0.0;

  Bankaccount(){
     this.AccountHoldername;
     this.Accountnumber;
     this.Email = Email;
     this.Password;
     this.Phonenumber;
     this.NIC;
     this.DateofBirth;
     this.Gender;
     this.isactive;
     this.amount;
     this._balance;



  }

  Register(){
    stdout.write("Enter a full name: ");
    AccountHoldername =  stdin.readLineSync();
    stdout.write("Enter a password: ");
    Password = stdin.readLineSync(); 
    stdout.write("Enter a NIC number: ");
    NIC = stdin.readLineSync();
    stdout.write("Enter a Email: ");
    Email = stdin.readLineSync();
    stdout.write("Enter a Phone number: ");
    Phonenumber = stdin.readLineSync();
    stdout.write("Enter a Date of birth: ");
    DateofBirth = stdin.readLineSync();
    stdout.write("Enter a Gender: ");
    Gender = stdin.readLineSync();
    if ((AccountHoldername == AccountHoldername && Password == Password && NIC == NIC) && (Email == Email && Phonenumber == Phonenumber) && (DateofBirth == DateofBirth && Gender == Gender)){
      print("Register successfully.");
    } else { 
      print("Account is not register.");
    }

  } 

  Login(){
    stdout.write("Enter a username: ");
    AccountHoldername = stdin.readLineSync();
    stdout.write("Enter a password: ");
    Password = stdin.readLineSync();
    if (AccountHoldername== AccountHoldername && Password == Password){
      print("Account login successfully.");
    } else { 
      print("Account name and password are incorrect.");
    }
  }

  resetPassword(){
    stdout.write("Enter a Email: ");
    String? inputEmail = stdin.readLineSync();
    stdout.write("Enter a Phone number: ");
    String? inputPhonenumber = stdin.readLineSync();
    if (inputEmail == Email && inputPhonenumber == Phonenumber){
      stdout.write("Enter a new Password");
      String? inputnewpassword = stdin.readLineSync();
      if (inputnewpassword != null && inputnewpassword.isNotEmpty){ 
        print("Password reset successfully");
      } else {
        print("Password is cannot be empty.");

      } 
    } else {
      print("Password reset fail.");
    }
  }


  setupLogin(){
    int attempts = 0;
    while (attempts <= 3){ 
      print("Attempts: ${attempts + 1}");
      stdout.write("Enter a user Account name:");
      String? inputname = stdin.readLineSync();
      stdout.write("Enter a password: ");
      String? inputPassword = stdin.readLineSync();
      if (inputname == AccountHoldername && inputPassword == Password){
         print("Account login successfully.");
         break;
      } else {
        print("Account not login");
        attempts++;
      }
    }
  }

   deposit(){
     stdout.write("Enter a amount to deposit");
     int amount = stdin.readByteSync();
     if (amount > 0){
      _balance = (_balance ?? 0) + amount;
      print("Deposit successfully. New balance: $_balance");
     } else {
      print("Invalid deposit: Insufficient balance");
     } 
  }

withdraw(){
  if (isactive != true){
    print("Withdrawal failed. Account is not active.");
    return;
  }

  stdout.write("Enter an amount to withdraw: ");
  String? input = stdin.readLineSync();
  int? amount = int.tryParse(input ?? "");

  if (amount == null || amount <= 0){
    print("Invalid amount entered.");
    return;
  }

  if ((_balance ?? 0) >= amount){
    _balance = (_balance ?? 0) - amount;
    print("Withdrawal successfully. New balance: $_balance");
  } else {
    print("Withdrawal failed: Insufficient balance");
  }
}

  checkbalance(){
    stdout.write("Enter a current balance to check");
    int? currentbalance = stdin.readByteSync();
    if (currentbalance == _balance){
      print("Current balance: $currentbalance");
    }
  }

Transfer(List<Bankaccount> accounts){
  Bankaccount? admin = accounts.firstWhere((a) => a.AccountHoldername == "admin");

  if (admin == null){
    print("Admin account not found");
    return;
  }

  if (isactive != true){
    print("Admin account is not active");
    return;
  }

  stdout.write("Enter a amount to send to admin: ");
  String? inputadmin = stdin.readLineSync();
  int? amount = int.tryParse(inputadmin ?? "");

  if (amount == null || amount <= 0) {
    print("Invalid amount entered.");
    return;
  }

  if ((_balance ?? 0) >= amount){
    _balance = (_balance ?? 0) - amount;
    admin._balance = (admin._balance ?? 0) + amount;
    print("Amount transfer to admin successful: Current balance: ${admin._balance}");
  } else {
    print("Transfer failed: Insufficient balance.");
  }
}


 reactiveAccount(){
    if (isactive!){
      print("Account $Accountnumber has been re activate.");
    } else { 
      print("Account $Accountnumber is already active.");
    }
 }

   closedAccount(){
    if (isactive == false){
      print("Account is already closed.");
    }
    stdout.write("Are you sure you want to close your account (yes/no): ");
    String? inputaccount = stdin.readLineSync();
    if (inputaccount != null && inputaccount == "yes"){
       isactive = false;
       _balance = 0.0;
       print("Account $Accountnumber closed successfully.");
    } else {
      print("Account close cancelled");
    }
   }
}
 