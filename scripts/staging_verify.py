import duckdb

db_path = 'data_warehouse/ecommerce.duckdb'

con = duckdb.connect(db_path)

query = """
SELECT *
FROM stg_amazon_sales
WHERE rating IS NOT NULL AND rating_count IS NOT NULL
"""

df = con.execute(query).fetchdf()
print(df)

con.close()
