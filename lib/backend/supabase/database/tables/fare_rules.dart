import '../database.dart';

class FareRulesTable extends SupabaseTable<FareRulesRow> {
  @override
  String get tableName => 'fare_rules';

  @override
  FareRulesRow createRow(Map<String, dynamic> data) => FareRulesRow(data);
}

class FareRulesRow extends SupabaseDataRow {
  FareRulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FareRulesTable();

  String? get fareId => getField<String>('fare_id');
  set fareId(String? value) => setField<String>('fare_id', value);

  String? get routeId => getField<String>('route_id');
  set routeId(String? value) => setField<String>('route_id', value);

  String? get originId => getField<String>('origin_id');
  set originId(String? value) => setField<String>('origin_id', value);

  String? get destinationId => getField<String>('destination_id');
  set destinationId(String? value) => setField<String>('destination_id', value);

  String? get containsId => getField<String>('contains_id');
  set containsId(String? value) => setField<String>('contains_id', value);
}
