# CowJacket – dbt Cloud Implementation
This project implements dbt Cloud on Snowflake to standardize transformations, enforce data quality, and provide end-to-end lineage across environments.

## Modeling Layers (all environments)

<img width="1536" height="1024" alt="model architecture" src="https://github.com/user-attachments/assets/e13f4eb8-589a-4919-a40d-76c3f664d147" />

Following a 3‑layer modeling approach in all environments (dev, staging, prod):

- staging – cleaned, lightly transformed source data: dbt_Adesoyin_STG

- intermediate – reusable transformations and fact-level logic: dbt_staging_INT

- marts – analytics-ready, business-facing tables: <schema>_MART

Each layer is deployed to a separate schema per environment for isolation and safety.

| Environment | Database | Purpose |
|-------------|----------|---------|
| dev | CANALYTICS | Local development & testing |
| staging | ANALYTICS_STAGING | CI runs & validation |
| production | ADEFACTORY_PROD | Final analytics tables |

Databases are pre-created in Snowflake.

dbt manages schemas and tables only.

**Guarded Models**

Some models (e.g. fact_sales) are environment-guarded:

- Enabled only in production

- Materialize to a dedicated production schema (e.g. ANALYTICS_MARTS)

- Skipped in dev and staging with warnings only (no job failures)

This prevents accidental production writes while keeping CI stable.

## Guardrails

- Production-only model are controlled using enabled: (target.name == 'prod')

- Ensured Dev runs skip protected models to avoid (no errors, no failures)

- Schema naming is centrally managed via dbt_project.yml

## Observability & Documentation

- All models and columns are documented

- Tests include generic (not null, unique), custom for business logic

- dbt run metadata is logged for monitoring and debugging in canalytics database table which includes (model name, environment, status, duration, row count)

This supports performance monitoring, debugging, and auditability.

### dbt Docs

Using `dbt docs generate`, Dbt Cloud Documentation was generated and can be [found here](https://uk863.us1.dbt.com/api/ide/v2/70471824442676/legacy/files/docs/index.html#!/overview)

## CI & Promotion Strategy (Appendix)

Additional data were added to the raw tables and tested using the CI pull request Job to see update on the prod database.

CI job runs automatically on pull requests to main

CI executes in the staging environment

After merge and approval, models are promoted to production

<img width="1582" height="803" alt="image" src="https://github.com/user-attachments/assets/b856151c-e1bb-4c53-b926-353cd9926cf2" /> 

<img width="1446" height="803" alt="image" src="https://github.com/user-attachments/assets/ece47bd7-fcf8-4c59-9734-ada9c49239b6" />

## Reproducibility Notes

**To reproduce this setup:**

Create Snowflake databases and warehouses or any other databases of your choice

Configure dbt Cloud environments

Follow the resources below to learn more and practice to Run dbt build in dev → staging (CI) → production

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices