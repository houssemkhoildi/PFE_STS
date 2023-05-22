import '../database.dart';

class StopsTable extends SupabaseTable<StopsRow> {
  @override
  String get tableName => 'stops';

  @override
  StopsRow createRow(Map<String, dynamic> data) => StopsRow(data);
}

class StopsRow extends SupabaseDataRow {
  StopsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StopsTable();

  String get stopId => getField<String>('stop_id')!;
  set stopId(String value) => setField<String>('stop_id', value);

  String get stopName => getField<String>('stop_name')!;
  set stopName(String value) => setField<String>('stop_name', value);

  double get stopLat => getField<double>('stop_lat')!;
  set stopLat(double value) => setField<double>('stop_lat', value);

  double get stopLon => getField<double>('stop_lon')!;
  set stopLon(double value) => setField<double>('stop_lon', value);

  String? get stopCode => getField<String>('stop_code');
  set stopCode(String? value) => setField<String>('stop_code', value);

  String? get stopDesc => getField<String>('stop_desc');
  set stopDesc(String? value) => setField<String>('stop_desc', value);

  String? get zoneId => getField<String>('zone_id');
  set zoneId(String? value) => setField<String>('zone_id', value);

  int? get locationType => getField<int>('location_type');
  set locationType(int? value) => setField<int>('location_type', value);

  String? get parentStation => getField<String>('parent_station');
  set parentStation(String? value) => setField<String>('parent_station', value);
}
