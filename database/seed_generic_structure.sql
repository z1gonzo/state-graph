-- ==========================================================
-- Generic Government Structure Seeding Script
-- Author: state-graph project
-- Description: Creates a complete generic government hierarchy
-- ==========================================================

-- Clear existing example data
DELETE FROM relations WHERE type = 'hierarchical';
DELETE FROM nodes WHERE name LIKE 'Rada Miasta X' OR name LIKE 'Urząd Miasta X' OR name LIKE 'Starostwo Powiatowe Y';

-- ==========================================================
-- NATIONAL LEVEL (Central Government)
-- ==========================================================

-- Central Government Institutions
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Prezydent Rzeczypospolitej Polskiej', 'organ_centralny', 'Head of State'),
('institution', 'Rada Ministrów', 'organ_centralny', 'Council of Ministers - Government'),
('institution', 'Sejm Rzeczypospolitej Polskiej', 'organ_centralny', 'Lower house of Parliament'),
('institution', 'Senat Rzeczypospolitej Polskiej', 'organ_centralny', 'Upper house of Parliament'),
('institution', 'Trybunał Konstytucyjny', 'organ_centralny', 'Constitutional Tribunal'),
('institution', 'Najwyższa Izba Kontroli', 'organ_centralny', 'Supreme Audit Office'),
('institution', 'Trybunał Stanu', 'organ_centralny', 'State Tribunal'),
('institution', 'Trybunał Najwyższy', 'organ_centralny', 'Supreme Court'),
('institution', 'Sąd Najwyższej Kontroli', 'organ_centralny', 'Supreme Control Court'),
('institution', 'Prokuratoria Generalna', 'organ_centralny', 'Office of the Prosecutor General'),
('institution', 'Rzecznik Praw Obywatelskich', 'organ_centralny', 'Commissioner for Human Rights'),
('institution', 'Rzecznik Praw Dziecka', 'organ_centralny', 'Commissioner for Children''s Rights'),
('institution', 'Rzecznik Praw Pacjenta', 'organ_centralny', 'Commissioner for Patient Rights'),
('institution', 'Rzecznik Finansowy', 'organ_centralny', 'Financial Ombudsman'),
('institution', 'Rzecznik ds. Bezpieczeństwa Informacji', 'organ_centralny', 'Data Protection Commissioner'),
('institution', 'Narodowy Bank Polski', 'organ_centralny', 'National Bank of Poland'),
('institution', 'Komisja Nadzoru Finansowego', 'organ_centralny', 'Financial Supervision Authority'),
('institution', 'Urząd Ochrony Konkurencji i Konsumentów', 'organ_centralny', 'Office of Competition and Consumer Protection'),
('institution', 'Urząd Ochrony Danych Osobowych', 'organ_centralny', 'Personal Data Protection Office'),
('institution', 'Urząd Komisji Nadzoru Sektora Finansów Publicznych', 'organ_centralny', 'Public Finance Sector Supervision Authority'),
('institution', 'Krajowa Rada Radiofonii i Telewizji', 'organ_centralny', 'National Broadcasting Council'),
('institution', 'Komisja Wyznaniowa', 'organ_centralny', 'Religious Affairs Commission'),
('institution', 'Rada Dialogu Społecznego', 'organ_centralny', 'Social Dialogue Council'),
('institution', 'Rada Gospodarcza', 'organ_centralny', 'Economic Council'),
('institution', 'Rada Dialogu Społecznego', 'organ_centralny', 'Social Dialogue Council');

-- Ministries
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Ministerstwo Spraw Wewnętrznych i Administracji', 'ministerstwo', 'Ministry of Interior and Administration'),
('institution', 'Ministerstwo Obrony Narodowej', 'ministerstwo', 'Ministry of National Defence'),
('institution', 'Ministerstwo Sprawiedliwości', 'ministerstwo', 'Ministry of Justice'),
('institution', 'Ministerstwo Spraw Zagranicznych', 'ministerstwo', 'Ministry of Foreign Affairs'),
('institution', 'Ministerstwo Finansów', 'ministerstwo', 'Ministry of Finance'),
('institution', 'Ministerstwo Rozwoju i Technologii', 'ministerstwo', 'Ministry of Development and Technology'),
('institution', 'Ministerstwo Kultury i Dziedzictwa Narodowego', 'ministerstwo', 'Ministry of Culture and National Heritage'),
('institution', 'Ministerstwo Edukacji i Nauki', 'ministerstwo', 'Ministry of Education and Science'),
('institution', 'Ministerstwo Zdrowia', 'ministerstwo', 'Ministry of Health'),
('institution', 'Ministerstwo Rodziny, Pracy i Polityki Społecznej', 'ministerstwo', 'Ministry of Family, Labour and Social Policy'),
('institution', 'Ministerstwo Rolnictwa i Rozwoju Wsi', 'ministerstwo', 'Ministry of Agriculture and Rural Development'),
('institution', 'Ministerstwo Środowiska', 'ministerstwo', 'Ministry of Environment'),
('institution', 'Ministerstwo Infrastruktury', 'ministerstwo', 'Ministry of Infrastructure'),
('institution', 'Ministerstwo Sportu i Turystyki', 'ministerstwo', 'Ministry of Sport and Tourism'),
('institution', 'Ministerstwo Cyfryzacji', 'ministerstwo', 'Ministry of Digital Affairs'),
('institution', 'Ministerstwo Klimatu i Środowiska', 'ministerstwo', 'Ministry of Climate and Environment'),
('institution', 'Ministerstwo Funduszy i Polityki Regionalnej', 'ministerstwo', 'Ministry of Funds and Regional Policy');

