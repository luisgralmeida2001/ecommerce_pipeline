# Ecommerce Data Pipeline

<img width="4611" height="2281" alt="Diagrama sem nome drawio (1)" src="https://github.com/user-attachments/assets/6ab549ee-2992-49e2-a5ae-8b07a45d49f7" />


Este projeto é uma pipeline de dados desenvolvida para fins de estudo em Engenharia de Dados, abordando todo o ciclo de ingestão, transformação e orquestração de dados.

## Tecnologias Utilizadas

- **Apache Airflow 3.0**: Orquestração das tarefas e monitoramento do pipeline.
- **Python**: Desenvolvimento do script de extração de dados.
- **DuckDB**: Banco de dados analítico leve utilizado para armazenamento local dos dados.
- **dbt (Data Build Tool)**: Transformação e modelagem dos dados com versionamento controlado.
- **Docker Compose**: Contêinerização de toda a aplicação para garantir portabilidade e isolamento.

## Descrição do Fluxo

1. **Extração**: 
   - Coleta dos dados de vendas da Amazon disponibilizados no Kaggle.
   - Um script Python coleta e insere os dados no DuckDB.

2. **Transformação e Modelagem**:
   - Utilização do dbt para criar modelos analíticos em DuckDB.
   - Aplicação de testes para validar a integridade dos dados modelados.

3. **Orquestração**:
   - Airflow controla a execução de cada etapa, garantindo o fluxo ordenado e monitorável.

## Estrutura de Pastas
airflow/
├── dags/ # DAGs do Airflow
├── config/ # Configurações
├── dbt/ # Projeto dbt completo
├── scripts/ # Scripts Python para extração
├── logs/ # Logs do Airflow
└── plugins/ # Plugins customizados (se houver)

---

Projeto desenvolvido para aprofundar conhecimentos práticos em engenharia de dados com foco em integração de ferramentas modernas e boas práticas de pipelines.
