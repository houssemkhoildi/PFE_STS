import '../database.dart';

class CalendarTable extends SupabaseTable<CalendarRow> {
  @override
  String get tableName => 'calendar';

  @override
  CalendarRow createRow(Map<String, dynamic> data) => CalendarRow(data);
}

class CalendarRow extends SupabaseDataRow {
  CalendarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CalendarTable();

  String get serviceId => getField<String>('service_id')!;
  set serviceId(String value) => setField<String>('service_id', value);

  int get monday => getField<int>('monday')!;
  set monday(int value) => setField<int>('monday', value);

  int get tuesday => getField<int>('tuesday')!;
  set tuesday(int value) => setField<int>('tuesday', value);

  int get wednesday => getField<int>('wednesday')!;
  set wednesday(int value) => setField<int>('wednesday', value);

  int get thursday => getField<int>('thursday')!;
  set thursday(int value) => setField<int>('thursday', value);

  int get friday => getField<int>('friday')!;
  set friday(int value) => setField<int>('friday', value);

  int get saturday => getField<int>('saturday')!;
  set saturday(int value) => setField<int>('saturday', value);

  int get sunday => getField<int>('sunday')!;
  set sunday(int value) => setField<int>('sunday', value);

  String get startDate => getField<String>('start_date')!;
  set startDate(String value) => setField<String>('start_date', value);

  String get endDate => getField<String>('end_date')!;
  set endDate(String value) => setField<String>('end_date', value);
}
