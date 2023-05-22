import '../database.dart';

class ShapesTable extends SupabaseTable<ShapesRow> {
  @override
  String get tableName => 'shapes';

  @override
  ShapesRow createRow(Map<String, dynamic> data) => ShapesRow(data);
}

class ShapesRow extends SupabaseDataRow {
  ShapesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShapesTable();

  String get shapeId => getField<String>('shape_id')!;
  set shapeId(String value) => setField<String>('shape_id', value);

  double get shapePtLat => getField<double>('shape_pt_lat')!;
  set shapePtLat(double value) => setField<double>('shape_pt_lat', value);

  double get shapePtLon => getField<double>('shape_pt_lon')!;
  set shapePtLon(double value) => setField<double>('shape_pt_lon', value);

  int get shapePtSequence => getField<int>('shape_pt_sequence')!;
  set shapePtSequence(int value) => setField<int>('shape_pt_sequence', value);

  double? get shapeDistTraveled => getField<double>('shape_dist_traveled');
  set shapeDistTraveled(double? value) =>
      setField<double>('shape_dist_traveled', value);
}
