
TRUNCATE TABLE "Edges", "Nodes", "ShiftSchedules", "Shifts" CASCADE;

INSERT INTO "ShiftSchedules" ("Id", "TimeZone", "StartsFromFirstDayOfMonth")
VALUES
  ('bb9a7e57-9ea2-4a39-9005-b532f6988777', 3, true);

INSERT INTO "Shifts" ("Id", "Start", "End", "Number", "ShiftScheduleId")
VALUES
    ('bb9a7e57-9ea2-4a39-9005-b532f6988cca', '19:00:00', '07:00:00', 1, 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
    ('bb9a7e57-9ea2-4a39-9005-b532f6988ccb', '07:00:00', '19:00:00', 2, 'bb9a7e57-9ea2-4a39-9005-b532f6988777'); 

INSERT INTO "Nodes" ("Id", "DisplayName", "NodeType", "Name", "Script", "WindowType", "IsEnabled", "Interval", "ShiftScheduleId")
    VALUES
	('1ee1c11a-1f11-1f01-1ad1-000000000001', 'Функция 1', 'function', 'Func1', 'return history_avg("tag1_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000003', 'Функция 3', 'function', 'Func3', 'return history_avg("tag2_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000005', 'Функция 5', 'function', 'Func5', 'return history_avg("tag3_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000007', 'Функция 7', 'function', 'Func7', 'return history_avg("tag4_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000009', 'Функция 9', 'function', 'Func9', 'return history_avg("tag5_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000011', 'Функция 11', 'function', 'Func11', 'return history_avg("tag6_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000013', 'Функция 13', 'function', 'Func13', 'return history_avg("tag1_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000015', 'Функция 15', 'function', 'Func15', 'return history_avg("tag2_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000017', 'Функция 17', 'function', 'Func17', 'return history_avg("tag3_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000019', 'Функция 19', 'function', 'Func19', 'return history_avg("tag4_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000021', 'Функция 21', 'function', 'Func21', 'return history_avg("tag5_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000023', 'Функция 23', 'function', 'Func23', 'return history_avg("tag6_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', 'Функция 25', 'function', 'Func25', 'return history_avg("tag1_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', 'Функция 27', 'function', 'Func27', 'return history_avg("tag2_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', 'Функция 29', 'function', 'Func29', 'return history_avg("tag3_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', 'Функция 31', 'function', 'Func31', 'return history_avg("tag4_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000033', 'Функция 33', 'function', 'Func33', 'return history_avg("tag5_alias");', 5, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000002', 'Функция 2', 'function', 'Func2', 'return history_avg("func1_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000004', 'Функция 4', 'function', 'Func4', 'return history_avg("func13_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000006', 'Функция 6', 'function', 'Func6', 'return history_avg("func25_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000008', 'Функция 8', 'function', 'Func8', 'return history_avg("func3_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000010', 'Функция 10', 'function', 'Func10', 'return history_avg("func15_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000012', 'Функция 12', 'function', 'Func12', 'return history_avg("func27_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000014', 'Функция 14', 'function', 'Func14', 'return history_avg("func5_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000016', 'Функция 16', 'function', 'Func16', 'return history_avg("func17_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000018', 'Функция 18', 'function', 'Func18', 'return history_avg("func29_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000020', 'Функция 20', 'function', 'Func20', 'return history_avg("func7_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000022', 'Функция 22', 'function', 'Func22', 'return history_avg("func19_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000024', 'Функция 24', 'function', 'Func24', 'return history_avg("func31_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000026', 'Функция 26', 'function', 'Func26', 'return history_avg("func9_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000028', 'Функция 28', 'function', 'Func28', 'return history_avg("func21_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000030', 'Функция 30', 'function', 'Func30', 'return history_avg("func33_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000032', 'Функция 32', 'function', 'Func32', 'return history_avg("func11_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000034', 'Функция 34', 'function', 'Func34', 'return history_avg("func23_alias");', 6, true, '60 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777');

INSERT INTO "Nodes" ("Id", "DisplayName", "NodeType", "SourceId", "TagId")
    VALUES
	('3ee3c33a-3f33-3f33-3ad3-000000000001', 'Tэг 1', 'tag', 'spc1_3_iba_sh0', 'Modules.8 S7-Xplorer.Analog.User_DB_DB3000 Motor_Parameter\Dr15_spare2'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', 'Tэг 2', 'tag', 'sac_cop_pda34', 'Modules.28 Del3_ Drives Masterdrive.Digital.DEL3: 100100 Накапливающая решетка, секция 1 (+300RM6_9-GF1): HSS Бит 14 + заданное значение скорости (1-Да)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', 'Tэг 3', 'tag', 'sac_cop_pda34', 'Modules.13 Del3_ Inputs.Digital.DEL3: I 1481_2 - аварийный останов участок обточки ветвь БТС-2(+303DV1-30SA17)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', 'Tэг 4', 'tag', 'sac_cop_pda34', 'Modules.14 Del3_ Outputs.Digital.DEL3: Q 67_0 - =3040711 решетка - правый регул-й упор движение вперед(+305DV1-4711SH1)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', 'Tэг 5', 'tag', 'sac_cop_pda34', 'Modules.14 Del3_ Outputs.Digital.DEL3: Q 1740_2 - =3020102 шаг_решетка - укладывающий рычаг вниз(=3130125-YV2_1)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000006', 'Tэг 6', 'tag', 'sac_cop_pda34', 'Modules.27 Del3_ Drives Micromaster.Analog.DEL3: 30100 Рольганг с выталкивателями, секция 1_3 (+300RM2_4-GF3): Актуальный ток [% от 16A]');

INSERT INTO "Edges" ("SourceNodeId", "DestinationNodeId", "SourceNodeAlias")
    VALUES
	('3ee3c33a-3f33-3f33-3ad3-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000001', 'tag1_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000003', 'tag2_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000005', 'tag3_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000007', '1ee1c11a-1f11-1f01-1ad1-000000000007', 'tag4_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000009', '1ee1c11a-1f11-1f01-1ad1-000000000009', 'tag5_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000011', '1ee1c11a-1f11-1f01-1ad1-000000000011', 'tag6_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000013', '1ee1c11a-1f11-1f01-1ad1-000000000013', 'tag1_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000015', '1ee1c11a-1f11-1f01-1ad1-000000000015', 'tag2_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000017', '1ee1c11a-1f11-1f01-1ad1-000000000017', 'tag3_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000019', '1ee1c11a-1f11-1f01-1ad1-000000000019', 'tag4_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000021', '1ee1c11a-1f11-1f01-1ad1-000000000021', 'tag5_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000023', '1ee1c11a-1f11-1f01-1ad1-000000000023', 'tag6_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000025', '1ee1c11a-1f11-1f01-1ad1-000000000025', 'tag1_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000027', '1ee1c11a-1f11-1f01-1ad1-000000000027', 'tag2_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000029', '1ee1c11a-1f11-1f01-1ad1-000000000029', 'tag3_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000031', '1ee1c11a-1f11-1f01-1ad1-000000000031', 'tag4_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000033', '1ee1c11a-1f11-1f01-1ad1-000000000033', 'tag5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000002', 'func1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000013', '1ee1c11a-1f11-1f01-1ad1-000000000004', 'func13_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', '1ee1c11a-1f11-1f01-1ad1-000000000006', 'func25_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000008', 'func3_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000015', '1ee1c11a-1f11-1f01-1ad1-000000000010', 'func15_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', '1ee1c11a-1f11-1f01-1ad1-000000000012', 'func27_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000014', 'func5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000017', '1ee1c11a-1f11-1f01-1ad1-000000000016', 'func17_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', '1ee1c11a-1f11-1f01-1ad1-000000000018', 'func29_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000007', '1ee1c11a-1f11-1f01-1ad1-000000000020', 'func7_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000019', '1ee1c11a-1f11-1f01-1ad1-000000000022', 'func19_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', '1ee1c11a-1f11-1f01-1ad1-000000000024', 'func31_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000009', '1ee1c11a-1f11-1f01-1ad1-000000000026', 'func9_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000021', '1ee1c11a-1f11-1f01-1ad1-000000000028', 'func21_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000033', '1ee1c11a-1f11-1f01-1ad1-000000000030', 'func33_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000011', '1ee1c11a-1f11-1f01-1ad1-000000000032', 'func11_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000023', '1ee1c11a-1f11-1f01-1ad1-000000000034', 'func23_alias');

