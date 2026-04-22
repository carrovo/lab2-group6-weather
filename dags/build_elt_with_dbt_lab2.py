from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="build_elt_with_dbt_lab2",
    start_date=datetime(2026, 4, 20),
    schedule="0 4 * * *",
    catchup=False,
    tags=["lab2", "dbt", "elt"],
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd /opt/airflow/dbt && dbt run --profiles-dir ."
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /opt/airflow/dbt && dbt test --profiles-dir ."
    )

    dbt_snapshot = BashOperator(
        task_id="dbt_snapshot",
        bash_command="cd /opt/airflow/dbt && dbt snapshot --profiles-dir ."
    )

    dbt_run >> dbt_test >> dbt_snapshot