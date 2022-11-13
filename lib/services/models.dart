class Transaction {
  String? date;
  String? amount;
  String? type;
  String? currencyCode;
  String? iban;
  String? description;
  String? bic;
  String? id;

  Transaction(
      {this.date,
      this.amount,
      this.type,
      this.currencyCode,
      this.iban,
      this.description,
      this.bic,
      this.id});

  Transaction.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    type = json['type'];
    currencyCode = json['currencyCode'];
    iban = json['iban'];
    description = json['description'];
    bic = json['bic'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = date;
    data['amount'] = amount;
    data['type'] = type;
    data['currencyCode'] = currencyCode;
    data['iban'] = iban;
    data['description'] = description;
    data['bic'] = bic;
    data['id'] = id;
    return data;
  }
}
