--Student Name: Liam Eaves
--Student ID: 102571922

DROP TABLE IF EXISTS dbo.tbl_Booking1922;
DROP TABLE IF EXISTS dbo.tbl_Event1922;
DROP TABLE IF EXISTS dbo.tbl_Tour1922;
DROP TABLE IF EXISTS dbo.tbl_Client1922;

CREATE TABLE tbl_Client1922 
(
    id_Client               INT PRIMARY KEY,
    str_Name_Family         NVARCHAR(20),
    str_Name_First          NVARCHAR(20),
    str_Gender              NVARCHAR(1)
);
CREATE TABLE tbl_Tour1922 
(
    str_Tour_Name           NVARCHAR(20) PRIMARY KEY,
    str_Tour_Description    NVARCHAR(100)
);
CREATE TABLE tbl_Event1922 
(
    str_Tour_Name           NVARCHAR(20),
    int_Event_Date_Day      INT,
    str_Event_Date_Month    NVARCHAR(3),
    int_Event_Date_Year     INT
    FOREIGN KEY (str_Tour_Name) REFERENCES tbl_Tour1922(str_Tour_Name),
    primary key (str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year)
);
CREATE TABLE tbl_Booking1922 
(
    id_Client               INT,
    str_Tour_Name           NVARCHAR(20),
    int_Event_Date_Day      INT,
    str_Event_Date_Month    NVARCHAR(3),
    int_Event_Date_Year     INT,
    int_Payment             INT,
    Dte_Booked              DATE,
    FOREIGN KEY (id_Client) REFERENCES tbl_Client1922(id_Client),
    FOREIGN KEY (str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year) 
    REFERENCES tbl_Event1922(str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year),
    primary key (id_Client, str_Tour_Name, int_Event_Date_Day, str_Event_Date_Month, int_Event_Date_Year)
);
