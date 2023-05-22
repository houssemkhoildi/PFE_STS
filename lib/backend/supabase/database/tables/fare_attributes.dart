import '../database.dart';

class FareAttributesTable extends SupabaseTable<FareAttributesRow> {
  @override
  String get tableName => 'fare_attributes';

  @override
  FareAttributesRow createRow(Map<String, dynamic> data) =>
      FareAttributesRow(data);
}

class FareAttributesRow extends SupabaseDataRow {
  FareAttributesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FareAttributesTable();

  String get fareId => getField<String>('fare_id')!;
  set fareId(String value) => setField<String>('fare_id', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  String get currencyType => getField<String>('currency_type')!;
  set currencyType(String value) => setField<String>('currency_type', value);

  int get paymentMethod => getField<int>('payment_method')!;
  set paymentMethod(int value) => setField<int>('payment_method', value);

  int? get transfers => getField<int>('transfers');
  set transfers(int? value) => setField<int>('transfers', value);

  String? get transferDuration => getField<String>('transfer_duration');
  set transferDuration(String? value) =>
      setField<String>('transfer_duration', value);
}
