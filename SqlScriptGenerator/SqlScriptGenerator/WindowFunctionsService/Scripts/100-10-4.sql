
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
	('1ee1c11a-1f11-1f01-1ad1-000000000001', 'Функция 1', 'function', 'Func1', 'dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;', 0, true, '40 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000002', 'Функция 2', 'function', 'Func2', 'dataPoints = get_history("func1_alias"); a1 = avg(dataPoints); return a1;', 1, true, '36 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000003', 'Функция 3', 'function', 'Func3', 'dataPoints = get_history("func2_alias"); a1 = avg(dataPoints); return a1;', 2, true, '48 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000004', 'Функция 4', 'function', 'Func4', 'dataPoints = get_history("func3_alias"); a1 = avg(dataPoints); return a1;', 3, true, '50 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000005', 'Функция 5', 'function', 'Func5', 'dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); return a1;', 4, true, '45 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000006', 'Функция 6', 'function', 'Func6', 'dataPoints = get_history("func5_alias"); a1 = avg(dataPoints); return a1;', 5, true, '44 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000007', 'Функция 7', 'function', 'Func7', 'dataPoints = get_history("func6_alias"); a1 = avg(dataPoints); return a1;', 6, true, '45 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000008', 'Функция 8', 'function', 'Func8', 'dataPoints = get_history("func7_alias"); a1 = avg(dataPoints); return a1;', 7, true, '35 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000009', 'Функция 9', 'function', 'Func9', 'dataPoints = get_history("tag3_alias"); a1 = avg(dataPoints); return a1;', 8, true, '56 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000010', 'Функция 10', 'function', 'Func10', 'dataPoints = get_history("func9_alias"); a1 = avg(dataPoints); return a1;', 9, true, '46 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000011', 'Функция 11', 'function', 'Func11', 'dataPoints = get_history("func10_alias"); a1 = avg(dataPoints); return a1;', 10, true, '23 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000012', 'Функция 12', 'function', 'Func12', 'dataPoints = get_history("func11_alias"); a1 = avg(dataPoints); return a1;', 11, true, '54 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000013', 'Функция 13', 'function', 'Func13', 'dataPoints = get_history("tag4_alias"); a1 = avg(dataPoints); return a1;', 12, true, '31 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000014', 'Функция 14', 'function', 'Func14', 'dataPoints = get_history("func13_alias"); a1 = avg(dataPoints); return a1;', 0, true, '28 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000015', 'Функция 15', 'function', 'Func15', 'dataPoints = get_history("func14_alias"); a1 = avg(dataPoints); return a1;', 1, true, '27 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000016', 'Функция 16', 'function', 'Func16', 'dataPoints = get_history("func15_alias"); a1 = avg(dataPoints); return a1;', 2, true, '33 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000017', 'Функция 17', 'function', 'Func17', 'dataPoints = get_history("tag5_alias"); a1 = avg(dataPoints); return a1;', 3, true, '55 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000018', 'Функция 18', 'function', 'Func18', 'dataPoints = get_history("func17_alias"); a1 = avg(dataPoints); return a1;', 4, true, '45 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000019', 'Функция 19', 'function', 'Func19', 'dataPoints = get_history("func18_alias"); a1 = avg(dataPoints); return a1;', 5, true, '20 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000020', 'Функция 20', 'function', 'Func20', 'dataPoints = get_history("func19_alias"); a1 = avg(dataPoints); return a1;', 6, true, '47 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000021', 'Функция 21', 'function', 'Func21', 'dataPoints = get_history("tag6_alias"); a1 = avg(dataPoints); return a1;', 7, true, '36 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000022', 'Функция 22', 'function', 'Func22', 'dataPoints = get_history("func21_alias"); a1 = avg(dataPoints); return a1;', 8, true, '34 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000023', 'Функция 23', 'function', 'Func23', 'dataPoints = get_history("func22_alias"); a1 = avg(dataPoints); return a1;', 9, true, '31 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000024', 'Функция 24', 'function', 'Func24', 'dataPoints = get_history("func23_alias"); a1 = avg(dataPoints); return a1;', 10, true, '55 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', 'Функция 25', 'function', 'Func25', 'dataPoints = get_history("tag7_alias"); a1 = avg(dataPoints); return a1;', 11, true, '35 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000026', 'Функция 26', 'function', 'Func26', 'dataPoints = get_history("func25_alias"); a1 = avg(dataPoints); return a1;', 12, true, '40 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', 'Функция 27', 'function', 'Func27', 'dataPoints = get_history("func26_alias"); a1 = avg(dataPoints); return a1;', 0, true, '40 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000028', 'Функция 28', 'function', 'Func28', 'dataPoints = get_history("func27_alias"); a1 = avg(dataPoints); return a1;', 1, true, '56 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', 'Функция 29', 'function', 'Func29', 'dataPoints = get_history("tag8_alias"); a1 = avg(dataPoints); return a1;', 2, true, '41 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000030', 'Функция 30', 'function', 'Func30', 'dataPoints = get_history("func29_alias"); a1 = avg(dataPoints); return a1;', 3, true, '45 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', 'Функция 31', 'function', 'Func31', 'dataPoints = get_history("func30_alias"); a1 = avg(dataPoints); return a1;', 4, true, '31 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000032', 'Функция 32', 'function', 'Func32', 'dataPoints = get_history("func31_alias"); a1 = avg(dataPoints); return a1;', 5, true, '54 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000033', 'Функция 33', 'function', 'Func33', 'dataPoints = get_history("tag9_alias"); a1 = avg(dataPoints); return a1;', 6, true, '30 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000034', 'Функция 34', 'function', 'Func34', 'dataPoints = get_history("func33_alias"); a1 = avg(dataPoints); return a1;', 7, true, '31 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000035', 'Функция 35', 'function', 'Func35', 'dataPoints = get_history("func34_alias"); a1 = avg(dataPoints); return a1;', 8, true, '34 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000036', 'Функция 36', 'function', 'Func36', 'dataPoints = get_history("func35_alias"); a1 = avg(dataPoints); return a1;', 9, true, '54 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000037', 'Функция 37', 'function', 'Func37', 'dataPoints = get_history("tag10_alias"); a1 = avg(dataPoints); return a1;', 10, true, '43 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000038', 'Функция 38', 'function', 'Func38', 'dataPoints = get_history("func37_alias"); a1 = avg(dataPoints); return a1;', 11, true, '53 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000039', 'Функция 39', 'function', 'Func39', 'dataPoints = get_history("func38_alias"); a1 = avg(dataPoints); return a1;', 12, true, '56 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000040', 'Функция 40', 'function', 'Func40', 'dataPoints = get_history("func39_alias"); a1 = avg(dataPoints); return a1;', 0, true, '38 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000041', 'Функция 41', 'function', 'Func41', 'dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;', 1, true, '57 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000042', 'Функция 42', 'function', 'Func42', 'dataPoints = get_history("func41_alias"); a1 = avg(dataPoints); return a1;', 2, true, '46 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000043', 'Функция 43', 'function', 'Func43', 'dataPoints = get_history("func42_alias"); a1 = avg(dataPoints); return a1;', 3, true, '39 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000044', 'Функция 44', 'function', 'Func44', 'dataPoints = get_history("func43_alias"); a1 = avg(dataPoints); return a1;', 4, true, '48 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000045', 'Функция 45', 'function', 'Func45', 'dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); return a1;', 5, true, '38 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000046', 'Функция 46', 'function', 'Func46', 'dataPoints = get_history("func45_alias"); a1 = avg(dataPoints); return a1;', 6, true, '48 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000047', 'Функция 47', 'function', 'Func47', 'dataPoints = get_history("func46_alias"); a1 = avg(dataPoints); return a1;', 7, true, '34 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000048', 'Функция 48', 'function', 'Func48', 'dataPoints = get_history("func47_alias"); a1 = avg(dataPoints); return a1;', 8, true, '31 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000049', 'Функция 49', 'function', 'Func49', 'dataPoints = get_history("tag3_alias"); a1 = avg(dataPoints); return a1;', 9, true, '36 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000050', 'Функция 50', 'function', 'Func50', 'dataPoints = get_history("func49_alias"); a1 = avg(dataPoints); return a1;', 10, true, '21 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000051', 'Функция 51', 'function', 'Func51', 'dataPoints = get_history("func50_alias"); a1 = avg(dataPoints); return a1;', 11, true, '30 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000052', 'Функция 52', 'function', 'Func52', 'dataPoints = get_history("func51_alias"); a1 = avg(dataPoints); return a1;', 12, true, '22 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000053', 'Функция 53', 'function', 'Func53', 'dataPoints = get_history("tag4_alias"); a1 = avg(dataPoints); return a1;', 0, true, '23 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000054', 'Функция 54', 'function', 'Func54', 'dataPoints = get_history("func53_alias"); a1 = avg(dataPoints); return a1;', 1, true, '52 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000055', 'Функция 55', 'function', 'Func55', 'dataPoints = get_history("func54_alias"); a1 = avg(dataPoints); return a1;', 2, true, '21 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000056', 'Функция 56', 'function', 'Func56', 'dataPoints = get_history("func55_alias"); a1 = avg(dataPoints); return a1;', 3, true, '37 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000057', 'Функция 57', 'function', 'Func57', 'dataPoints = get_history("tag5_alias"); a1 = avg(dataPoints); return a1;', 4, true, '31 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000058', 'Функция 58', 'function', 'Func58', 'dataPoints = get_history("func57_alias"); a1 = avg(dataPoints); return a1;', 5, true, '29 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000059', 'Функция 59', 'function', 'Func59', 'dataPoints = get_history("func58_alias"); a1 = avg(dataPoints); return a1;', 6, true, '28 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000060', 'Функция 60', 'function', 'Func60', 'dataPoints = get_history("func59_alias"); a1 = avg(dataPoints); return a1;', 7, true, '27 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000061', 'Функция 61', 'function', 'Func61', 'dataPoints = get_history("tag6_alias"); a1 = avg(dataPoints); return a1;', 8, true, '24 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000062', 'Функция 62', 'function', 'Func62', 'dataPoints = get_history("func61_alias"); a1 = avg(dataPoints); return a1;', 9, true, '43 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000063', 'Функция 63', 'function', 'Func63', 'dataPoints = get_history("func62_alias"); a1 = avg(dataPoints); return a1;', 10, true, '32 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000064', 'Функция 64', 'function', 'Func64', 'dataPoints = get_history("func63_alias"); a1 = avg(dataPoints); return a1;', 11, true, '20 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000065', 'Функция 65', 'function', 'Func65', 'dataPoints = get_history("tag7_alias"); a1 = avg(dataPoints); return a1;', 12, true, '36 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000066', 'Функция 66', 'function', 'Func66', 'dataPoints = get_history("func65_alias"); a1 = avg(dataPoints); return a1;', 0, true, '26 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000067', 'Функция 67', 'function', 'Func67', 'dataPoints = get_history("func66_alias"); a1 = avg(dataPoints); return a1;', 1, true, '49 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000068', 'Функция 68', 'function', 'Func68', 'dataPoints = get_history("func67_alias"); a1 = avg(dataPoints); return a1;', 2, true, '30 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000069', 'Функция 69', 'function', 'Func69', 'dataPoints = get_history("tag8_alias"); a1 = avg(dataPoints); return a1;', 3, true, '49 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000070', 'Функция 70', 'function', 'Func70', 'dataPoints = get_history("func69_alias"); a1 = avg(dataPoints); return a1;', 4, true, '29 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000071', 'Функция 71', 'function', 'Func71', 'dataPoints = get_history("func70_alias"); a1 = avg(dataPoints); return a1;', 5, true, '30 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000072', 'Функция 72', 'function', 'Func72', 'dataPoints = get_history("func71_alias"); a1 = avg(dataPoints); return a1;', 6, true, '50 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000073', 'Функция 73', 'function', 'Func73', 'dataPoints = get_history("tag9_alias"); a1 = avg(dataPoints); return a1;', 7, true, '31 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000074', 'Функция 74', 'function', 'Func74', 'dataPoints = get_history("func73_alias"); a1 = avg(dataPoints); return a1;', 8, true, '29 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000075', 'Функция 75', 'function', 'Func75', 'dataPoints = get_history("func74_alias"); a1 = avg(dataPoints); return a1;', 9, true, '24 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000076', 'Функция 76', 'function', 'Func76', 'dataPoints = get_history("func75_alias"); a1 = avg(dataPoints); return a1;', 10, true, '40 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000077', 'Функция 77', 'function', 'Func77', 'dataPoints = get_history("tag10_alias"); a1 = avg(dataPoints); return a1;', 11, true, '46 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000078', 'Функция 78', 'function', 'Func78', 'dataPoints = get_history("func77_alias"); a1 = avg(dataPoints); return a1;', 12, true, '51 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000079', 'Функция 79', 'function', 'Func79', 'dataPoints = get_history("func78_alias"); a1 = avg(dataPoints); return a1;', 0, true, '44 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000080', 'Функция 80', 'function', 'Func80', 'dataPoints = get_history("func79_alias"); a1 = avg(dataPoints); return a1;', 1, true, '49 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000081', 'Функция 81', 'function', 'Func81', 'dataPoints = get_history("tag1_alias"); a1 = avg(dataPoints); return a1;', 2, true, '40 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000082', 'Функция 82', 'function', 'Func82', 'dataPoints = get_history("func81_alias"); a1 = avg(dataPoints); return a1;', 3, true, '20 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000083', 'Функция 83', 'function', 'Func83', 'dataPoints = get_history("func82_alias"); a1 = avg(dataPoints); return a1;', 4, true, '53 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000084', 'Функция 84', 'function', 'Func84', 'dataPoints = get_history("func83_alias"); a1 = avg(dataPoints); return a1;', 5, true, '48 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000085', 'Функция 85', 'function', 'Func85', 'dataPoints = get_history("tag2_alias"); a1 = avg(dataPoints); return a1;', 6, true, '32 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000086', 'Функция 86', 'function', 'Func86', 'dataPoints = get_history("func85_alias"); a1 = avg(dataPoints); return a1;', 7, true, '29 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000087', 'Функция 87', 'function', 'Func87', 'dataPoints = get_history("func86_alias"); a1 = avg(dataPoints); return a1;', 8, true, '47 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000088', 'Функция 88', 'function', 'Func88', 'dataPoints = get_history("func87_alias"); a1 = avg(dataPoints); return a1;', 9, true, '42 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000089', 'Функция 89', 'function', 'Func89', 'dataPoints = get_history("tag3_alias"); a1 = avg(dataPoints); return a1;', 10, true, '39 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000090', 'Функция 90', 'function', 'Func90', 'dataPoints = get_history("func89_alias"); a1 = avg(dataPoints); return a1;', 11, true, '27 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000091', 'Функция 91', 'function', 'Func91', 'dataPoints = get_history("func90_alias"); a1 = avg(dataPoints); return a1;', 12, true, '25 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000092', 'Функция 92', 'function', 'Func92', 'dataPoints = get_history("func91_alias"); a1 = avg(dataPoints); return a1;', 0, true, '37 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000093', 'Функция 93', 'function', 'Func93', 'dataPoints = get_history("tag4_alias"); a1 = avg(dataPoints); return a1;', 1, true, '21 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000094', 'Функция 94', 'function', 'Func94', 'dataPoints = get_history("func93_alias"); a1 = avg(dataPoints); return a1;', 2, true, '31 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000095', 'Функция 95', 'function', 'Func95', 'dataPoints = get_history("func94_alias"); a1 = avg(dataPoints); return a1;', 3, true, '24 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000096', 'Функция 96', 'function', 'Func96', 'dataPoints = get_history("func95_alias"); a1 = avg(dataPoints); return a1;', 4, true, '24 seconds', 'bb9a7e57-9ea2-4a39-9005-b532f6988777'),
	('1ee1c11a-1f11-1f01-1ad1-000000000097', 'Функция 97', 'function', 'Func97', 'dataPoints = get_history("tag5_alias"); a1 = avg(dataPoints); return a1;', 5, true, '26 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000098', 'Функция 98', 'function', 'Func98', 'dataPoints = get_history("func97_alias"); a1 = avg(dataPoints); return a1;', 6, true, '36 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000099', 'Функция 99', 'function', 'Func99', 'dataPoints = get_history("func98_alias"); a1 = avg(dataPoints); return a1;', 7, true, '30 seconds', null),
	('1ee1c11a-1f11-1f01-1ad1-000000000100', 'Функция 100', 'function', 'Func100', 'dataPoints = get_history("func99_alias"); a1 = avg(dataPoints); return a1;', 8, true, '59 seconds', null);

