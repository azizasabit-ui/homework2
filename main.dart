void checkBalance({
  required String name,
  required double balance,
}) =>
    print('$name, your current available balance is: $balance ₸');

  
  
  
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