-- ==========================================================
-- VOIVODESHIP LEVEL (Województwo)
-- ==========================================================

-- Voivodeship Institutions
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Wojewoda', 'wojewodztwo', 'Voivode - central government representative'),
('institution', 'Urząd Wojewódzki', 'wojewodztwo', 'Voivodeship Office'),
('institution', 'Sejmik Województwa', 'wojewodztwo', 'Voivodeship Assembly'),
('institution', 'Zarząd Województwa', 'wojewodztwo', 'Voivodeship Board'),
('institution', 'Wojewódzki Sąd Administracyjny', 'wojewodztwo', 'Voivodeship Administrative Court'),
('institution', 'Wojewódzki Inspektorat Weterynarii', 'wojewodztwo', 'Voivodeship Veterinary Inspectorate'),
('institution', 'Wojewódzki Inspektorat Ochrony Środowiska', 'wojewodztwo', 'Voivodeship Environmental Protection Inspectorate'),
('institution', 'Wojewódzki Inspektorat Farmaceutyczny', 'wojewodztwo', 'Voivodeship Pharmaceutical Inspectorate'),
('institution', 'Wojewódzki Inspektorat Pracy', 'wojewodztwo', 'Voivodeship Labour Inspectorate'),
('institution', 'Wojewódzki Inspektorat Nadzoru Budowlanego', 'wojewodztwo', 'Voivodeship Building Supervision Inspectorate'),
('institution', 'Wojewódzki Urząd Ochrony Zabytków', 'wojewodztwo', 'Voivodeship Heritage Conservation Office'),
('institution', 'Wojewódzki Urząd Mieszkaniowy', 'wojewodztwo', 'Voivodeship Housing Office'),
('institution', 'Wojewódzki Urząd Skarbowy', 'wojewodztwo', 'Voivodeship Tax Office'),
('institution', 'Wojewódzki Urząd Transportu Kolejowego', 'wojewodztwo', 'Voivodeship Railway Transport Office'),
('institution', 'Wojewódzki Urząd Transportu Drogowego', 'wojewodztwo', 'Voivodeship Road Transport Office'),
('institution', 'Wojewódzki Urząd Geodezji i Kartografii', 'wojewodztwo', 'Voivodeship Geodesy and Cartography Office'),
('institution', 'Wojewódzki Urząd Miar', 'wojewodztwo', 'Voivodeship Measures Office'),
('institution', 'Wojewódzki Urząd Patentowy', 'wojewodztwo', 'Voivodeship Patent Office'),
('institution', 'Wojewódzki Urząd ds. Gospodarki Komunalnej', 'wojewodztwo', 'Voivodeship Communal Economy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Rolnej', 'wojewodztwo', 'Voivodeship Agricultural Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Społecznej', 'wojewodztwo', 'Voivodeship Social Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Zdrowotnej', 'wojewodztwo', 'Voivodeship Health Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Kultury', 'wojewodztwo', 'Voivodeship Culture Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Oświatowej', 'wojewodztwo', 'Voivodeship Education Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Sportowej', 'wojewodztwo', 'Voivodeship Sports Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Turystycznej', 'wojewodztwo', 'Voivodeship Tourism Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Inwestycyjnej', 'wojewodztwo', 'Voivodeship Investment Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Innowacyjnej', 'wojewodztwo', 'Voivodeship Innovation Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Cyfrowej', 'wojewodztwo', 'Voivodeship Digital Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Klimatycznej', 'wojewodztwo', 'Voivodeship Climate Policy Office'),
('institution', 'Wojewódzki Urząd ds. Polityki Funduszy Europejskich', 'wojewodztwo', 'Voivodeship European Funds Policy Office');

