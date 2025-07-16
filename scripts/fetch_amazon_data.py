import kagglehub
from kagglehub import KaggleDatasetAdapter
import duckdb
import os

output_dir = '/opt/airflow/data_warehouse'
os.makedirs(output_dir, exist_ok=True)

db_path = os.path.join(output_dir, 'ecommerce.duckdb')

df = kagglehub.load_dataset(
  KaggleDatasetAdapter.PANDAS,
  "karkavelrajaj/amazon-sales-dataset",
  "amazon.csv"
)

print("First 5 records:", df.head())

con = duckdb.connect(db_path)

con.execute("DROP TABLE IF EXISTS amazon_sales")
con.execute("CREATE TABLE amazon_sales AS SELECT * FROM df")

print(f"Tabela 'amazon_sales' gravada com sucesso no DuckDB em {db_path}")

con.close()