import '../database.dart';

class TripsTable extends SupabaseTable<TripsRow> {
  @override
  String get tableName => 'trips';

  @override
  TripsRow createRow(Map<String, dynamic> data) => TripsRow(data);
}

class TripsRow extends SupabaseDataRow {
  TripsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripsTable();

  String? get routeId => getField<String>('route_id');
  set routeId(String? value) => setField<String>('route_id', value);

  String? get serviceId => getField<String>('service_id');
  set serviceId(String? value) => setField<String>('service_id', value);

  String get tripId => getField<String>('trip_id')!;
  set tripId(String value) => setField<String>('trip_id', value);

  String? get tripHeadsign => getField<String>('trip_headsign');
  set tripHeadsign(String? value) => setField<String>('trip_headsign', value);

  int? get directionId => getField<int>('direction_id');
  set directionId(int? value) => setField<int>('direction_id', value);

  String? get blockId => getField<String>('block_id');
  set blockId(String? value) => setField<String>('block_id', value);

  String? get shapeId => getField<String>('shape_id');
  set shapeId(String? value) => setField<String>('shape_id', value);
}
