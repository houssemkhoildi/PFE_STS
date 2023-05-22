import '../database.dart';

class CalendarDatesTable extends SupabaseTable<CalendarDatesRow> {
  @override
  String get tableName => 'calendar_dates';

  @override
  CalendarDatesRow createRow(Map<String, dynamic> data) =>
      CalendarDatesRow(data);
}

class CalendarDatesRow extends SupabaseDataRow {
  CalendarDatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CalendarDatesTable();

  String? get serviceId => getField<String>('service_id');
  set serviceId(String? value) => setField<String>('service_id', value);

  String get date => getField<String>('date')!;
  set date(String value) => setField<String>('date', value);

  int get exceptionType => getField<int>('exception_type')!;
  set exceptionType(int value) => setField<int>('exception_type', value);
}
