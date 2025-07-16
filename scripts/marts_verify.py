import duckdb
import pandas as pd

# Conexão com o arquivo DuckDB
db_path = 'data_warehouse/ecommerce.duckdb'
con = duckdb.connect(db_path)

# Função para executar e exibir query
def query_and_show(sql, title):
    print(f"\n{'='*20} {title} {'='*20}")
    df = con.execute(sql).fetchdf()
    print(df)

# 1. Product Category Insights
query_and_show(
    """
    SELECT * FROM mart_product_insights
    ORDER BY total_products DESC
    """,
    "Product Category Insights"
)

# 2. Discount Analysis
query_and_show(
    """
    SELECT * FROM mart_discount_analysis
    ORDER BY discount_range
    """,
    "Discount Analysis"
)

# 3. Rating Distribution
query_and_show(
    """
    SELECT * FROM mart_rating_distribution
    ORDER BY rating_bucket
    """,
    "Rating Distribution"
)

# 4. Top Rated Products
query_and_show(
    """
    SELECT * FROM mart_top_rated_products
    """,
    "Top Rated Products"
)

con.close()
