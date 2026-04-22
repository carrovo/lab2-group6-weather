# DATA226 Lab2 - ELT Pipeline with dbt and Airflow

## Overview
This project implements an ELT pipeline using dbt and Apache Airflow. The pipeline processes weather data, performs transformations, and creates analytics-ready tables in Snowflake.

## Architecture
- **Data Source**: Raw weather data in Snowflake
- **Transformation Tool**: dbt
- **Orchestration**: Apache Airflow
- **Data Warehouse**: Snowflake

## Project Structure

```
Airflow/
│── dags/                  # Airflow DAGs
│── dbt/                   # dbt project
│   ├── analyses/
│   ├── macros/
│   ├── models/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   ├── dbt_project.yml
│   └── profiles.yml
│── docker-compose.yaml
│── README.md
```


## dbt Workflow
The dbt pipeline includes:
- **Staging models**: Clean and prepare raw data
- **Analytics models**:
  - `weather_daily_metrics`
  - `weather_forecast_overview`
- **Tests**: Data quality checks
- **Snapshot**: Track changes in forecast data

## Airflow DAG
The pipeline is orchestrated using Airflow:
- DAG: `build_elt_with_dbt_lab2`
- Tasks:
  - `dbt_run`
  - `dbt_test`
  - `dbt_snapshot`

## How to Run
1. Start Airflow:
   ```bash
   docker compose up -d

2. Open Airflow UI:

   http://localhost:8081

3. Trigger DAG:

   build_elt_with_dbt_lab2

## Notes
Replace credentials in profiles.yml before running

dbt commands are executed inside the Airflow container
