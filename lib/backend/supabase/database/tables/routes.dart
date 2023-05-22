import '../database.dart';

class RoutesTable extends SupabaseTable<RoutesRow> {
  @override
  String get tableName => 'routes';

  @override
  RoutesRow createRow(Map<String, dynamic> data) => RoutesRow(data);
}

class RoutesRow extends SupabaseDataRow {
  RoutesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoutesTable();

  String get routeId => getField<String>('route_id')!;
  set routeId(String value) => setField<String>('route_id', value);

  String? get agencyId => getField<String>('agency_id');
  set agencyId(String? value) => setField<String>('agency_id', value);

  String? get routeShortName => getField<String>('route_short_name');
  set routeShortName(String? value) =>
      setField<String>('route_short_name', value);

  String? get routeLongName => getField<String>('route_long_name');
  set routeLongName(String? value) =>
      setField<String>('route_long_name', value);

  String? get routeDesc => getField<String>('route_desc');
  set routeDesc(String? value) => setField<String>('route_desc', value);

  int get routeType => getField<int>('route_type')!;
  set routeType(int value) => setField<int>('route_type', value);

  String? get routeColor => getField<String>('route_color');
  set routeColor(String? value) => setField<String>('route_color', value);

  String? get routeTextColor => getField<String>('route_text_color');
  set routeTextColor(String? value) =>
      setField<String>('route_text_color', value);
}
