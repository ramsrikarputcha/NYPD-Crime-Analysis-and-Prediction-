# NYPD-Crime-Analysis-and-Prediction-

**An End-to-End BI Solution with Alteryx, Snowflake, ADF, and Tableau**

---

## 📌 Project Summary  
This project demonstrates the development of a **complete business intelligence pipeline** using real NYPD arrest data. From **data ingestion and cleaning** to **dimensional modeling and interactive dashboarding**, this project highlights critical skills for **Data Engineers, Analysts, and BI Developers**.

---

## 🧠 Key Goals  
- Clean and transform raw arrest data from NYC  
- Model data into a star schema in **Snowflake**  
- Load data using **Azure Data Factory** pipelines  
- Build rich, insight-driven dashboards in **Tableau**  

---

## 🛠️ Tech Stack  
| Layer                  | Tools Used                            |
|------------------------|----------------------------------------|
| Data Cleaning          | `Alteryx`                              |
| Cloud DWH              | `Snowflake`                            |
| Data Pipeline          | `Azure Data Factory (ADF)`             |
| Modeling               | `ER/Studio`, `SQL`                     |
| Visualization          | `Tableau`                              |
| Scripting              | `SQL`, `DDL`, `ETL Logic`              |

---

## 📁 Dataset Details  
- 📄 **Source**: NYPD Arrests Dataset  
- 📊 **Records**: 260,503 rows × 19 columns  
- 🎯 **Grain**: Each row = 1 arrest record  
- 🗃️ **Key Attributes**: Date, Crime Type, Location, Demographics  

---

## 🧱 Data Warehouse Design

### ⭐ Star Schema Tables

**Fact Table**
- `Arrest_Fact`: Central table capturing arrest transactions

**Dimension Tables**
- `DIM_Time`: Date, Day, Month, Year  
- `DIM_Crime`: Offense details, PD_CD, LAW_CAT_CD  
- `DIM_Location`: Borough, Precinct, Latitude/Longitude  
- `DIM_Preperator`: Age, Race, Gender  

---

## 🔄 ETL & Transformation Highlights

| Step                  | Description                                      |
|-----------------------|--------------------------------------------------|
| Null Handling         | Cleaned nulls in coordinates and category fields |
| Data Formatting       | Converted strings to appropriate types (dates, ints) |
| Jurisdiction Filtering| Removed out-of-scope entries                     |
| Aggregation Fields    | Created geo-reference column and age bins       |
| Imputation            | Replaced null lat/long with mean values         |

---

## 📊 Tableau Dashboards

### 1️⃣ Time-Based Analysis  
- Arrest trends by day, week, month, quarter, and year  
- 📈 Peak crime dates: March 14, August, September

### 2️⃣ Crime Patterns & Trends  
- Top 5 crimes: Assault, Petit Larceny, etc.  
- 🚨 Drug-related crimes have decreased; Larceny increased

### 3️⃣ Geographic Analysis  
- 🔍 Brooklyn & Manhattan are top crime hotspots  
- Precinct 14 has the highest arrest count

### 4️⃣ Demographic Breakdown  
- Highest arrests: Age 18–25, Male, Black & Hispanic individuals

### 5️⃣ Predictive & Preventive Insights  
- Heatmaps of future hotspots using historical density  
- Summer shows forecasted crime spikes

---

## 📈 Sample DDL: Fact Table

```sql
CREATE TABLE Arrest_Fact(
    ARREST_KEY VARCHAR(10) NOT NULL,
    PD_CD_SK INT NOT NULL,
    ARREST_PRECINCT_SK INT NOT NULL,
    DATE_SK CHAR(10) NOT NULL,
    PREP_ID_SK INT NOT NULL,
    PRIMARY KEY (ARREST_KEY, PD_CD_SK, ARREST_PRECINCT_SK, DATE_SK, PREP_ID_SK)
);
```

More tables: `DIM_Crime`, `DIM_Time`, `DIM_Location`, `DIM_Preperator`

---

## 🔍 Business Insights Answered

| Question                                                             | Answered via          |
|----------------------------------------------------------------------|-----------------------|
| How do arrests trend over time?                                      | Time Dashboard        |
| What crimes are rising or declining?                                 | Trends Dashboard      |
| Which precincts or boroughs are most affected?                       | Geographic Analysis   |
| What are the demographic profiles of arrestees?                      | Demographic Dashboard |
| Can we anticipate high-risk areas based on trends?                   | Predictive Insights   |

---

## 🚀 How to Run

```bash
# 1. Load CSV into Alteryx
#    - Apply data cleaning, filtering, imputation

# 2. Upload Cleaned Data to Snowflake (Bronze)

# 3. Create Star Schema using ER/Studio
#    - Run provided SQL DDL in Snowflake

# 4. Build ADF Pipelines
#    - Load dimension and fact tables to Snowflake (Silver/Gold)

# 5. Connect Tableau to Snowflake
#    - Design 5 dashboards using dimensions/fact relationships
```

## 💼 What I Learned

- ☁️ Cloud ETL design and implementation using **ADF + Snowflake**  
- 🧱 Dimensional modeling with normalized + denormalized tables  
- 📊 BI storytelling using **Tableau Dashboards**  
- 🧹 Advanced data cleaning with **Alteryx Designer**  
- 🧠 Writing efficient **SQL queries** for reporting  

---

## 📌 Ideal For

- Data Engineer or Analyst Interviews  
- Demonstrating ADF-Snowflake integration  
- Visualization and storytelling skills with large public datasets  

