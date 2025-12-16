## CowJacket: DBT Cloud Implementation
This project uses dbt + Snowflake to standardize transformations, enforce data quality, and provide clear lineage across environments.

### Model Architecture

<img width="1536" height="1024" alt="model architecture" src="https://github.com/user-attachments/assets/e13f4eb8-589a-4919-a40d-76c3f664d147" />

Following a 3‑layer modeling approach in all environments (dev, staging, prod): Each environment contains separate schemas for isolation and safety:

- staging – cleaned, lightly transformed source data: dbt_Adesoyin_STG

- intermediate – reusable transformations and fact-level logic: dbt_staging_INT

- marts – analytics-ready, business-facing tables: <schema>_MART

| Environment | Database | Purpose |
|-------------|----------|---------|
| dev | CANALYTICS | Local development & testing |
| staging | ANALYTICS_STAGING | CI runs & validation |
| production | ADEFACTORY_PROD | Final analytics tables |

Some guarded models (e.g. fact_sales) is enabled only in staging and write directly to production.

### Guardrails

- Production-only models are controlled using enabled: (target.name == 'staging')

- Ensured Dev runs skip protected models to avoid (no errors, no failures)

- Schema naming is centrally managed via dbt_project.yml

### Observability & Documentation

- All models and columns are documented

- Tests include generic, custom, and unit tests

- dbt run metadata is logged for monitoring and debugging in canalytics database table

### 👉 dbt Docs

Using `dbt docs generate`, Dbt Cloud Documentation was generated and can be [found here](https://uk863.us1.dbt.com/api/ide/v2/70471824433358/legacy/files/docs/index.html#!/model/model.cow_jacket.int_customers)

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices





## Appendix
Following direct promotion strategy, the CI job is triggered automatically for every pull request in staging environment. 

<img width="1582" height="803" alt="image" src="https://github.com/user-attachments/assets/b856151c-e1bb-4c53-b926-353cd9926cf2" />

When automatically approved after merge to main branch, models are promoted directly to production.

<img width="1446" height="803" alt="image" src="https://github.com/user-attachments/assets/ece47bd7-fcf8-4c59-9734-ada9c49239b6" />

