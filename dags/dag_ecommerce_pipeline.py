from airflow import DAG
from airflow.operators.bash import BashOperator
import pendulum

default_args = {
    'owner': 'Luisinho',
}

with DAG(
    dag_id='ecommerce_pipeline',
    default_args=default_args,
    start_date=pendulum.now().subtract(days=1),
    schedule=None,
    catchup=False,
) as dag:

    extract_data = BashOperator(
        task_id='extract_data',
        bash_command='python /opt/airflow/scripts/fetch_amazon_data.py'
    )

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/dbt/ecommerce_analytics && dbt run'
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='cd /opt/airflow/dbt/ecommerce_analytics && dbt test'
    )

    extract_data >> dbt_run >> dbt_test
