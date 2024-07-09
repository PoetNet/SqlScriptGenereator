
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
	('1ee1c11a-1f11-1f01-1ad1-000000000001', 'Функция 1', 'function', 'Func1', 'dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;', 0, true, '2 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000002', 'Функция 2', 'function', 'Func2', 'dataPoints = get_history("func1_alias"); a1 = avg(dataPoints); return a1;', 1, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000003', 'Функция 3', 'function', 'Func3', 'dataPoints = get_history("func2_alias"); a1 = avg(dataPoints); return a1;', 2, true, '5 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000004', 'Функция 4', 'function', 'Func4', 'dataPoints = get_history("func3_alias"); a1 = avg(dataPoints); return a1;', 3, true, '7 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000005', 'Функция 5', 'function', 'Func5', 'dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); return a1;', 4, true, '5 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000006', 'Функция 6', 'function', 'Func6', 'dataPoints = get_history("func5_alias"); a1 = avg(dataPoints); return a1;', 5, true, '3 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000007', 'Функция 7', 'function', 'Func7', 'dataPoints = get_history("func6_alias"); a1 = avg(dataPoints); return a1;', 6, true, '3 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000008', 'Функция 8', 'function', 'Func8', 'dataPoints = get_history("func7_alias"); a1 = avg(dataPoints); return a1;', 7, true, '2 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000009', 'Функция 9', 'function', 'Func9', 'dataPoints = get_history("tag3_alias"); a1 = avg(dataPoints); return a1;', 8, true, '9 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000010', 'Функция 10', 'function', 'Func10', 'dataPoints = get_history("func9_alias"); a1 = avg(dataPoints); return a1;', 9, true, '6 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000011', 'Функция 11', 'function', 'Func11', 'dataPoints = get_history("func10_alias"); a1 = avg(dataPoints); return a1;', 10, true, '5 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000012', 'Функция 12', 'function', 'Func12', 'dataPoints = get_history("func11_alias"); a1 = avg(dataPoints); return a1;', 11, true, '7 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000013', 'Функция 13', 'function', 'Func13', 'dataPoints = get_history("tag4_alias"); a1 = avg(dataPoints); return a1;', 12, true, '8 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000014', 'Функция 14', 'function', 'Func14', 'dataPoints = get_history("func13_alias"); a1 = avg(dataPoints); return a1;', 0, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000015', 'Функция 15', 'function', 'Func15', 'dataPoints = get_history("func14_alias"); a1 = avg(dataPoints); return a1;', 1, true, '4 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000016', 'Функция 16', 'function', 'Func16', 'dataPoints = get_history("func15_alias"); a1 = avg(dataPoints); return a1;', 2, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000017', 'Функция 17', 'function', 'Func17', 'dataPoints = get_history("tag5_alias"); a1 = avg(dataPoints); return a1;', 3, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000018', 'Функция 18', 'function', 'Func18', 'dataPoints = get_history("func17_alias"); a1 = avg(dataPoints); return a1;', 4, true, '3 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000019', 'Функция 19', 'function', 'Func19', 'dataPoints = get_history("func18_alias"); a1 = avg(dataPoints); return a1;', 5, true, '4 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000020', 'Функция 20', 'function', 'Func20', 'dataPoints = get_history("func19_alias"); a1 = avg(dataPoints); return a1;', 6, true, '3 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000021', 'Функция 21', 'function', 'Func21', 'dataPoints = get_history("tag6_alias"); a1 = avg(dataPoints); return a1;', 7, true, '7 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000022', 'Функция 22', 'function', 'Func22', 'dataPoints = get_history("func21_alias"); a1 = avg(dataPoints); return a1;', 8, true, '7 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000023', 'Функция 23', 'function', 'Func23', 'dataPoints = get_history("func22_alias"); a1 = avg(dataPoints); return a1;', 9, true, '3 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000024', 'Функция 24', 'function', 'Func24', 'dataPoints = get_history("func23_alias"); a1 = avg(dataPoints); return a1;', 10, true, '2 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', 'Функция 25', 'function', 'Func25', 'dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;', 11, true, '9 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000026', 'Функция 26', 'function', 'Func26', 'dataPoints = get_history("func25_alias"); a1 = avg(dataPoints); return a1;', 12, true, '2 minutes', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', 'Функция 27', 'function', 'Func27', 'dataPoints = get_history("func26_alias"); a1 = avg(dataPoints); return a1;', 0, true, '5 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000028', 'Функция 28', 'function', 'Func28', 'dataPoints = get_history("func27_alias"); a1 = avg(dataPoints); return a1;', 1, true, '7 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', 'Функция 29', 'function', 'Func29', 'dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); return a1;', 2, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000030', 'Функция 30', 'function', 'Func30', 'dataPoints = get_history("func29_alias"); a1 = avg(dataPoints); return a1;', 3, true, '8 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', 'Функция 31', 'function', 'Func31', 'dataPoints = get_history("func30_alias"); a1 = avg(dataPoints); return a1;', 4, true, '3 minutes', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000032', 'Функция 32', 'function', 'Func32', 'dataPoints = get_history("func31_alias"); a1 = avg(dataPoints); return a1;', 5, true, '8 minutes', null);