-- ==========================================================
-- COUNTY LEVEL (Powiat)
-- ==========================================================

-- County Institutions
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Starosta', 'powiat', 'County Governor'),
('institution', 'Starostwo Powiatowe', 'powiat', 'County Office'),
('institution', 'Rada Powiatu', 'powiat', 'County Council'),
('institution', 'Zarząd Powiatu', 'powiat', 'County Board'),
('institution', 'Powiatowy Sąd Rejonowy', 'powiat', 'County District Court'),
('institution', 'Powiatowy Sąd Pracy i Ubezpieczeń Społecznych', 'powiat', 'County Labour and Social Insurance Court'),
('institution', 'Powiatowy Sąd Gospodarczy', 'powiat', 'County Commercial Court'),
('institution', 'Powiatowy Sąd Rodzinny i Nieletnich', 'powiat', 'County Family and Juvenile Court'),
('institution', 'Powiatowy Sąd Administracyjny', 'powiat', 'County Administrative Court'),
('institution', 'Powiatowy Inspektorat Weterynarii', 'powiat', 'County Veterinary Inspectorate'),
('institution', 'Powiatowy Inspektorat Ochrony Środowiska', 'powiat', 'County Environmental Protection Inspectorate'),
('institution', 'Powiatowy Inspektorat Farmaceutyczny', 'powiat', 'County Pharmaceutical Inspectorate'),
('institution', 'Powiatowy Inspektorat Pracy', 'powiat', 'County Labour Inspectorate'),
('institution', 'Powiatowy Inspektorat Nadzoru Budowlanego', 'powiat', 'County Building Supervision Inspectorate'),
('institution', 'Powiatowy Urząd Ochrony Zabytków', 'powiat', 'County Heritage Conservation Office'),
('institution', 'Powiatowy Urząd Mieszkaniowy', 'powiat', 'County Housing Office'),
('institution', 'Powiatowy Urząd Skarbowy', 'powiat', 'County Tax Office'),
('institution', 'Powiatowy Urząd Transportu Kolejowego', 'powiat', 'County Railway Transport Office'),
('institution', 'Powiatowy Urząd Transportu Drogowego', 'powiat', 'County Road Transport Office'),
('institution', 'Powiatowy Urząd Geodezji i Kartografii', 'powiat', 'County Geodesy and Cartography Office'),
('institution', 'Powiatowy Urząd Miar', 'powiat', 'County Measures Office'),
('institution', 'Powiatowy Urząd Patentowy', 'powiat', 'County Patent Office'),
('institution', 'Powiatowy Urząd ds. Gospodarki Komunalnej', 'powiat', 'County Communal Economy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Rolnej', 'powiat', 'County Agricultural Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Społecznej', 'powiat', 'County Social Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Zdrowotnej', 'powiat', 'County Health Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Kultury', 'powiat', 'County Culture Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Oświatowej', 'powiat', 'County Education Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Sportowej', 'powiat', 'County Sports Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Turystycznej', 'powiat', 'County Tourism Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Inwestycyjnej', 'powiat', 'County Investment Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Innowacyjnej', 'powiat', 'County Innovation Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Cyfrowej', 'powiat', 'County Digital Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Klimatycznej', 'powiat', 'County Climate Policy Office'),
('institution', 'Powiatowy Urząd ds. Polityki Funduszy Europejskich', 'powiat', 'County European Funds Policy Office');

-- ==========================================================
-- MUNICIPAL LEVEL (Gmina)
-- ==========================================================

