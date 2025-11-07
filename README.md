# ☁️ Modern-Data-Warehousing-and-Analytics-with-dbt-and-BigQuery

## 🚀 Project Overview
This project is an advanced extension of my previous **SQL Data Warehouse project**, rebuilt using **Google BigQuery** as the cloud data platform and **dbt (Data Build Tool)** for modular transformations.  

The goal was to design a **modern cloud-based ELT pipeline** following the **Medallion Architecture (Bronze → Silver → Gold)** and to deliver **business-ready dashboards in Power BI** for data-driven insights.  

This project demonstrates end-to-end capabilities across:
- **Cloud data warehousing (BigQuery)**
- **Data transformation & modeling (dbt)**
- **Business Intelligence & visualization (Power BI)**
- **Version control and analytics documentation (Git + dbt Docs)**

---

## 🎯 Key Objectives
- Build a **cloud-native data warehouse** on BigQuery.  
- Apply **Medallion Architecture** principles using **dbt models**.  
- Automate **data transformations and lineage tracking**.  
- Create **analytical views** for reporting and business insights.  
- Develop **interactive Power BI dashboards** connected to BigQuery.  
- Deliver a **fully modular, maintainable, and production-ready** project.

---

## 🧱 Data Architecture

### 🔶 Medallion Architecture (Bronze → Silver → Gold)
| Layer | Description | Object Type | Transformation Tool | Purpose |
|:------|:-------------|:-------------|:--------------------|:----------|
| **Bronze** | Raw data imported from ERP & CRM sources stored in BigQuery datasets. | External Tables / Staging | BigQuery SQL | Store source data as-is for traceability |
| **Silver** | Cleaned, standardized, and integrated data models. | dbt Models | dbt | Data cleansing, normalization, standardization |
| **Gold** | Business-ready aggregated models for reporting and analytics. | dbt Models / Views | dbt | Business logic, KPIs, dimensional modeling |

**Architecture Stack Overview:**

ERP / CRM CSVs → Google Cloud Storage → BigQuery (Bronze)
↓
dbt Transformations
↓
BigQuery (Silver + Gold) → Power BI Dashboards


---

## 🧩 Project Workflow

### 1. **Data Ingestion (Bronze Layer)**
- CSV datasets from **ERP** and **CRM** systems uploaded to **Google Cloud Storage (GCS)**.  
- Data ingested into **BigQuery** as external tables under the `bronze` dataset.  
- Schema validation and source freshness checks applied.

### 2. **Transformation (Silver & Gold Layers)**
- All transformations managed and versioned via **dbt**.  
- Modular **SQL models** created for:
  - Data cleansing and standardization (Silver Layer)
  - Business logic, joins, and KPI aggregations (Gold Layer)
- Configured **dbt project structure**:

- Enabled **dbt documentation** and **data lineage** through `dbt docs generate`.

### 3. **Analytics & Visualization (Power BI)**
- Connected **Power BI Desktop** directly to **BigQuery Gold Layer** via the BigQuery connector.  
- Built **dynamic dashboards** showcasing:
- 📈 Sales trends & revenue analysis  
- 👥 Customer segmentation  
- 🏷️ Product performance metrics  
- 🌍 Regional and time-based KPIs  
- Applied advanced visuals, filters, and DAX measures for interactivity.

---

## 🧠 Concepts Implemented
- Cloud-native **ELT pipeline using BigQuery + dbt**  
- **Data Modeling** (Star Schema & Fact-Dimension design)  
- **Medallion Architecture Implementation**  
- **Data Quality and Source Freshness Testing** in dbt  
- **Modular SQL Development** with version control  
- **Power BI Integration** for real-time analytics  
- **Data Lineage Visualization** using dbt Docs  
- **CI/CD Readiness** for cloud data projects  

---

## 🧰 Tech Stack

| Category | Tools/Technologies |
|-----------|--------------------|
| **Cloud Platform** | Google Cloud Platform (GCP) |
| **Data Warehouse** | BigQuery |
| **Transformation Framework** | dbt (Data Build Tool) |
| **Data Storage** | Google Cloud Storage (GCS) |
| **Business Intelligence** | Power BI |
| **Version Control** | Git + GitHub |
| **Documentation & Lineage** | dbt Docs |

---

## 🗂️ Project Folder Structure


---

## 📊 Power BI Dashboard Highlights
The Power BI dashboard Customer Analytics provides actionable insights with:
- **Sales by Customer Segment** 
- **Age Group Distribution**  
- **Customer Lifetime Value Analysis**  
- **Top VIP Customers**  
- **KPI cards for business decisions**

---

## 🌟 Outcomes & Learnings
Through this project, I mastered:
- Designing **cloud data architectures** on GCP  
- Implementing **dbt transformation pipelines** in production-grade environments  
- Building **data lineage and model dependencies**  
- Integrating **Power BI with BigQuery** for live reporting  
- Creating **scalable and modular data models**  

This project exemplifies how modern data teams operate using **BigQuery + dbt + Power BI** for unified analytics.

---

## 👨‍💻 Author
**Dinesh Kumar Verma**  
🎯 *Aspiring Machine Learning & Data Engineering Professional*  
💼 Skilled in SQL, Python, dbt, BigQuery, and BI analytics  
🔗 [LinkedIn](https://www.linkedin.com/in/dinesh-verma-707126184/)

--