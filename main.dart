// 1. Check balance
void checkBalance({
  required String name,
  required double balance,
}) =>
    print('$name, your current available balance is: $balance ₸');


// 2. Deposit money
double deposit({
  required double currentBalance,
  double? amount,
}) {
  final double depositAmount = amount ?? 0.0;

  if (depositAmount <= 0) {
    print('Deposit declined: amount must be greater than 0.');
    return currentBalance;
  }

  final double updatedBalance = currentBalance + depositAmount;

  print('Deposit successful.');
  print('Deposited: $depositAmount ₸');
  print('Updated balance: $updatedBalance ₸');

  return updatedBalance;
}


// 3. Withdraw money
double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  const int correctPin = 1234;

  // If pinCode is null, use 0000
  final int enteredPin = pinCode ?? 0000;

  // Check PIN
  if (enteredPin != correctPin) {
    print('Transaction declined for $name.');
    print('Error: incorrect PIN code.');
    return currentBalance;
  }

  // If amount is null, use 0.0
  final double withdrawAmount = amount ?? 0.0;

  // Check amount
  if (withdrawAmount <= 0) {
    print('Transaction declined.');
    print('Error: withdrawal amount must be greater than 0.');
    return currentBalance;
  }

  // Check balance
  if (withdrawAmount > currentBalance) {
    print('Transaction declined for $name.');
    print('Error: insufficient funds.');
    print('Available balance: $currentBalance ₸');
    return currentBalance;
  }

  final double updatedBalance = currentBalance - withdrawAmount;

  print('Withdrawal successful.');
  print('Name: $name');
  print('Withdrawn: $withdrawAmount ₸');
  print('Remaining balance: $updatedBalance ₸');

  return updatedBalance;
}


void main() {
  double balance = 10000.0;

  // Check current balance
  checkBalance(
    name: 'Bekzat',
    balance: balance,
  );

  print('');

  // Deposit
  balance = deposit(
    currentBalance: balance,
    amount: 5000.0,
  );

  print('');

  // Successful withdrawal
  balance = withdraw(
    name: 'Bekzat',
    currentBalance: balance,
    amount: 3000.0,
    pinCode: 1234,
  );

  print('');

  // Incorrect PIN
  balance = withdraw(
    name: 'Bekzat',
    currentBalance: balance,
    amount: 1000.0,
    pinCode: 1111,
  );

  print('');

  // Null PIN
  balance = withdraw(
    name: 'Bekzat',
    currentBalance: balance,
    amount: 1000.0,
  );

  print('');

  // Insufficient funds
  balance = withdraw(
    name: 'Bekzat',
    currentBalance: balance,
    amount: 50000.0,
    pinCode: 1234,
  );

  print('');

  // Deposit with null amount
  balance = deposit(
    currentBalance: balance,
    amount: null,
  );

  print('');

  checkBalance(
    name: 'Bekzat',
    balance: balance,
  );
}