-- Municipal Institutions
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Wójt', 'gmina', 'Mayor of Rural Commune'),
('institution', 'Burmistrz', 'gmina', 'Mayor of Urban Commune'),
('institution', 'Prezydent Miasta', 'gmina', 'City President'),
('institution', 'Urząd Gminy', 'gmina', 'Commune Office'),
('institution', 'Rada Gminy', 'gmina', 'Commune Council'),
('institution', 'Zarząd Gminy', 'gmina', 'Commune Board'),
('institution', 'Gminny Sąd Rejonowy', 'gmina', 'Commune District Court'),
('institution', 'Gminny Sąd Pracy i Ubezpieczeń Społecznych', 'gmina', 'Commune Labour and Social Insurance Court'),
('institution', 'Gminny Sąd Gospodarczy', 'gmina', 'Commune Commercial Court'),
('institution', 'Gminny Sąd Rodzinny i Nieletnich', 'gmina', 'Commune Family and Juvenile Court'),
('institution', 'Gminny Sąd Administracyjny', 'gmina', 'Commune Administrative Court'),
('institution', 'Gminny Inspektorat Weterynarii', 'gmina', 'Commune Veterinary Inspectorate'),
('institution', 'Gminny Inspektorat Ochrony Środowiska', 'gmina', 'Commune Environmental Protection Inspectorate'),
('institution', 'Gminny Inspektorat Farmaceutyczny', 'gmina', 'Commune Pharmaceutical Inspectorate'),
('institution', 'Gminny Inspektorat Pracy', 'gmina', 'Commune Labour Inspectorate'),
('institution', 'Gminny Inspektorat Nadzoru Budowlanego', 'gmina', 'Commune Building Supervision Inspectorate'),
('institution', 'Gminny Urząd Ochrony Zabytków', 'gmina', 'Commune Heritage Conservation Office'),
('institution', 'Gminny Urząd Mieszkaniowy', 'gmina', 'Commune Housing Office'),
('institution', 'Gminny Urząd Skarbowy', 'gmina', 'Commune Tax Office'),
('institution', 'Gminny Urząd Transportu Kolejowego', 'gmina', 'Commune Railway Transport Office'),
('institution', 'Gminny Urząd Transportu Drogowego', 'gmina', 'Commune Road Transport Office'),
('institution', 'Gminny Urząd Geodezji i Kartografii', 'gmina', 'Commune Geodesy and Cartography Office'),
('institution', 'Gminny Urząd Miar', 'gmina', 'Commune Measures Office'),
('institution', 'Gminny Urząd Patentowy', 'gmina', 'Commune Patent Office'),
('institution', 'Gminny Urząd ds. Gospodarki Komunalnej', 'gmina', 'Commune Communal Economy Office'),
('institution', 'Gminny Urząd ds. Polityki Rolnej', 'gmina', 'Commune Agricultural Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Społecznej', 'gmina', 'Commune Social Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Zdrowotnej', 'gmina', 'Commune Health Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Kultury', 'gmina', 'Commune Culture Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Oświatowej', 'gmina', 'Commune Education Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Sportowej', 'gmina', 'Commune Sports Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Turystycznej', 'gmina', 'Commune Tourism Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Inwestycyjnej', 'gmina', 'Commune Investment Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Innowacyjnej', 'gmina', 'Commune Innovation Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Cyfrowej', 'gmina', 'Commune Digital Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Klimatycznej', 'gmina', 'Commune Climate Policy Office'),
('institution', 'Gminny Urząd ds. Polityki Funduszy Europejskich', 'gmina', 'Commune European Funds Policy Office');

-- ==========================================================
-- CITY COUNCIL LEVEL (Rada Miasta)
-- ==========================================================

