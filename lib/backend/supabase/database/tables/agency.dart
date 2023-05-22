import '../database.dart';

class AgencyTable extends SupabaseTable<AgencyRow> {
  @override
  String get tableName => 'agency';

  @override
  AgencyRow createRow(Map<String, dynamic> data) => AgencyRow(data);
}

class AgencyRow extends SupabaseDataRow {
  AgencyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AgencyTable();

  String get agencyId => getField<String>('agency_id')!;
  set agencyId(String value) => setField<String>('agency_id', value);

  String get agencyName => getField<String>('agency_name')!;
  set agencyName(String value) => setField<String>('agency_name', value);

  String get agencyUrl => getField<String>('agency_url')!;
  set agencyUrl(String value) => setField<String>('agency_url', value);

  String get agencyTimezone => getField<String>('agency_timezone')!;
  set agencyTimezone(String value) =>
      setField<String>('agency_timezone', value);

  String? get agencyLang => getField<String>('agency_lang');
  set agencyLang(String? value) => setField<String>('agency_lang', value);
}
