import '../database.dart';

class StopTimesTable extends SupabaseTable<StopTimesRow> {
  @override
  String get tableName => 'stop_times';

  @override
  StopTimesRow createRow(Map<String, dynamic> data) => StopTimesRow(data);
}

class StopTimesRow extends SupabaseDataRow {
  StopTimesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StopTimesTable();

  String? get tripId => getField<String>('trip_id');
  set tripId(String? value) => setField<String>('trip_id', value);

  String get arrivalTime => getField<String>('arrival_time')!;
  set arrivalTime(String value) => setField<String>('arrival_time', value);

  String get departureTime => getField<String>('departure_time')!;
  set departureTime(String value) => setField<String>('departure_time', value);

  String? get stopId => getField<String>('stop_id');
  set stopId(String? value) => setField<String>('stop_id', value);

  int get stopSequence => getField<int>('stop_sequence')!;
  set stopSequence(int value) => setField<int>('stop_sequence', value);

  String? get stopHeadsign => getField<String>('stop_headsign');
  set stopHeadsign(String? value) => setField<String>('stop_headsign', value);

  int? get pickupType => getField<int>('pickup_type');
  set pickupType(int? value) => setField<int>('pickup_type', value);

  int? get dropOffType => getField<int>('drop_off_type');
  set dropOffType(int? value) => setField<int>('drop_off_type', value);

  double? get shapeDistTraveled => getField<double>('shape_dist_traveled');
  set shapeDistTraveled(double? value) =>
      setField<double>('shape_dist_traveled', value);
}