-- City Council Institutions
INSERT INTO nodes (type, name, institution_level, description)
VALUES
('institution', 'Rada Miasta', 'rada_miasta', 'City Council'),
('institution', 'Prezydium Rady Miasta', 'rada_miasta', 'City Council Presidium'),
('institution', 'Komisja Rady Miasta', 'rada_miasta', 'City Council Committee'),
('institution', 'Sekretariat Rady Miasta', 'rada_miasta', 'City Council Secretariat'),
('institution', 'Biuro Radnych', 'rada_miasta', 'Councilors'' Office'),
('institution', 'Kancelaria Rady Miasta', 'rada_miasta', 'City Council Chancellery'),
('institution', 'Referendum Miejskie', 'rada_miasta', 'Local Referendum'),
('institution', 'Inicjatywa Obywatelska', 'rada_miasta', 'Citizens'' Initiative'),
('institution', 'Konsultacje Publiczne', 'rada_miasta', 'Public Consultations'),
('institution', 'Obrady Rady Miasta', 'rada_miasta', 'City Council Meetings'),
('institution', 'Projekty Uchwał Rady Miasta', 'rada_miasta', 'City Council Resolution Projects'),
('institution', 'Uchwały Rady Miasta', 'rada_miasta', 'City Council Resolutions'),
('institution', 'Petycje do Rady Miasta', 'rada_miasta', 'Petitions to City Council'),
('institution', 'Skargi do Rady Miasta', 'rada_miasta', 'Complaints to City Council'),
('institution', 'Zapytania Radnych', 'rada_miasta', 'Councilors'' Inquiries'),
('institution', 'Wystąpienia Radnych', 'rada_miasta', 'Councilors'' Statements'),
('institution', 'Głosowania w Radzie Miasta', 'rada_miasta', 'City Council Votes'),
('institution', 'Protokoły Posiedzeń Rady Miasta', 'rada_miasta', 'City Council Meeting Protocols'),
('institution', 'Sprawozdania z Działalności Rady Miasta', 'rada_miasta', 'City Council Activity Reports'),
('institution', 'Plan Działalności Rady Miasta', 'rada_miasta', 'City Council Activity Plan'),
('institution', 'Regulamin Rady Miasta', 'rada_miasta', 'City Council Regulations'),
('institution', 'Statut Miasta', 'rada_miasta', 'City Charter'),
('institution', 'Budżet Miasta', 'rada_miasta', 'City Budget'),
('institution', 'Plan Zagospodarowania Przestrzennego', 'rada_miasta', 'Spatial Development Plan'),
('institution', 'Miejscowy Plan Zagospodarowania Przestrzennego', 'rada_miasta', 'Local Spatial Development Plan'),
('institution', 'Studium Uwarunkowań i Kierunków Zagospodarowania Przestrzennego', 'rada_miasta', 'Study of Conditions and Directions of Spatial Development'),
('institution', 'Wytyczne Programowe', 'rada_miasta', 'Program Guidelines'),
('institution', 'Założenia Programowe', 'rada_miasta', 'Program Assumptions'),
('institution', 'Koncepcja Rozwoju Miasta', 'rada_miasta', 'City Development Concept'),
('institution', 'Strategia Rozwoju Miasta', 'rada_miasta', 'City Development Strategy'),
('institution', 'Program Rewitalizacji', 'rada_miasta', 'Revitalization Program'),
('institution', 'Program Ograniczania Niskiej Emisji', 'rada_miasta', 'Low Emission Reduction Program'),
('institution', 'Program Ochrony Środowiska', 'rada_miasta', 'Environmental Protection Program'),
('institution', 'Program Zrównoważonego Rozwoju', 'rada_miasta', 'Sustainable Development Program'),
('institution', 'Program Cyfryzacji', 'rada_miasta', 'Digitalization Program'),
('institution', 'Program Innowacji Społecznych', 'rada_miasta', 'Social Innovation Program'),
('institution', 'Program Integracji Społecznej', 'rada_miasta', 'Social Integration Program'),
('institution', 'Program Profilaktyki Społecznej', 'rada_miasta', 'Social Prevention Program'),
('institution', 'Program Edukacji Obywatelskiej', 'rada_miasta', 'Civic Education Program'),
('institution', 'Program Wychowania Przedszkolnego', 'rada_miasta', 'Preschool Education Program'),
('institution', 'Program Wychowania Szkolnego', 'rada_miasta', 'School Education Program'),
('institution', 'Program Wychowania Pozaszkolnego', 'rada_miasta', 'Extracurricular Education Program'),
('institution', 'Program Wychowania Ustawicznego', 'rada_miasta', 'Lifelong Education Program'),
('institution', 'Program Kultury', 'rada_miasta', 'Culture Program'),
('institution', 'Program Sportu', 'rada_miasta', 'Sports Program'),
('institution', 'Program Turystyki', 'rada_miasta', 'Tourism Program'),
('institution', 'Program Zdrowia', 'rada_miasta', 'Health Program'),
('institution', 'Program Opieki Zdrowotnej', 'rada_miasta', 'Healthcare Program'),
('institution', 'Program Opieki Społecznej', 'rada_miasta', 'Social Care Program'),
('institution', 'Program Rodziny', 'rada_miasta', 'Family Program'),
('institution', 'Program Młodzieży', 'rada_miasta', 'Youth Program'),
('institution', 'Program Seniora', 'rada_miasta', 'Senior Program'),
('institution', 'Program Osób Niepełnosprawnych', 'rada_miasta', 'Disabled Persons Program'),
('institution', 'Program Osób Bezdomnych', 'rada_miasta', 'Homeless Persons Program'),
('institution', 'Program Osób W Uzależnieniu', 'rada_miasta', 'Addiction Program'),
('institution', 'Program Osób W Konflikcie z Prawem', 'rada_miasta', 'Persons in Conflict with Law Program'),
('institution', 'Program Osób Podejrzewanych o Przestępstwa', 'rada_miasta', 'Persons Suspected of Crimes Program'),
('institution', 'Program Osób Skazanych', 'rada_miasta', 'Convicted Persons Program'),
('institution', 'Program Osób Skazanych na Karę Śmierci', 'rada_miasta', 'Death Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wieczystego Więzienia', 'rada_miasta', 'Life Imprisonment Program'),
('institution', 'Program Osób Skazanych na Karę Pozbawienia Wolności', 'rada_miasta', 'Imprisonment Program'),
('institution', 'Program Osób Skazanych na Karę Ograniczenia Wolności', 'rada_miasta', 'Restricted Freedom Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Majątek', 'rada_miasta', 'Property Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Prawa', 'rada_miasta', 'Rights Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Ciało', 'rada_miasta', 'Corporal Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Ciało i Majątek', 'rada_miasta', 'Corporal and Property Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek i Prawa', 'rada_miasta', 'Corporal, Property and Rights Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek, Prawa i Wolność', 'rada_miasta', 'Corporal, Property, Rights and Freedom Penalty Program'),
('institution', 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek, Prawa, Wolność i Życie', 'rada_miasta', 'Corporal, Property, Rights, Freedom and Life Penalty Program');

-- ==========================================================
-- HIERARCHICAL RELATIONS
-- ==========================================================

-- National Level Relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Ministrów' AND n2.name = 'Prezydent Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Wewnętrznych i Administracji' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Obrony Narodowej' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sprawiedliwości' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Zagranicznych' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Finansów' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rozwoju i Technologii' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Kultury i Dziedzictwa Narodowego' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Edukacji i Nauki' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Zdrowia' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rodziny, Pracy i Polityki Społecznej' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rolnictwa i Rozwoju Wsi' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Środowiska' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Infrastruktury' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sportu i Turystyki' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Cyfryzacji' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Klimatu i Środowiska' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Funduszy i Polityki Regionalnej' AND n2.name = 'Rada Ministrów';

-- Voivodeship Level Relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewoda' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Wojewódzki' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejmik Województwa' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Zarząd Województwa' AND n2.name = 'Sejmik Województwa';

-- County Level Relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Starosta' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Starostwo Powiatowe' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Powiatu' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Zarząd Powiatu' AND n2.name = 'Rada Powiatu';

-- Municipal Level Relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wójt' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Burmistrz' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Miasta' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Gminy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Gminy' AND n2.name = 'Burmistrz';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Gminy' AND n2.name = 'Prezydent Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Gminy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Gminy' AND n2.name = 'Burmistrz';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Gminy' AND n2.name = 'Prezydent Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Zarząd Gminy' AND n2.name = 'Rada Gminy';

-- City Council Level Relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydium Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sekretariat Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Biuro Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Kancelaria Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Referendum Miejskie' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Inicjatywa Obywatelska' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Konsultacje Publiczne' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Obrady Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Projekty Uchwał Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Uchwały Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Petycje do Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Skargi do Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Zapytania Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wystąpienia Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Głosowania w Radzie Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Protokoły Posiedzeń Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sprawozdania z Działalności Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Plan Działalności Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Regulamin Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Statut Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Budżet Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Plan Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Miejscowy Plan Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Studium Uwarunkowań i Kierunków Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wytyczne Programowe' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Założenia Programowe' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Koncepcja Rozwoju Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Strategia Rozwoju Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Rewitalizacji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Ograniczania Niskiej Emisji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Ochrony Środowiska' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Zrównoważonego Rozwoju' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Cyfryzacji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Innowacji Społecznych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Integracji Społecznej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Profilaktyki Społecznej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Edukacji Obywatelskiej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Przedszkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Szkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Pozaszkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Ustawicznego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Kultury' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Sportu' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Turystyki' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Zdrowia' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Opieki Zdrowotnej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Opieki Społecznej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Rodziny' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Młodzieży' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Seniora' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Niepełnosprawnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Bezdomnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób W Uzależnieniu' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób W Konflikcie z Prawem' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Podejrzewanych o Przestępstwa' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Śmierci' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wieczystego Więzienia' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Pozbawienia Wolności' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Ograniczenia Wolności' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Majątek' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Prawa' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Ciało' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Ciało i Majątek' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek i Prawa' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek, Prawa i Wolność' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Osób Skazanych na Karę Wymierzoną w Ciało, Majątek, Prawa, Wolność i Życie' AND n2.name = 'Rada Miasta';

-- ==========================================================
-- SUPERVISORY RELATIONS
-- ==========================================================

-- Supervisory relations for central government oversight
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Najwyższa Izba Kontroli' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Konstytucyjny' AND n2.name = 'Sejm Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Konstytucyjny' AND n2.name = 'Senat Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Stanu' AND n2.name = 'Sejm Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Stanu' AND n2.name = 'Senat Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prokuratoria Generalna' AND n2.name = 'Trybunał Najwyższy';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Obywatelskich' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Dziecka' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Pacjenta' AND n2.name = 'Ministerstwo Zdrowia';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Finansowy' AND n2.name = 'Komisja Nadzoru Finansowego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik ds. Bezpieczeństwa Informacji' AND n2.name = 'Urząd Ochrony Danych Osobowych';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Narodowy Bank Polski' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Nadzoru Finansowego' AND n2.name = 'Narodowy Bank Polski';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Ochrony Konkurencji i Konsumentów' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Ochrony Danych Osobowych' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Komisji Nadzoru Sektora Finansów Publicznych' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Krajowa Rada Radiofonii i Telewizji' AND n2.name = 'Sejm Rzeczypospolitej Polskiej';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Wyznaniowa' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Dialogu Społecznego' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'supervisory', 'Supervision by central government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Gospodarcza' AND n2.name = 'Rada Ministrów';

-- ==========================================================
-- INDEPENDENT RELATIONS
-- ==========================================================

-- Independent institutions
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Konstytucyjny' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Najwyższy' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Najwyższa Izba Kontroli' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Trybunał Stanu' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prokuratoria Generalna' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Obywatelskich' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Dziecka' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Praw Pacjenta' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik Finansowy' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rzecznik ds. Bezpieczeństwa Informacji' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Narodowy Bank Polski' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Nadzoru Finansowego' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Ochrony Konkurencji i Konsumentów' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Ochrony Danych Osobowych' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Urząd Komisji Nadzoru Sektora Finansów Publicznych' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Krajowa Rada Radiofonii i Telewizji' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Wyznaniowa' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Dialogu Społecznego' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'independent', 'Formal independence from government'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Gospodarcza' AND n2.name = 'Rada Ministrów';

-- ==========================================================
-- APPOINTMENT RELATIONS
-- ==========================================================

-- Appointments for central government positions
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rada Ministrów';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Konstytucyjny';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Najwyższy';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Najwyższa Izba Kontroli';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Stanu';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Prokuratoria Generalna';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Narodowy Bank Polski';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Obywatelskich';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Dziecka';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Pacjenta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Finansowy';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik ds. Bezpieczeństwa Informacji';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Krajowa Rada Radiofonii i Telewizji';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by President'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydent Rzeczypospolitej Polskiej' AND n2.name = 'Komisja Wyznaniowa';

-- Appointments by Sejm
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Obywatelskich';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Dziecka';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Praw Pacjenta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik Finansowy';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Rzecznik ds. Bezpieczeństwa Informacji';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Sejm'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sejm Rzeczypospolitej Polskiej' AND n2.name = 'Krajowa Rada Radiofonii i Telewizji';

-- Appointments by Senat
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Konstytucyjny';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Najwyższy';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Najwyższa Izba Kontroli';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Trybunał Stanu';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Prokuratoria Generalna';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'appointment', 'Appointment by Senat'
FROM nodes n1, nodes n2
WHERE n1.name = 'Senat Rzeczypospolitej Polskiej' AND n2.name = 'Narodowy Bank Polski';

-- ==========================================================
-- MEMBERSHIP RELATIONS
-- ==========================================================

-- Membership in councils and committees
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Ministrów' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Ministrów' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Wewnętrznych i Administracji' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Wewnętrznych i Administracji' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Obrony Narodowej' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Obrony Narodowej' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sprawiedliwości' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sprawiedliwości' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Zagranicznych' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Spraw Zagranicznych' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Finansów' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Finansów' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rozwoju i Technologii' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rozwoju i Technologii' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Kultury i Dziedzictwa Narodowego' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Kultury i Dziedzictwa Narodowego' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Edukacji i Nauki' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Edukacji i Nauki' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Zdrowia' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Zdrowia' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rodziny, Pracy i Polityki Społecznej' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rodziny, Pracy i Polityki Społecznej' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rolnictwa i Rozwoju Wsi' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Rolnictwa i Rozwoju Wsi' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Środowiska' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Środowiska' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Infrastruktury' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Infrastruktury' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sportu i Turystyki' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Sportu i Turystyki' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Cyfryzacji' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Cyfryzacji' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Klimatu i Środowiska' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Klimatu i Środowiska' AND n2.name = 'Rada Gospodarcza';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Funduszy i Polityki Regionalnej' AND n2.name = 'Rada Dialogu Społecznego';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'membership', 'Membership in council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Ministerstwo Funduszy i Polityki Regionalnej' AND n2.name = 'Rada Gospodarcza';

-- ==========================================================
-- VOIVODESHIP LEVEL RELATIONS
-- ==========================================================

-- Voivodeship level hierarchical relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Sąd Administracyjny' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Inspektorat Weterynarii' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Inspektorat Ochrony Środowiska' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Inspektorat Farmaceutyczny' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Inspektorat Pracy' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Inspektorat Nadzoru Budowlanego' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Ochrony Zabytków' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Mieszkaniowy' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Skarbowy' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Transportu Kolejowego' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Transportu Drogowego' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Geodezji i Kartografii' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Miar' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd Patentowy' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Gospodarki Komunalnej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Rolnej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Społecznej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Zdrowotnej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Kultury' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Oświatowej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Sportowej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Turystycznej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Inwestycyjnej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Innowacyjnej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Cyfrowej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Klimatycznej' AND n2.name = 'Wojewoda';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to voivodeship'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wojewódzki Urząd ds. Polityki Funduszy Europejskich' AND n2.name = 'Wojewoda';

-- ==========================================================
-- COUNTY LEVEL RELATIONS
-- ==========================================================

-- County level hierarchical relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Sąd Rejonowy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Sąd Pracy i Ubezpieczeń Społecznych' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Sąd Gospodarczy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Sąd Rodzinny i Nieletnich' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Sąd Administracyjny' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Inspektorat Weterynarii' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Inspektorat Ochrony Środowiska' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Inspektorat Farmaceutyczny' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Inspektorat Pracy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Inspektorat Nadzoru Budowlanego' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Ochrony Zabytków' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Mieszkaniowy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Skarbowy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Transportu Kolejowego' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Transportu Drogowego' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Geodezji i Kartografii' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Miar' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd Patentowy' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Gospodarki Komunalnej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Rolnej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Społecznej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Zdrowotnej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Kultury' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Oświatowej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Sportowej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Turystycznej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Inwestycyjnej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Innowacyjnej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Cyfrowej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Klimatycznej' AND n2.name = 'Starosta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to county'
FROM nodes n1, nodes n2
WHERE n1.name = 'Powiatowy Urząd ds. Polityki Funduszy Europejskich' AND n2.name = 'Starosta';

-- ==========================================================
-- MUNICIPAL LEVEL RELATIONS
-- ==========================================================

-- Municipal level hierarchical relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Sąd Rejonowy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Sąd Pracy i Ubezpieczeń Społecznych' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Sąd Gospodarczy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Sąd Rodzinny i Nieletnich' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Sąd Administracyjny' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Inspektorat Weterynarii' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Inspektorat Ochrony Środowiska' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Inspektorat Farmaceutyczny' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Inspektorat Pracy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Inspektorat Nadzoru Budowlanego' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Ochrony Zabytków' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Mieszkaniowy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Skarbowy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Transportu Kolejowego' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Transportu Drogowego' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Geodezji i Kartografii' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Miar' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd Patentowy' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Gospodarki Komunalnej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Rolnej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Społecznej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Zdrowotnej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Kultury' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Oświatowej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Sportowej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Turystycznej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Inwestycyjnej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Innowacyjnej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Cyfrowej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Klimatycznej' AND n2.name = 'Wójt';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to municipality'
FROM nodes n1, nodes n2
WHERE n1.name = 'Gminny Urząd ds. Polityki Funduszy Europejskich' AND n2.name = 'Wójt';

-- ==========================================================
-- CITY COUNCIL LEVEL RELATIONS
-- ==========================================================

-- City Council level hierarchical relations
INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Prezydium Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Komisja Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sekretariat Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Biuro Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Kancelaria Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Referendum Miejskie' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Inicjatywa Obywatelska' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Konsultacje Publiczne' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Obrady Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Projekty Uchwał Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Uchwały Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Petycje do Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Skargi do Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Zapytania Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wystąpienia Radnych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Głosowania w Radzie Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Protokoły Posiedzeń Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Sprawozdania z Działalności Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Plan Działalności Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Regulamin Rady Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Statut Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Budżet Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Plan Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Miejscowy Plan Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Studium Uwarunkowań i Kierunków Zagospodarowania Przestrzennego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Wytyczne Programowe' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Założenia Programowe' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Koncepcja Rozwoju Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Strategia Rozwoju Miasta' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Rewitalizacji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Ograniczania Niskiej Emisji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Ochrony Środowiska' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Zrównoważonego Rozwoju' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Cyfryzacji' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Innowacji Społecznych' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Integracji Społecznej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Profilaktyki Społecznej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Edukacji Obywatelskiej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Przedszkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Szkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Pozaszkolnego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Wychowania Ustawicznego' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Kultury' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Sportu' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Turystyki' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Zdrowia' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Opieki Zdrowotnej' AND n2.name = 'Rada Miasta';

INSERT INTO relations (from_node, to_node, type, description)
SELECT 
    n1.id, n2.id, 'hierarchical', 'Subordination to city council'
FROM nodes n1, nodes n2
WHERE n1.name = 'Program Opieki Społecznej' AND n2.name = '
