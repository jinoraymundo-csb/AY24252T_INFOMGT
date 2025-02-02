USE [INFOMGT_TCS2];

CREATE TABLE movies (
	movie_id INT identity(1,1) PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE,
	location VARCHAR(12),
	average_review_score DECIMAL(4,2),
	release_date DATE
);
SET IDENTITY_INSERT movies ON;
insert into movies (movie_id, title, location, average_review_score, release_date) values (1, 'Footprints on the Moon (Le orme) (Primal Impulse)', 'Toronto', 0.72, '2022-08-24');
insert into movies (movie_id, title, location, average_review_score, release_date) values (2, 'Wild Beasts (Wild beasts - Belve feroci)', 'New York', 4.26, '2006-05-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (3, 'Blue Lagoon, The', 'London', 0.03, '1990-02-15');
insert into movies (movie_id, title, location, average_review_score, release_date) values (4, 'Marvin Gaye: What''s Going On', 'Tokyo', 8.46, '2020-12-02');
insert into movies (movie_id, title, location, average_review_score, release_date) values (5, 'Jolly Boys'' Last Stand, The', 'Paris', 0.9, '2002-05-29');
insert into movies (movie_id, title, location, average_review_score, release_date) values (6, 'Woman in the Fifth, The (Femme du Vème, La)', 'London', 4.2, '1994-02-02');
insert into movies (movie_id, title, location, average_review_score, release_date) values (7, 'Butley', 'Berlin', 1.37, '2007-04-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (8, 'ABCs of Death, The', 'Berlin', 9.07, '2001-01-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (9, 'Cabin in the Sky', 'Toronto', 2.85, '2006-02-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (10, 'Jay and Silent Bob Go Down Under', 'London', 3.83, '1999-11-23');
insert into movies (movie_id, title, location, average_review_score, release_date) values (11, 'The Hire: Hostage', 'Toronto', 1.81, '2018-08-22');
insert into movies (movie_id, title, location, average_review_score, release_date) values (12, 'Digging for Fire', 'Toronto', 9.22, '1992-09-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (13, 'Red Eye', 'London', 2.11, '2019-11-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (14, 'Chicken, the Fish and the King Crab, The (El pollo, el pez y el cangrejo real)', 'Tokyo', 1.65, '2014-07-15');
insert into movies (movie_id, title, location, average_review_score, release_date) values (15, 'Return to Snowy River (a.k.a. The Man From Snowy River II)', 'Buenos Aires', 9.36, '2021-08-17');
insert into movies (movie_id, title, location, average_review_score, release_date) values (16, 'Son in Law', 'New York', 4.23, '1996-07-22');
insert into movies (movie_id, title, location, average_review_score, release_date) values (17, 'Brokedown Palace', 'Paris', 5.79, '1994-09-06');
insert into movies (movie_id, title, location, average_review_score, release_date) values (18, 'Miss Pettigrew Lives for a Day', 'Toronto', 9.17, '2017-07-31');
insert into movies (movie_id, title, location, average_review_score, release_date) values (19, 'Dark Lurking, The', 'London', 8.1, '2000-07-07');
insert into movies (movie_id, title, location, average_review_score, release_date) values (20, 'Time to Live, a Time to Die, A (Tong nien wang shi)', null, 0.77, '2019-02-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (21, 'Jesse Stone: Sea Change', 'Paris', 1.11, '2016-05-09');
insert into movies (movie_id, title, location, average_review_score, release_date) values (22, 'War on Democracy, The', null, 5.13, '2023-01-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (23, 'Saga of Gosta Berling, The (Gösta Berlings saga)', 'Buenos Aires', 9.54, '1995-10-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (24, 'Maxed Out: Hard Times, Easy Credit and the Era of Predatory Lenders', 'Los Angeles', 7.44, '2007-10-19');
insert into movies (movie_id, title, location, average_review_score, release_date) values (25, 'Moonshot', 'Los Angeles', 2.84, '2017-10-12');
insert into movies (movie_id, title, location, average_review_score, release_date) values (26, 'Vacuuming Completely Nude in Paradise', 'Tokyo', 2.63, '1991-03-27');
insert into movies (movie_id, title, location, average_review_score, release_date) values (27, 'Delivery Man', 'Madrid', 8.28, '2002-11-19');
insert into movies (movie_id, title, location, average_review_score, release_date) values (28, 'Return, The', 'Berlin', 9.08, '2016-04-23');
insert into movies (movie_id, title, location, average_review_score, release_date) values (29, 'Tron: Legacy', 'Buenos Aires', 7.33, '1995-10-01');
insert into movies (movie_id, title, location, average_review_score, release_date) values (30, 'High Road to China', 'Toronto', 1.56, '2004-11-29');
insert into movies (movie_id, title, location, average_review_score, release_date) values (31, 'John Dies at the End', 'Buenos Aires', 4.63, '2024-05-15');
insert into movies (movie_id, title, location, average_review_score, release_date) values (32, 'Red Riding: 1974', 'New York', 7.12, '2024-01-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (33, 'Girlfight', 'Berlin', 2.52, '2020-06-08');
insert into movies (movie_id, title, location, average_review_score, release_date) values (34, 'Smashed', 'Paris', 0.86, '2003-06-19');
insert into movies (movie_id, title, location, average_review_score, release_date) values (35, 'Action Jackson', 'Toronto', 8.91, '2015-12-26');
insert into movies (movie_id, title, location, average_review_score, release_date) values (36, 'Tim''s Vermeer', 'Los Angeles', 8.95, '2002-08-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (37, 'Keeper of Lost Causes, The (Kvinden i buret)', 'Paris', 3.7, '2005-04-12');
insert into movies (movie_id, title, location, average_review_score, release_date) values (38, 'Body Heat', null, 5.69, '1990-11-11');
insert into movies (movie_id, title, location, average_review_score, release_date) values (39, 'The Brave Little Toaster Goes to Mars', 'New York', 1.23, '2022-10-29');
insert into movies (movie_id, title, location, average_review_score, release_date) values (40, 'MirrorMask', 'New York', 4.9, '1999-12-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (41, 'Hannah Free', null, 2.16, '1996-10-07');
insert into movies (movie_id, title, location, average_review_score, release_date) values (42, 'Forget me not', 'Hong Kong', 6.3, '1998-02-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (43, 'Golden Earrings', 'Los Angeles', 4.94, null);
insert into movies (movie_id, title, location, average_review_score, release_date) values (44, 'Woman of Antwerp', 'Toronto', 5.76, '2020-02-17');
insert into movies (movie_id, title, location, average_review_score, release_date) values (45, 'Deep Water', 'London', 5.67, '2013-07-08');
insert into movies (movie_id, title, location, average_review_score, release_date) values (46, 'Secret, The', 'Berlin', 3.91, '2004-05-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (47, 'Cosmonaut (Cosmonauta)', 'Tokyo', 1.82, '2006-02-17');
insert into movies (movie_id, title, location, average_review_score, release_date) values (48, 'Tribe, The (Plemya)', 'Tokyo', 5.3, '2019-10-29');
insert into movies (movie_id, title, location, average_review_score, release_date) values (49, 'Western', 'Berlin', 8.15, '1990-11-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (50, 'Squanto: A Warrior''s Tale', null, 2.71, '2001-11-19');
insert into movies (movie_id, title, location, average_review_score, release_date) values (51, 'Vinyan', 'Los Angeles', 1.94, '2009-02-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (52, 'Girl Who Kicked the Hornet''s Nest, The (Luftslottet som sprängdes)', 'Buenos Aires', 3.57, '1996-04-09');
insert into movies (movie_id, title, location, average_review_score, release_date) values (53, 'Black Scorpion, The', 'Berlin', 5.0, '1991-05-09');
insert into movies (movie_id, title, location, average_review_score, release_date) values (54, 'Mulholland Drive', 'Paris', 5.66, '1990-11-17');
insert into movies (movie_id, title, location, average_review_score, release_date) values (55, 'Greatest Show on Earth, The', 'Madrid', 7.68, '2015-01-05');
insert into movies (movie_id, title, location, average_review_score, release_date) values (56, 'Lawless', 'Paris', 7.9, '2014-10-05');
insert into movies (movie_id, title, location, average_review_score, release_date) values (57, 'Liv & Ingmar', null, 8.32, '1999-09-04');
insert into movies (movie_id, title, location, average_review_score, release_date) values (58, 'Kozara', 'Berlin', 4.8, null);
insert into movies (movie_id, title, location, average_review_score, release_date) values (59, 'Night and Day', 'New York', 3.45, '1997-07-27');
insert into movies (movie_id, title, location, average_review_score, release_date) values (60, 'Look Both Ways', 'London', 0.18, '2024-08-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (61, 'Fistful of Dollars, A (Per un pugno di dollari)', 'Hong Kong', 7.13, '2009-03-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (62, 'Einstein and Eddington', 'Paris', 2.98, '1993-01-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (63, 'Summer Wars (Samâ wôzu)', 'Hong Kong', 2.29, '1993-01-23');
insert into movies (movie_id, title, location, average_review_score, release_date) values (64, 'Tour De Force (Hin und weg)', 'Berlin', 7.25, '2003-07-17');
insert into movies (movie_id, title, location, average_review_score, release_date) values (65, 'Haute Cuisine', 'Los Angeles', 6.93, '2019-03-22');
insert into movies (movie_id, title, location, average_review_score, release_date) values (66, 'Pokémon the Movie: Black - Victini and Reshiram', null, 4.86, '2006-07-24');
insert into movies (movie_id, title, location, average_review_score, release_date) values (67, 'Inkwell, The', 'Madrid', 2.54, '2021-12-28');
insert into movies (movie_id, title, location, average_review_score, release_date) values (68, 'Donner Party, The', 'Toronto', 8.5, '2002-04-15');
insert into movies (movie_id, title, location, average_review_score, release_date) values (69, 'Starship Troopers', 'Toronto', 1.62, '2010-06-07');
insert into movies (movie_id, title, location, average_review_score, release_date) values (70, '588 Rue Paradis (Mother)', 'Buenos Aires', 6.01, '1993-05-16');
insert into movies (movie_id, title, location, average_review_score, release_date) values (71, 'Cape Fear', 'Berlin', 0.71, '1990-09-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (72, 'Trap: What Happened to Our Dream of Freedom, The', null, 6.1, '1992-04-21');
insert into movies (movie_id, title, location, average_review_score, release_date) values (73, 'Belphecor: Curse of the Mummy (Belphégor - Le fantôme du Louvre)', 'Buenos Aires', 7.01, '1995-10-03');
insert into movies (movie_id, title, location, average_review_score, release_date) values (74, 'Scientist, The', 'Berlin', 3.98, '2000-06-26');
insert into movies (movie_id, title, location, average_review_score, release_date) values (75, 'Blue Spring (Aoi haru)', 'Buenos Aires', 3.13, '2014-09-11');
insert into movies (movie_id, title, location, average_review_score, release_date) values (76, 'Broken Arrow', 'New York', 4.52, '2021-08-26');
insert into movies (movie_id, title, location, average_review_score, release_date) values (77, 'For Those in Peril', 'Madrid', 2.4, '2020-09-09');
insert into movies (movie_id, title, location, average_review_score, release_date) values (78, 'Sexual Chronicles of a French Family (Chroniques sexuelles d''une famille d''aujourd''hui)', 'London', 9.64, '2006-05-21');
insert into movies (movie_id, title, location, average_review_score, release_date) values (79, 'Toronto Stories', null, 7.45, '2003-02-12');
insert into movies (movie_id, title, location, average_review_score, release_date) values (80, '1, 2, 3, Sun (Un, deuz, trois, soleil)', 'Toronto', 0.86, '2009-10-14');
insert into movies (movie_id, title, location, average_review_score, release_date) values (81, 'A Cry in the Wild', null, 3.57, '1992-07-07');
insert into movies (movie_id, title, location, average_review_score, release_date) values (82, 'Day of the Crows, The (Le jour des corneilles)', 'New York', 5.67, '2011-05-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (83, 'It''s My Party', 'New York', 3.27, '2012-11-20');
insert into movies (movie_id, title, location, average_review_score, release_date) values (84, 'Carnival in Flanders (La kermesse héroïque)', 'New York', 2.6, '2010-08-25');
insert into movies (movie_id, title, location, average_review_score, release_date) values (85, 'Electile Dysfunction', null, 5.28, '2014-02-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (86, 'Bourne Supremacy, The', 'Madrid', 4.71, '2021-07-02');
insert into movies (movie_id, title, location, average_review_score, release_date) values (87, 'The Amazing Catfish', 'Madrid', 9.82, '2014-10-24');
insert into movies (movie_id, title, location, average_review_score, release_date) values (88, 'Desperate Living', 'Toronto', 2.32, '2016-06-14');
insert into movies (movie_id, title, location, average_review_score, release_date) values (89, 'Blackball', 'Toronto', 6.19, '2014-08-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (90, 'Knife in the Water (Nóz w wodzie)', 'Tokyo', 0.44, null);
insert into movies (movie_id, title, location, average_review_score, release_date) values (91, 'Deranged', 'Toronto', 2.38, '2012-03-30');
insert into movies (movie_id, title, location, average_review_score, release_date) values (92, 'Over Your Dead Body', 'Tokyo', 7.5, '2021-10-28');
insert into movies (movie_id, title, location, average_review_score, release_date) values (93, 'Come Live with Me', 'Toronto', 8.13, '1993-03-06');
insert into movies (movie_id, title, location, average_review_score, release_date) values (94, 'Songs From the Second Floor (Sånger från andra våningen)', 'London', 6.25, '2022-04-05');
insert into movies (movie_id, title, location, average_review_score, release_date) values (95, 'Cold Mountain', 'Madrid', 6.43, '2006-05-21');
insert into movies (movie_id, title, location, average_review_score, release_date) values (96, 'Home for the Holidays', 'Toronto', 6.25, '2019-06-11');
insert into movies (movie_id, title, location, average_review_score, release_date) values (97, 'Closer', 'Paris', 8.92, '1994-10-15');
insert into movies (movie_id, title, location, average_review_score, release_date) values (98, 'Held Up', 'Los Angeles', 6.34, '1997-06-23');
insert into movies (movie_id, title, location, average_review_score, release_date) values (99, 'Payment Deferred', 'Paris', 8.74, '2014-10-13');
insert into movies (movie_id, title, location, average_review_score, release_date) values (100, 'Black Peter (Cerný Petr)', null, 8.31, '2001-03-05');
SET IDENTITY_INSERT movies OFF;