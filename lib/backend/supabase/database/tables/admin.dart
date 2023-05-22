import '../database.dart';

class AdminTable extends SupabaseTable<AdminRow> {
  @override
  String get tableName => 'admin';

  @override
  AdminRow createRow(Map<String, dynamic> data) => AdminRow(data);
}

class AdminRow extends SupabaseDataRow {
  AdminRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdminTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get username => getField<String>('username')!;
  set username(String value) => setField<String>('username', value);

  String get passwordHash => getField<String>('password_hash')!;
  set passwordHash(String value) => setField<String>('password_hash', value);

  bool get canManageUsers => getField<bool>('can_manage_users')!;
  set canManageUsers(bool value) => setField<bool>('can_manage_users', value);

  bool get canModifyTable1 => getField<bool>('can_modify_table1')!;
  set canModifyTable1(bool value) => setField<bool>('can_modify_table1', value);

  bool get canModifyTable2 => getField<bool>('can_modify_table2')!;
  set canModifyTable2(bool value) => setField<bool>('can_modify_table2', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
