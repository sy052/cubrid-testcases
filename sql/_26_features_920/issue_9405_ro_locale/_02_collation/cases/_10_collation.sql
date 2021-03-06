--+ holdcas on;
set names utf8;
CREATE TABLE coll_test (id INTEGER, s VARCHAR(10) collate utf8_ro_cs);

INSERT INTO coll_test (id, s) values (0, 'X');
INSERT INTO coll_test (id, s) values (401, 'xÿx');
INSERT INTO coll_test (id, s) values (394, 'XŸ');
INSERT INTO coll_test (id, s) values (387, 'xx');
INSERT INTO coll_test (id, s) values (380, 'xW');
INSERT INTO coll_test (id, s) values (373, 'Xv');
INSERT INTO coll_test (id, s) values (366, 'xȚx');
INSERT INTO coll_test (id, s) values (359, 'xux');
INSERT INTO coll_test (id, s) values (352, 'xÜ');
INSERT INTO coll_test (id, s) values (345, 'xŭ');
INSERT INTO coll_test (id, s) values (338, 'XÙ');
INSERT INTO coll_test (id, s) values (331, 'Xu');
INSERT INTO coll_test (id, s) values (324, 'XT');
INSERT INTO coll_test (id, s) values (317, 'xSSx');
INSERT INTO coll_test (id, s) values (310, 'Xss');
INSERT INTO coll_test (id, s) values (303, 'XS');
INSERT INTO coll_test (id, s) values (296, 'xqx');
INSERT INTO coll_test (id, s) values (289, 'xPx');
INSERT INTO coll_test (id, s) values (282, 'xøx');
INSERT INTO coll_test (id, s) values (275, 'xŎx');
INSERT INTO coll_test (id, s) values (268, 'xœx');
INSERT INTO coll_test (id, s) values (261, 'xŌ');
INSERT INTO coll_test (id, s) values (254, 'xö');
INSERT INTO coll_test (id, s) values (247, 'XÔ');
INSERT INTO coll_test (id, s) values (240, 'Xò');
INSERT INTO coll_test (id, s) values (233, 'xO');
INSERT INTO coll_test (id, s) values (226, 'xñ');
INSERT INTO coll_test (id, s) values (219, 'XN');
INSERT INTO coll_test (id, s) values (212, 'xlx');
INSERT INTO coll_test (id, s) values (205, 'xKx');
INSERT INTO coll_test (id, s) values (198, 'xj');
INSERT INTO coll_test (id, s) values (191, 'xÏx');
INSERT INTO coll_test (id, s) values (184, 'xíx');
INSERT INTO coll_test (id, s) values (177, 'XĪ');
INSERT INTO coll_test (id, s) values (170, 'Xî');
INSERT INTO coll_test (id, s) values (163, 'xÌ');
INSERT INTO coll_test (id, s) values (156, 'xi');
INSERT INTO coll_test (id, s) values (149, 'xH');
INSERT INTO coll_test (id, s) values (142, 'Xg');
INSERT INTO coll_test (id, s) values (135, 'XF');
INSERT INTO coll_test (id, s) values (128, 'xĕx');
INSERT INTO coll_test (id, s) values (121, 'xEx');
INSERT INTO coll_test (id, s) values (114, 'Xë');
INSERT INTO coll_test (id, s) values (107, 'xĔ');
INSERT INTO coll_test (id, s) values (100, 'xé');
INSERT INTO coll_test (id, s) values (93, 'XE');
INSERT INTO coll_test (id, s) values (86, 'xçx');
INSERT INTO coll_test (id, s) values (79, 'XÇ');
INSERT INTO coll_test (id, s) values (72, 'xb');
INSERT INTO coll_test (id, s) values (65, 'xÄx');
INSERT INTO coll_test (id, s) values (58, 'xàx');
INSERT INTO coll_test (id, s) values (51, 'xÆx');
INSERT INTO coll_test (id, s) values (44, 'Xā');
INSERT INTO coll_test (id, s) values (37, 'xÅ');
INSERT INTO coll_test (id, s) values (30, 'xă');
INSERT INTO coll_test (id, s) values (23, 'XÀ');
INSERT INTO coll_test (id, s) values (16, 'Xa');
INSERT INTO coll_test (id, s) values (9, 'X12');
INSERT INTO coll_test (id, s) values (2, 'x x');
INSERT INTO coll_test (id, s) values (403, 'Xz');
INSERT INTO coll_test (id, s) values (396, 'xŸ');
INSERT INTO coll_test (id, s) values (389, 'xxx');
INSERT INTO coll_test (id, s) values (382, 'xWx');
INSERT INTO coll_test (id, s) values (375, 'xv');
INSERT INTO coll_test (id, s) values (368, 'xÜx');
INSERT INTO coll_test (id, s) values (361, 'xúx');
INSERT INTO coll_test (id, s) values (354, 'XŪ');
INSERT INTO coll_test (id, s) values (347, 'Xț');
INSERT INTO coll_test (id, s) values (340, 'xÙ');
INSERT INTO coll_test (id, s) values (333, 'xu');
INSERT INTO coll_test (id, s) values (326, 'xT');
INSERT INTO coll_test (id, s) values (319, 'xsSx');
INSERT INTO coll_test (id, s) values (312, 'xSs');
INSERT INTO coll_test (id, s) values (305, 'xS');
INSERT INTO coll_test (id, s) values (298, 'Xr');
INSERT INTO coll_test (id, s) values (291, 'XQ');
INSERT INTO coll_test (id, s) values (284, 'xōx');
INSERT INTO coll_test (id, s) values (277, 'xÔx');
INSERT INTO coll_test (id, s) values (270, 'xox');
INSERT INTO coll_test (id, s) values (263, 'XŒ');
INSERT INTO coll_test (id, s) values (256, 'Xø');
INSERT INTO coll_test (id, s) values (249, 'xÔ');
INSERT INTO coll_test (id, s) values (242, 'xò');
INSERT INTO coll_test (id, s) values (235, 'XÓ');
INSERT INTO coll_test (id, s) values (228, 'xnx');
INSERT INTO coll_test (id, s) values (221, 'xN');
INSERT INTO coll_test (id, s) values (214, 'Xm');
INSERT INTO coll_test (id, s) values (207, 'XL');
INSERT INTO coll_test (id, s) values (200, 'xjx');
INSERT INTO coll_test (id, s) values (193, 'xĪx');
INSERT INTO coll_test (id, s) values (186, 'xìx');
INSERT INTO coll_test (id, s) values (179, 'xĪ');
INSERT INTO coll_test (id, s) values (172, 'xî');
INSERT INTO coll_test (id, s) values (165, 'XĬ');
INSERT INTO coll_test (id, s) values (158, 'Xí');
INSERT INTO coll_test (id, s) values (151, 'xHx');
INSERT INTO coll_test (id, s) values (144, 'xg');
INSERT INTO coll_test (id, s) values (137, 'xF');
INSERT INTO coll_test (id, s) values (130, 'xêx');
INSERT INTO coll_test (id, s) values (123, 'xÉx');
INSERT INTO coll_test (id, s) values (116, 'xë');
INSERT INTO coll_test (id, s) values (109, 'XÊ');
INSERT INTO coll_test (id, s) values (102, 'Xè');
INSERT INTO coll_test (id, s) values (95, 'xE');
INSERT INTO coll_test (id, s) values (88, 'Xd');
INSERT INTO coll_test (id, s) values (81, 'xÇ');
INSERT INTO coll_test (id, s) values (74, 'xbx');
INSERT INTO coll_test (id, s) values (67, 'xĀx');
INSERT INTO coll_test (id, s) values (60, 'xăx');
INSERT INTO coll_test (id, s) values (53, 'xAx');
INSERT INTO coll_test (id, s) values (46, 'xā');
INSERT INTO coll_test (id, s) values (39, 'XÄ');
INSERT INTO coll_test (id, s) values (32, 'Xâ');
INSERT INTO coll_test (id, s) values (25, 'xÀ');
INSERT INTO coll_test (id, s) values (18, 'xa');
INSERT INTO coll_test (id, s) values (11, 'x12x');
INSERT INTO coll_test (id, s) values (4, 'x.');
INSERT INTO coll_test (id, s) values (405, 'xz');
INSERT INTO coll_test (id, s) values (398, 'xYx');
INSERT INTO coll_test (id, s) values (391, 'Xy');
INSERT INTO coll_test (id, s) values (384, 'XX');
INSERT INTO coll_test (id, s) values (377, 'xvx');
INSERT INTO coll_test (id, s) values (370, 'xŪx');
INSERT INTO coll_test (id, s) values (363, 'xùx');
INSERT INTO coll_test (id, s) values (356, 'xŪ');
INSERT INTO coll_test (id, s) values (349, 'xț');
INSERT INTO coll_test (id, s) values (342, 'XŬ');
INSERT INTO coll_test (id, s) values (335, 'Xú');
INSERT INTO coll_test (id, s) values (328, 'xTx');
INSERT INTO coll_test (id, s) values (321, 'xßx');
INSERT INTO coll_test (id, s) values (314, 'xss');
INSERT INTO coll_test (id, s) values (307, 'XSS');
INSERT INTO coll_test (id, s) values (300, 'xr');
INSERT INTO coll_test (id, s) values (293, 'xQ');
INSERT INTO coll_test (id, s) values (286, 'Xp');
INSERT INTO coll_test (id, s) values (279, 'xÖx');
INSERT INTO coll_test (id, s) values (272, 'xóx');
INSERT INTO coll_test (id, s) values (265, 'xŒ');
INSERT INTO coll_test (id, s) values (258, 'xø');
INSERT INTO coll_test (id, s) values (251, 'XÖ');
INSERT INTO coll_test (id, s) values (244, 'Xŏ');
INSERT INTO coll_test (id, s) values (237, 'xÓ');
INSERT INTO coll_test (id, s) values (230, 'xñx');
INSERT INTO coll_test (id, s) values (223, 'XÑ');
INSERT INTO coll_test (id, s) values (216, 'xm');
INSERT INTO coll_test (id, s) values (209, 'xL');
INSERT INTO coll_test (id, s) values (202, 'Xk');
INSERT INTO coll_test (id, s) values (195, 'XJ');
INSERT INTO coll_test (id, s) values (188, 'xĭx');
INSERT INTO coll_test (id, s) values (181, 'xIx');
INSERT INTO coll_test (id, s) values (174, 'Xï');
INSERT INTO coll_test (id, s) values (167, 'xĬ');
INSERT INTO coll_test (id, s) values (160, 'xí');
INSERT INTO coll_test (id, s) values (153, 'XI');
INSERT INTO coll_test (id, s) values (146, 'xgx');
INSERT INTO coll_test (id, s) values (139, 'xFx');
INSERT INTO coll_test (id, s) values (132, 'xëx');
INSERT INTO coll_test (id, s) values (125, 'xÈx');
INSERT INTO coll_test (id, s) values (118, 'Xș');
INSERT INTO coll_test (id, s) values (111, 'xÊ');
INSERT INTO coll_test (id, s) values (104, 'xè');
INSERT INTO coll_test (id, s) values (97, 'XÉ');
INSERT INTO coll_test (id, s) values (90, 'xd');
INSERT INTO coll_test (id, s) values (83, 'xCx');
INSERT INTO coll_test (id, s) values (76, 'Xc');
INSERT INTO coll_test (id, s) values (69, 'XB');
INSERT INTO coll_test (id, s) values (62, 'xâx');
INSERT INTO coll_test (id, s) values (55, 'xÁx');
INSERT INTO coll_test (id, s) values (48, 'Xæ');
INSERT INTO coll_test (id, s) values (41, 'xÄ');
INSERT INTO coll_test (id, s) values (34, 'xâ');
INSERT INTO coll_test (id, s) values (27, 'XĂ');
INSERT INTO coll_test (id, s) values (20, 'Xá');
INSERT INTO coll_test (id, s) values (13, 'x2');
INSERT INTO coll_test (id, s) values (6, 'X0');
INSERT INTO coll_test (id, s) values (407, 'xzx');
INSERT INTO coll_test (id, s) values (400, 'xŸx');
INSERT INTO coll_test (id, s) values (393, 'xy');
INSERT INTO coll_test (id, s) values (386, 'xX');
INSERT INTO coll_test (id, s) values (379, 'Xw');
INSERT INTO coll_test (id, s) values (372, 'XV');
INSERT INTO coll_test (id, s) values (365, 'xŭx');
INSERT INTO coll_test (id, s) values (358, 'xUx');
INSERT INTO coll_test (id, s) values (351, 'Xü');
INSERT INTO coll_test (id, s) values (344, 'xŬ');
INSERT INTO coll_test (id, s) values (337, 'xú');
INSERT INTO coll_test (id, s) values (330, 'XU');
INSERT INTO coll_test (id, s) values (323, 'xsx');
INSERT INTO coll_test (id, s) values (316, 'xß');
INSERT INTO coll_test (id, s) values (309, 'XsS');
INSERT INTO coll_test (id, s) values (302, 'xrx');
INSERT INTO coll_test (id, s) values (295, 'xQx');
INSERT INTO coll_test (id, s) values (288, 'xp');
INSERT INTO coll_test (id, s) values (281, 'xØx');
INSERT INTO coll_test (id, s) values (274, 'xòx');
INSERT INTO coll_test (id, s) values (267, 'xŒx');
INSERT INTO coll_test (id, s) values (260, 'Xō');
INSERT INTO coll_test (id, s) values (253, 'xÖ');
INSERT INTO coll_test (id, s) values (246, 'xŏ');
INSERT INTO coll_test (id, s) values (239, 'XÒ');
INSERT INTO coll_test (id, s) values (232, 'Xo');
INSERT INTO coll_test (id, s) values (225, 'xÑ');
INSERT INTO coll_test (id, s) values (218, 'xmx');
INSERT INTO coll_test (id, s) values (211, 'xLx');
INSERT INTO coll_test (id, s) values (204, 'xk');
INSERT INTO coll_test (id, s) values (197, 'xJ');
INSERT INTO coll_test (id, s) values (190, 'xîx');
INSERT INTO coll_test (id, s) values (183, 'xÍx');
INSERT INTO coll_test (id, s) values (176, 'xï');
INSERT INTO coll_test (id, s) values (169, 'XÎ');
INSERT INTO coll_test (id, s) values (162, 'Xì');
INSERT INTO coll_test (id, s) values (155, 'xI');
INSERT INTO coll_test (id, s) values (148, 'Xh');
INSERT INTO coll_test (id, s) values (141, 'XG');
INSERT INTO coll_test (id, s) values (134, 'xșx');
INSERT INTO coll_test (id, s) values (127, 'xĔx');
INSERT INTO coll_test (id, s) values (120, 'xș');
INSERT INTO coll_test (id, s) values (113, 'XË');
INSERT INTO coll_test (id, s) values (106, 'Xĕ');
INSERT INTO coll_test (id, s) values (99, 'xÉ');
INSERT INTO coll_test (id, s) values (92, 'xdx');
INSERT INTO coll_test (id, s) values (85, 'xÇx');
INSERT INTO coll_test (id, s) values (78, 'xc');
INSERT INTO coll_test (id, s) values (71, 'xB');
INSERT INTO coll_test (id, s) values (64, 'xåx');
INSERT INTO coll_test (id, s) values (57, 'xÀx');
INSERT INTO coll_test (id, s) values (50, 'xæ');
INSERT INTO coll_test (id, s) values (43, 'XĀ');
INSERT INTO coll_test (id, s) values (36, 'Xå');
INSERT INTO coll_test (id, s) values (29, 'xĂ');
INSERT INTO coll_test (id, s) values (22, 'xá');
INSERT INTO coll_test (id, s) values (15, 'XA');
INSERT INTO coll_test (id, s) values (8, 'x0x');
INSERT INTO coll_test (id, s) values (1, 'x');
INSERT INTO coll_test (id, s) values (402, 'XZ');
INSERT INTO coll_test (id, s) values (395, 'Xÿ');
INSERT INTO coll_test (id, s) values (388, 'xXx');
INSERT INTO coll_test (id, s) values (381, 'xw');
INSERT INTO coll_test (id, s) values (374, 'xV');
INSERT INTO coll_test (id, s) values (367, 'xțx');
INSERT INTO coll_test (id, s) values (360, 'xÚx');
INSERT INTO coll_test (id, s) values (353, 'xü');
INSERT INTO coll_test (id, s) values (346, 'XȚ');
INSERT INTO coll_test (id, s) values (339, 'Xù');
INSERT INTO coll_test (id, s) values (332, 'xU');
INSERT INTO coll_test (id, s) values (325, 'Xt');
INSERT INTO coll_test (id, s) values (318, 'xSsx');
INSERT INTO coll_test (id, s) values (311, 'xSS');
INSERT INTO coll_test (id, s) values (304, 'Xs');
INSERT INTO coll_test (id, s) values (297, 'XR');
INSERT INTO coll_test (id, s) values (290, 'xpx');
INSERT INTO coll_test (id, s) values (283, 'xŌx');
INSERT INTO coll_test (id, s) values (276, 'xŏx');
INSERT INTO coll_test (id, s) values (269, 'xOx');
INSERT INTO coll_test (id, s) values (262, 'xō');
INSERT INTO coll_test (id, s) values (255, 'XØ');
INSERT INTO coll_test (id, s) values (248, 'Xô');
INSERT INTO coll_test (id, s) values (241, 'xÒ');
INSERT INTO coll_test (id, s) values (234, 'xo');
INSERT INTO coll_test (id, s) values (227, 'xNx');
INSERT INTO coll_test (id, s) values (220, 'Xn');
INSERT INTO coll_test (id, s) values (213, 'XM');
INSERT INTO coll_test (id, s) values (206, 'xkx');
INSERT INTO coll_test (id, s) values (199, 'xJx');
INSERT INTO coll_test (id, s) values (192, 'xïx');
INSERT INTO coll_test (id, s) values (185, 'xÌx');
INSERT INTO coll_test (id, s) values (178, 'Xī');
INSERT INTO coll_test (id, s) values (171, 'xÎ');
INSERT INTO coll_test (id, s) values (164, 'xì');
INSERT INTO coll_test (id, s) values (157, 'XÍ');
INSERT INTO coll_test (id, s) values (150, 'xh');
INSERT INTO coll_test (id, s) values (143, 'xG');
INSERT INTO coll_test (id, s) values (136, 'Xf');
INSERT INTO coll_test (id, s) values (129, 'xÊx');
INSERT INTO coll_test (id, s) values (122, 'xex');
INSERT INTO coll_test (id, s) values (115, 'xË');
INSERT INTO coll_test (id, s) values (108, 'xĕ');
INSERT INTO coll_test (id, s) values (101, 'XÈ');
INSERT INTO coll_test (id, s) values (94, 'Xe');
INSERT INTO coll_test (id, s) values (87, 'XD');
INSERT INTO coll_test (id, s) values (80, 'Xç');
INSERT INTO coll_test (id, s) values (73, 'xBx');
INSERT INTO coll_test (id, s) values (66, 'xäx');
INSERT INTO coll_test (id, s) values (59, 'xĂx');
INSERT INTO coll_test (id, s) values (52, 'xæx');
INSERT INTO coll_test (id, s) values (45, 'xĀ');
INSERT INTO coll_test (id, s) values (38, 'xå');
INSERT INTO coll_test (id, s) values (31, 'XÂ');
INSERT INTO coll_test (id, s) values (24, 'Xà');
INSERT INTO coll_test (id, s) values (17, 'xA');
INSERT INTO coll_test (id, s) values (10, 'x12');
INSERT INTO coll_test (id, s) values (3, 'X.');
INSERT INTO coll_test (id, s) values (404, 'xZ');
INSERT INTO coll_test (id, s) values (397, 'xÿ');
INSERT INTO coll_test (id, s) values (390, 'XY');
INSERT INTO coll_test (id, s) values (383, 'xwx');
INSERT INTO coll_test (id, s) values (376, 'xVx');
INSERT INTO coll_test (id, s) values (369, 'xüx');
INSERT INTO coll_test (id, s) values (362, 'xÙx');
INSERT INTO coll_test (id, s) values (355, 'Xū');
INSERT INTO coll_test (id, s) values (348, 'xȚ');
INSERT INTO coll_test (id, s) values (341, 'xù');
INSERT INTO coll_test (id, s) values (334, 'XÚ');
INSERT INTO coll_test (id, s) values (327, 'xt');
INSERT INTO coll_test (id, s) values (320, 'xssx');
INSERT INTO coll_test (id, s) values (313, 'xsS');
INSERT INTO coll_test (id, s) values (306, 'xs');
INSERT INTO coll_test (id, s) values (299, 'xR');
INSERT INTO coll_test (id, s) values (292, 'Xq');
INSERT INTO coll_test (id, s) values (285, 'XP');
INSERT INTO coll_test (id, s) values (278, 'xôx');
INSERT INTO coll_test (id, s) values (271, 'xÓx');
INSERT INTO coll_test (id, s) values (264, 'Xœ');
INSERT INTO coll_test (id, s) values (257, 'xØ');
INSERT INTO coll_test (id, s) values (250, 'xô');
INSERT INTO coll_test (id, s) values (243, 'XŎ');
INSERT INTO coll_test (id, s) values (236, 'Xó');
INSERT INTO coll_test (id, s) values (229, 'xÑx');
INSERT INTO coll_test (id, s) values (222, 'xn');
INSERT INTO coll_test (id, s) values (215, 'xM');
INSERT INTO coll_test (id, s) values (208, 'Xl');
INSERT INTO coll_test (id, s) values (201, 'XK');
INSERT INTO coll_test (id, s) values (194, 'xīx');
INSERT INTO coll_test (id, s) values (187, 'xĬx');
INSERT INTO coll_test (id, s) values (180, 'xī');
INSERT INTO coll_test (id, s) values (173, 'XÏ');
INSERT INTO coll_test (id, s) values (166, 'Xĭ');
INSERT INTO coll_test (id, s) values (159, 'xÍ');
INSERT INTO coll_test (id, s) values (152, 'xhx');
INSERT INTO coll_test (id, s) values (145, 'xGx');
INSERT INTO coll_test (id, s) values (138, 'xf');
INSERT INTO coll_test (id, s) values (131, 'xËx');
INSERT INTO coll_test (id, s) values (124, 'xéx');
INSERT INTO coll_test (id, s) values (117, 'XȘ');
INSERT INTO coll_test (id, s) values (110, 'Xê');
INSERT INTO coll_test (id, s) values (103, 'xÈ');
INSERT INTO coll_test (id, s) values (96, 'xe');
INSERT INTO coll_test (id, s) values (89, 'xD');
INSERT INTO coll_test (id, s) values (82, 'xç');
INSERT INTO coll_test (id, s) values (75, 'XC');
INSERT INTO coll_test (id, s) values (68, 'xāx');
INSERT INTO coll_test (id, s) values (61, 'xÂx');
INSERT INTO coll_test (id, s) values (54, 'xax');
INSERT INTO coll_test (id, s) values (47, 'XÆ');
INSERT INTO coll_test (id, s) values (40, 'Xä');
INSERT INTO coll_test (id, s) values (33, 'xÂ');
INSERT INTO coll_test (id, s) values (26, 'xà');
INSERT INTO coll_test (id, s) values (19, 'XÁ');
INSERT INTO coll_test (id, s) values (12, 'X2');
INSERT INTO coll_test (id, s) values (5, 'x.x');
INSERT INTO coll_test (id, s) values (406, 'xZx');
INSERT INTO coll_test (id, s) values (399, 'xyx');
INSERT INTO coll_test (id, s) values (392, 'xY');
INSERT INTO coll_test (id, s) values (385, 'Xx');
INSERT INTO coll_test (id, s) values (378, 'XW');
INSERT INTO coll_test (id, s) values (371, 'xūx');
INSERT INTO coll_test (id, s) values (364, 'xŬx');
INSERT INTO coll_test (id, s) values (357, 'xū');
INSERT INTO coll_test (id, s) values (350, 'XÜ');
INSERT INTO coll_test (id, s) values (343, 'Xŭ');
INSERT INTO coll_test (id, s) values (336, 'xÚ');
INSERT INTO coll_test (id, s) values (329, 'xtx');
INSERT INTO coll_test (id, s) values (322, 'xSx');
INSERT INTO coll_test (id, s) values (315, 'Xß');
INSERT INTO coll_test (id, s) values (308, 'XSs');
INSERT INTO coll_test (id, s) values (301, 'xRx');
INSERT INTO coll_test (id, s) values (294, 'xq');
INSERT INTO coll_test (id, s) values (287, 'xP');
INSERT INTO coll_test (id, s) values (280, 'xöx');
INSERT INTO coll_test (id, s) values (273, 'xÒx');
INSERT INTO coll_test (id, s) values (266, 'xœ');
INSERT INTO coll_test (id, s) values (259, 'XŌ');
INSERT INTO coll_test (id, s) values (252, 'Xö');
INSERT INTO coll_test (id, s) values (245, 'xŎ');
INSERT INTO coll_test (id, s) values (238, 'xó');
INSERT INTO coll_test (id, s) values (231, 'XO');
INSERT INTO coll_test (id, s) values (224, 'Xñ');
INSERT INTO coll_test (id, s) values (217, 'xMx');
INSERT INTO coll_test (id, s) values (210, 'xl');
INSERT INTO coll_test (id, s) values (203, 'xK');
INSERT INTO coll_test (id, s) values (196, 'Xj');
INSERT INTO coll_test (id, s) values (189, 'xÎx');
INSERT INTO coll_test (id, s) values (182, 'xix');
INSERT INTO coll_test (id, s) values (175, 'xÏ');
INSERT INTO coll_test (id, s) values (168, 'xĭ');
INSERT INTO coll_test (id, s) values (161, 'XÌ');
INSERT INTO coll_test (id, s) values (154, 'Xi');
INSERT INTO coll_test (id, s) values (147, 'XH');
INSERT INTO coll_test (id, s) values (140, 'xfx');
INSERT INTO coll_test (id, s) values (133, 'xȘx');
INSERT INTO coll_test (id, s) values (126, 'xèx');
INSERT INTO coll_test (id, s) values (119, 'xȘ');
INSERT INTO coll_test (id, s) values (112, 'xê');
INSERT INTO coll_test (id, s) values (105, 'XĔ');
INSERT INTO coll_test (id, s) values (98, 'Xé');
INSERT INTO coll_test (id, s) values (91, 'xDx');
INSERT INTO coll_test (id, s) values (84, 'xcx');
INSERT INTO coll_test (id, s) values (77, 'xC');
INSERT INTO coll_test (id, s) values (70, 'Xb');
INSERT INTO coll_test (id, s) values (63, 'xÅx');
INSERT INTO coll_test (id, s) values (56, 'xáx');
INSERT INTO coll_test (id, s) values (49, 'xÆ');
INSERT INTO coll_test (id, s) values (42, 'xä');
INSERT INTO coll_test (id, s) values (35, 'XÅ');
INSERT INTO coll_test (id, s) values (28, 'Xă');
INSERT INTO coll_test (id, s) values (21, 'xÁ');
INSERT INTO coll_test (id, s) values (14, 'x2x');
INSERT INTO coll_test (id, s) values (7, 'x0');

SELECT id, s FROM coll_test ORDER BY s;

DROP TABLE coll_test;
set names iso88591;
commit;
--+ holdcas off;