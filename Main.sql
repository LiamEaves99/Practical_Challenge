--Student Name: Liam Eaves
--Student ID: 102571922

DROP TABLE IF EXISTS dbo.tbl_Booking1922;
DROP TABLE IF EXISTS dbo.tbl_Event1922;
DROP TABLE IF EXISTS dbo.tbl_Tour1922;
DROP TABLE IF EXISTS dbo.tbl_Client1922;

CREATE TABLE tbl_Client1922 
(
    id_Client               INT PRIMARY KEY,
    str_Name_Family         NVARCHAR(100) NOT NULL,
    str_Name_First          NVARCHAR(100) NOT NULL,
    str_Gender              NVARCHAR(1),
    CHECK (str_Gender='M' OR str_Gender='F' OR str_Gender='I')
);
CREATE TABLE tbl_Tour1922 
(
    str_Tour_Name           NVARCHAR(100) PRIMARY KEY,
    str_Tour_Description    NVARCHAR(500)
);
CREATE TABLE tbl_Event1922 
(
    str_Tour_Name           NVARCHAR(100),
    int_Event_Date_Day      INT,
    CHECK (int_Event_Date_Day >= 1 AND int_Event_Date_Day <=31),
    str_Event_Date_Month    NVARCHAR(3),
    CHECK (str_Event_Date_Month='Jan' OR 
           str_Event_Date_Month='Feb' OR 
           str_Event_Date_Month='Mar' OR 
           str_Event_Date_Month='Apr' OR 
           str_Event_Date_Month='May' OR 
           str_Event_Date_Month='Jun' OR 
           str_Event_Date_Month='Jul' OR 
           str_Event_Date_Month='Aug' OR 
           str_Event_Date_Month='Sep' OR 
           str_Event_Date_Month='Oct' OR 
           str_Event_Date_Month='Nov' OR 
           str_Event_Date_Month='Dec'),
    int_Event_Date_Year     INT,
    CHECK (LEN(int_Event_Date_Year) = 4),
    mon_Event_Fee           MONEY NOT NULL
    FOREIGN KEY (str_Tour_Name) REFERENCES tbl_Tour1922(str_Tour_Name),
    primary key (str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year)
);
CREATE TABLE tbl_Booking1922 
(
    id_Client               INT,
    str_Tour_Name           NVARCHAR(100),
    int_Event_Date_Day      INT,
    str_Event_Date_Month    NVARCHAR(3),
    int_Event_Date_Year     INT,
    mon_Payment             MONEY,
    CHECK (mon_Payment > 0),
    Dte_Booked              DATE NOT NULL
    FOREIGN KEY (id_Client) REFERENCES tbl_Client1922(id_Client),
    FOREIGN KEY (str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year) 
    REFERENCES tbl_Event1922(str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year),
    primary key (id_Client, str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year)
);

INSERT INTO tbl_Client1922 (id_Client, str_Name_Family, str_Name_First, str_Gender) VALUES (102571922, 'Eaves', 'Liam', 'M');
INSERT INTO tbl_Client1922 (id_Client, str_Name_Family, str_Name_First, str_Gender) VALUES (123456789, 'Mann', 'Jim', 'M');
INSERT INTO tbl_Client1922 (id_Client, str_Name_Family, str_Name_First, str_Gender) VALUES (987654321, 'Mann', 'Abby', 'F');
INSERT INTO tbl_Client1922 (id_Client, str_Name_Family, str_Name_First, str_Gender) VALUES (123454321, 'Well', 'Max', 'M');
INSERT INTO tbl_Client1922 (id_Client, str_Name_Family, str_Name_First, str_Gender) VALUES (987656789, 'Well', 'Sarah', 'F');

INSERT INTO tbl_Tour1922 (str_Tour_Name, str_Tour_Description) VALUES ('Alpha', 'Tour of resturants around Melbourne');
INSERT INTO tbl_Tour1922 (str_Tour_Name, str_Tour_Description) VALUES ('Gamma', 'Tour of bakeries around Ballerat');
INSERT INTO tbl_Tour1922 (str_Tour_Name, str_Tour_Description) VALUES ('Zeta', 'Tour of markets around Gellong');