INSERT INTO "Nodes" ("Id", "DisplayName", "NodeType", "SourceId", "TagId")
    VALUES
	('3ee3c33a-3f33-3f33-3ad3-000000000001', 'Tэг 1', 'tag', 'spc1_3_iba_sh0', 'Modules.8 S7-Xplorer.Analog.User_DB_DB3000 Motor_Parameter\Dr15_spare2'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', 'Tэг 2', 'tag', 'sac_cop_pda34', 'Modules.28 Del3_ Drives Masterdrive.Digital.DEL3: 100100 Накапливающая решетка, секция 1 (+300RM6_9-GF1): HSS Бит 14 + заданное значение скорости (1-Да)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', 'Tэг 3', 'tag', 'sac_cop_pda34', 'Modules.13 Del3_ Inputs.Digital.DEL3: I 1481_2 - аварийный останов участок обточки ветвь БТС-2(+303DV1-30SA17)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', 'Tэг 4', 'tag', 'sac_cop_pda34', 'Modules.14 Del3_ Outputs.Digital.DEL3: Q 67_0 - =3040711 решетка - правый регул-й упор движение вперед(+305DV1-4711SH1)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', 'Tэг 5', 'tag', 'sac_cop_pda34', 'Modules.14 Del3_ Outputs.Digital.DEL3: Q 1740_2 - =3020102 шаг_решетка - укладывающий рычаг вниз(=3130125-YV2_1)'),
	('3ee3c33a-3f33-3f33-3ad3-000000000006', 'Tэг 6', 'tag', 'sac_cop_pda34', 'Modules.27 Del3_ Drives Micromaster.Analog.DEL3: 30100 Рольганг с выталкивателями, секция 1_3 (+300RM2_4-GF3): Актуальный ток [% от 16A]'),
	('3ee3c33a-3f33-3f33-3ad3-000000000007', 'Tэг 7', 'tag', 'sac_cop_pda34', 'Modules.36 FM441_ Digital\Analog.Analog.ФМ441: MB  147-Сообщение об ошибках'),
	('3ee3c33a-3f33-3f33-3ad3-000000000008', 'Tэг 8', 'tag', 'sac_cop_heat2', 'ns=1;s=t|HeatingZone1AHMI_B7_CMD_On'),
	('3ee3c33a-3f33-3f33-3ad3-000000000009', 'Tэг 9', 'tag', 'sac_cop_pda34', 'Modules.13 Del3_ Inputs.Digital.DEL3: I 97_2 - Z60201-CZ>DEL - M1-в цикле'),
	('3ee3c33a-3f33-3f33-3ad3-000000000010', 'Tэг 10', 'tag', 'sac_cop_pda34', 'Modules.14 Del3_ Outputs.Digital.DEL3: Q 1648_4 - ГС-5, клапан давления в системе открыть(=3130105-YV4)');

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
	('3ee3c33a-3f33-3f33-3ad3-000000000007', '1ee1c11a-1f11-1f01-1ad1-000000000025', 'tag7_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000025', '1ee1c11a-1f11-1f01-1ad1-000000000026', 'func25_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000026', '1ee1c11a-1f11-1f01-1ad1-000000000027', 'func26_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000027', '1ee1c11a-1f11-1f01-1ad1-000000000028', 'func27_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000008', '1ee1c11a-1f11-1f01-1ad1-000000000029', 'tag8_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000029', '1ee1c11a-1f11-1f01-1ad1-000000000030', 'func29_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000030', '1ee1c11a-1f11-1f01-1ad1-000000000031', 'func30_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000031', '1ee1c11a-1f11-1f01-1ad1-000000000032', 'func31_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000009', '1ee1c11a-1f11-1f01-1ad1-000000000033', 'tag9_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000033', '1ee1c11a-1f11-1f01-1ad1-000000000034', 'func33_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000034', '1ee1c11a-1f11-1f01-1ad1-000000000035', 'func34_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000035', '1ee1c11a-1f11-1f01-1ad1-000000000036', 'func35_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000010', '1ee1c11a-1f11-1f01-1ad1-000000000037', 'tag10_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000037', '1ee1c11a-1f11-1f01-1ad1-000000000038', 'func37_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000038', '1ee1c11a-1f11-1f01-1ad1-000000000039', 'func38_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000039', '1ee1c11a-1f11-1f01-1ad1-000000000040', 'func39_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000041', 'tag1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000041', '1ee1c11a-1f11-1f01-1ad1-000000000042', 'func41_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000042', '1ee1c11a-1f11-1f01-1ad1-000000000043', 'func42_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000043', '1ee1c11a-1f11-1f01-1ad1-000000000044', 'func43_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', '1ee1c11a-1f11-1f01-1ad1-000000000045', 'tag2_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000045', '1ee1c11a-1f11-1f01-1ad1-000000000046', 'func45_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000046', '1ee1c11a-1f11-1f01-1ad1-000000000047', 'func46_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000047', '1ee1c11a-1f11-1f01-1ad1-000000000048', 'func47_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000049', 'tag3_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000049', '1ee1c11a-1f11-1f01-1ad1-000000000050', 'func49_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000050', '1ee1c11a-1f11-1f01-1ad1-000000000051', 'func50_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000051', '1ee1c11a-1f11-1f01-1ad1-000000000052', 'func51_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', '1ee1c11a-1f11-1f01-1ad1-000000000053', 'tag4_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000053', '1ee1c11a-1f11-1f01-1ad1-000000000054', 'func53_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000054', '1ee1c11a-1f11-1f01-1ad1-000000000055', 'func54_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000055', '1ee1c11a-1f11-1f01-1ad1-000000000056', 'func55_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000057', 'tag5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000057', '1ee1c11a-1f11-1f01-1ad1-000000000058', 'func57_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000058', '1ee1c11a-1f11-1f01-1ad1-000000000059', 'func58_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000059', '1ee1c11a-1f11-1f01-1ad1-000000000060', 'func59_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000006', '1ee1c11a-1f11-1f01-1ad1-000000000061', 'tag6_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000061', '1ee1c11a-1f11-1f01-1ad1-000000000062', 'func61_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000062', '1ee1c11a-1f11-1f01-1ad1-000000000063', 'func62_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000063', '1ee1c11a-1f11-1f01-1ad1-000000000064', 'func63_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000007', '1ee1c11a-1f11-1f01-1ad1-000000000065', 'tag7_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000065', '1ee1c11a-1f11-1f01-1ad1-000000000066', 'func65_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000066', '1ee1c11a-1f11-1f01-1ad1-000000000067', 'func66_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000067', '1ee1c11a-1f11-1f01-1ad1-000000000068', 'func67_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000008', '1ee1c11a-1f11-1f01-1ad1-000000000069', 'tag8_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000069', '1ee1c11a-1f11-1f01-1ad1-000000000070', 'func69_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000070', '1ee1c11a-1f11-1f01-1ad1-000000000071', 'func70_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000071', '1ee1c11a-1f11-1f01-1ad1-000000000072', 'func71_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000009', '1ee1c11a-1f11-1f01-1ad1-000000000073', 'tag9_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000073', '1ee1c11a-1f11-1f01-1ad1-000000000074', 'func73_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000074', '1ee1c11a-1f11-1f01-1ad1-000000000075', 'func74_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000075', '1ee1c11a-1f11-1f01-1ad1-000000000076', 'func75_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000010', '1ee1c11a-1f11-1f01-1ad1-000000000077', 'tag10_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000077', '1ee1c11a-1f11-1f01-1ad1-000000000078', 'func77_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000078', '1ee1c11a-1f11-1f01-1ad1-000000000079', 'func78_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000079', '1ee1c11a-1f11-1f01-1ad1-000000000080', 'func79_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000001', '1ee1c11a-1f11-1f01-1ad1-000000000081', 'tag1_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000081', '1ee1c11a-1f11-1f01-1ad1-000000000082', 'func81_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000082', '1ee1c11a-1f11-1f01-1ad1-000000000083', 'func82_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000083', '1ee1c11a-1f11-1f01-1ad1-000000000084', 'func83_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000002', '1ee1c11a-1f11-1f01-1ad1-000000000085', 'tag2_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000085', '1ee1c11a-1f11-1f01-1ad1-000000000086', 'func85_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000086', '1ee1c11a-1f11-1f01-1ad1-000000000087', 'func86_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000087', '1ee1c11a-1f11-1f01-1ad1-000000000088', 'func87_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000003', '1ee1c11a-1f11-1f01-1ad1-000000000089', 'tag3_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000089', '1ee1c11a-1f11-1f01-1ad1-000000000090', 'func89_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000090', '1ee1c11a-1f11-1f01-1ad1-000000000091', 'func90_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000091', '1ee1c11a-1f11-1f01-1ad1-000000000092', 'func91_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000004', '1ee1c11a-1f11-1f01-1ad1-000000000093', 'tag4_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000093', '1ee1c11a-1f11-1f01-1ad1-000000000094', 'func93_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000094', '1ee1c11a-1f11-1f01-1ad1-000000000095', 'func94_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000095', '1ee1c11a-1f11-1f01-1ad1-000000000096', 'func95_alias'),
	('3ee3c33a-3f33-3f33-3ad3-000000000005', '1ee1c11a-1f11-1f01-1ad1-000000000097', 'tag5_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000097', '1ee1c11a-1f11-1f01-1ad1-000000000098', 'func97_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000098', '1ee1c11a-1f11-1f01-1ad1-000000000099', 'func98_alias'),
	('1ee1c11a-1f11-1f01-1ad1-000000000099', '1ee1c11a-1f11-1f01-1ad1-000000000100', 'func99_alias');