INSERT INTO "Nodes" ("Id", "DisplayName", "NodeType", "SourceId", "TagId")
    VALUES
	('3ee3c33a-3f33-3f33-3ad3-000000000001', 'Tэг 1', 'tag', 'source1', 'tag1'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', 'Tэг 2', 'tag', 'source2', 'tag2'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', 'Tэг 3', 'tag', 'source3', 'tag3'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', 'Tэг 4', 'tag', 'source4', 'tag4'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', 'Tэг 5', 'tag', 'source5', 'tag5'),
	('3ee3c33a-3f33-3f33-3ad3-000000000006', 'Tэг 6', 'tag', 'source6', 'tag6');

INSERT INTO "Edges" ("SourceNodeId", "DestinationNodeId", "SourceNodeAlias")
    VALUES
	('3ee3c33a-3f33-3f33-3ad3-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000001', 'tag1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000002', 'func1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000002', '1ee1c11a-1f11-1f01-1ad1-000000000003', 'func2_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000004', 'func3_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', '1ee1c11a-1f11-1f01-1ad1-000000000005', 'tag2_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000006', 'func5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000006', '1ee1c11a-1f11-1f01-1ad1-000000000007', 'func6_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000007', '1ee1c11a-1f11-1f01-1ad1-000000000008', 'func7_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000009', 'tag3_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000009', '1ee1c11a-1f11-1f01-1ad1-000000000010', 'func9_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000010', '1ee1c11a-1f11-1f01-1ad1-000000000011', 'func10_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000011', '1ee1c11a-1f11-1f01-1ad1-000000000012', 'func11_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', '1ee1c11a-1f11-1f01-1ad1-000000000013', 'tag4_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000013', '1ee1c11a-1f11-1f01-1ad1-000000000014', 'func13_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000014', '1ee1c11a-1f11-1f01-1ad1-000000000015', 'func14_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000015', '1ee1c11a-1f11-1f01-1ad1-000000000016', 'func15_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000017', 'tag5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000017', '1ee1c11a-1f11-1f01-1ad1-000000000018', 'func17_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000018', '1ee1c11a-1f11-1f01-1ad1-000000000019', 'func18_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000019', '1ee1c11a-1f11-1f01-1ad1-000000000020', 'func19_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000006', '1ee1c11a-1f11-1f01-1ad1-000000000021', 'tag6_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000021', '1ee1c11a-1f11-1f01-1ad1-000000000022', 'func21_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000022', '1ee1c11a-1f11-1f01-1ad1-000000000023', 'func22_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000023', '1ee1c11a-1f11-1f01-1ad1-000000000024', 'func23_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000025', 'tag1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', '1ee1c11a-1f11-1f01-1ad1-000000000026', 'func25_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000026', '1ee1c11a-1f11-1f01-1ad1-000000000027', 'func26_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', '1ee1c11a-1f11-1f01-1ad1-000000000028', 'func27_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', '1ee1c11a-1f11-1f01-1ad1-000000000029', 'tag2_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', '1ee1c11a-1f11-1f01-1ad1-000000000030', 'func29_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000030', '1ee1c11a-1f11-1f01-1ad1-000000000031', 'func30_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', '1ee1c11a-1f11-1f01-1ad1-000000000032', 'func31_alias');

