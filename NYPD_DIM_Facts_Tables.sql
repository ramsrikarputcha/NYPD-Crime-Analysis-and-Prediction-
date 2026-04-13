/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Individual_Proj_NYPD.DM1
 *
 * Date Created : Thursday, February 13, 2025 20:06:58
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Arrest_Factt
 */

CREATE TABLE Arrest_Factt(
    ARREST_KEY                 varchar(10)    NOT NULL,
    PD_CD_SK                   int            NOT NULL,
    ARREST_PRECINCT_SK         int            NOT NULL,
    DATE_SK                    char(10)       NOT NULL,
    PREP_ID_SK                 int            NOT NULL,
    NEW_GEOREFERENCE_COLUMN    varchar(50)    NULL,
    DI_JOB_ID                  varchar(50)    NULL,
    DI_LOAD_DT                 date           NULL,
    CONSTRAINT PK_ARREST_KEY PRIMARY KEY  (ARREST_KEY, PD_CD_SK, ARREST_PRECINCT_SK, DATE_SK, PREP_ID_SK)
);


IF OBJECT_ID('Arrest_Factt') IS NOT NULL
    PRINT '<<< CREATED TABLE Arrest_Factt >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Arrest_Factt >>>'
;

/* 
 * TABLE: DIM_Crime 
 */

CREATE TABLE DIM_Crime(
    PD_CD_SK      int            NOT NULL,
    DI_LOAD_DT    date           NULL,
    DI_JOB_ID     varchar(50)    NULL,
    PD_DESC       varchar(60)    NULL,
    KY_CD         int            NULL,
    OFNS_DESC     varchar(40)    NULL,
    LAW_CODE      varchar(10)    NULL,
    LAW_CAT_CD    varchar(10)    NULL,
    CONSTRAINT PK2 PRIMARY KEY  (PD_CD_SK)
);


IF OBJECT_ID('DIM_Crime') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Crime >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Crime >>>'
;

/* 
 * TABLE: DIM_Location 
 */

CREATE TABLE DIM_Location(
    ARREST_PRECINCT_SK    int            NOT NULL,
    JURISDICTION_CODE     int            NULL,
    ARREST_BORO           varchar(10)    NULL,
    LATITUDE              float          NULL,
    X_COORD_CD            char(10)       NULL,
    LONGITUDE             float          NULL,
    Y_COORD_CD            char(10)       NULL,
    DI_JOB_ID             varchar(50)    NULL,
    DI_LOAD_DT            date           NULL,
    CONSTRAINT PK_ARREST_PRECINCT PRIMARY KEY  (ARREST_PRECINCT_SK)
);


IF OBJECT_ID('DIM_Location') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Location >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Location >>>'
;

/* 
 * TABLE: DIM_Preperator 
 */

CREATE TABLE DIM_Preperator(
    PREP_ID_SK    int            NOT NULL,
    AGE_GROUP     varchar(10)    NULL,
    PREP_SEX      varchar(10)    NULL,
    PREP_RACE     varchar(50)    NULL,
    DI_JOB_ID     varchar(50)    NULL,
    DI_LOAD_DT    date           NULL,
    CONSTRAINT PK4 PRIMARY KEY  (PREP_ID_SK)
);


IF OBJECT_ID('DIM_Preperator') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Preperator >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Preperator >>>'
;

/* 
 * TABLE: DIM_Time 
 */

CREATE TABLE DIM_Time(
    DATE_SK        char(10)       NOT NULL,
    ARREST_DATE    date           NULL,
    DAY            varchar(15)    NULL,
    MONTH          varchar(10)    NULL,
    YEAR           int            NULL,
    DI_JOB_ID      varchar(50)    NULL,
    DI_LOAD_DT     date           NULL,
    CONSTRAINT PK_DATE_ID PRIMARY KEY  (DATE_SK)
);


IF OBJECT_ID('DIM_Time') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_Time >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_Time >>>';

/* 
 * TABLE: Arrestt_Fact 
 */

ALTER TABLE Arrest_Factt ADD CONSTRAINT RefDIM_Crime1 
    FOREIGN KEY (PD_CD_SK)
    REFERENCES DIM_Crime(PD_CD_SK);

ALTER TABLE Arrest_Factt ADD CONSTRAINT RefDIM_Location2 
    FOREIGN KEY (ARREST_PRECINCT_SK)
    REFERENCES DIM_Location(ARREST_PRECINCT_SK);

ALTER TABLE Arrest_Factt ADD CONSTRAINT RefDIM_Time3 
    FOREIGN KEY (DATE_SK)
    REFERENCES DIM_Time(DATE_SK);

ALTER TABLE Arrest_Factt ADD CONSTRAINT RefDIM_Preperator4 
    FOREIGN KEY (PREP_ID_SK)
    REFERENCES DIM_Preperator(PREP_ID_SK);
