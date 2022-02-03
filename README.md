
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Sql Server

This module requires the [sql server integration](https://docs.datadoghq.com/integrations/sqlserver/?tab=host) to be configured.
It has basic SQL Server monitoring. Locks, process blocked, connectivity.
It's best to also use Datadog's APM instrumentation to understand the way the application is using the database.
There's an upcoming feature in Datadog to fully support deep dive database monitoring.

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
module "kubernetes" {
  source = "kabisa/sql-server/datadog"

  notification_channel       = "mail@example.com"
  service                    = "SQL Server"
  env                        = "prd"
  alert_env                  = "prd"
  filter_str                 = "role:sqlserver"
  service_check_include_tags = ["role:sqlserver"]
}
```

Monitors:
* [Terraform module for Datadog Sql Server](#terraform-module-for-datadog-sql-server)
  * [Connections](#connections)
  * [Page Life Expectancy](#page-life-expectancy)
  * [Can Connect](#can-connect)
  * [Buffer Cache Hit Ratio](#buffer-cache-hit-ratio)
  * [Database State](#database-state)
  * [Lock Waits](#lock-waits)
  * [Batches Compiled Percent](#batches-compiled-percent)
  * [Procs Blocked](#procs-blocked)
  * [Module Variables](#module-variables)

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Connections

Query:
```terraform
avg(last_30m):max:sqlserver.stats.connections{tag:xxx} by {host} >= 500
```

| variable                      | default  | required | description                      |
|-------------------------------|----------|----------|----------------------------------|
| connections_enabled           | True     | No       |                                  |
| connections_warning           | 400      | No       |                                  |
| connections_critical          | 500      | No       |                                  |
| connections_evaluation_period | last_30m | No       |                                  |
| connections_note              | ""       | No       |                                  |
| connections_docs              | ""       | No       |                                  |
| connections_filter_override   | ""       | No       |                                  |
| connections_alerting_enabled  | True     | No       |                                  |
| connections_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Page Life Expectancy

When this metric is low, pages are not being cached for a short time and often read from disk. Consider allocating more memory.

Query:
```terraform
avg(last_1d):min:sqlserver.buffer.page_life_expectancy{tag:xxx} by {host} < 900
```

| variable                               | default                                  | required | description                      |
|----------------------------------------|------------------------------------------|----------|----------------------------------|
| page_life_expectancy_enabled           | True                                     | No       |                                  |
| page_life_expectancy_warning           | 1800                                     | No       |                                  |
| page_life_expectancy_critical          | 900                                      | No       |                                  |
| page_life_expectancy_evaluation_period | last_1d                                  | No       |                                  |
| page_life_expectancy_note              | ""                                       | No       |                                  |
| page_life_expectancy_docs              | When this metric is low, pages are not being cached for a short time and often read from disk. Consider allocating more memory. | No       |                                  |
| page_life_expectancy_filter_override   | ""                                       | No       |                                  |
| page_life_expectancy_alerting_enabled  | True                                     | No       |                                  |
| page_life_expectancy_priority          | 4                                        | No       | Number from 1 (high) to 5 (low). |


## Can Connect

| variable                     | default  | required | description  |
|------------------------------|----------|----------|--------------|
| can_connect_enabled          | True     | No       |              |
| can_connect_alerting_enabled | True     | No       |              |
| can_connect_warning          | 1        | No       |              |
| can_connect_critical         | 1        | No       |              |
| can_connect_priority         | 1        | No       |              |
| can_connect_docs             | ""       | No       |              |
| can_connect_note             | ""       | No       |              |


## Buffer Cache Hit Ratio

When this metric is low, pages are often read from disk. Consider allocating more memory.

Query:
```terraform
avg(last_1d):min:sqlserver.buffer.cache_hit_ratio{tag:xxx} by {host} * 100 < 75
```

| variable                                 | default                                  | required | description                      |
|------------------------------------------|------------------------------------------|----------|----------------------------------|
| buffer_cache_hit_ratio_enabled           | True                                     | No       |                                  |
| buffer_cache_hit_ratio_warning           | 90                                       | No       |                                  |
| buffer_cache_hit_ratio_critical          | 75                                       | No       |                                  |
| buffer_cache_hit_ratio_evaluation_period | last_1d                                  | No       |                                  |
| buffer_cache_hit_ratio_note              | ""                                       | No       |                                  |
| buffer_cache_hit_ratio_docs              | When this metric is low, pages are often read from disk. Consider allocating more memory. | No       |                                  |
| buffer_cache_hit_ratio_filter_override   | ""                                       | No       |                                  |
| buffer_cache_hit_ratio_alerting_enabled  | True                                     | No       |                                  |
| buffer_cache_hit_ratio_priority          | 4                                        | No       | Number from 1 (high) to 5 (low). |


## Database State

Query:
```terraform
max(last_5m):max:sqlserver.database.state{tag:xxx} by {host,database,database_state_desc} >= 5
```

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| database_state_enabled           | True     | No       |                                  |
| database_state_warning           | 1        | No       |                                  |
| database_state_critical          | 5        | No       |                                  |
| database_state_evaluation_period | last_5m  | No       |                                  |
| database_state_note              | ""       | No       |                                  |
| database_state_docs              | ""       | No       |                                  |
| database_state_filter_override   | ""       | No       |                                  |
| database_state_alerting_enabled  | True     | No       |                                  |
| database_state_priority          | 1        | No       | Number from 1 (high) to 5 (low). |


## Lock Waits

High numbers of lock waits per second is caused by lock contention. Try reducing lock contention by using more fine grained locking in the queries.

Query:
```terraform
avg(last_30m):max:sqlserver.stats.lock_waits{tag:xxx} by {host} > 20
```

| variable                     | default                                  | required | description                      |
|------------------------------|------------------------------------------|----------|----------------------------------|
| lock_waits_enabled           | True                                     | No       |                                  |
| lock_waits_warning           | 10                                       | No       |                                  |
| lock_waits_critical          | 20                                       | No       |                                  |
| lock_waits_evaluation_period | last_30m                                 | No       |                                  |
| lock_waits_note              | ""                                       | No       |                                  |
| lock_waits_docs              | High numbers of lock waits per second is caused by lock contention. Try reducing lock contention by using more fine grained locking in the queries. | No       |                                  |
| lock_waits_filter_override   | ""                                       | No       |                                  |
| lock_waits_alerting_enabled  | True                                     | No       |                                  |
| lock_waits_priority          | 4                                        | No       | Number from 1 (high) to 5 (low). |


## Batches Compiled Percent

When this metric is high, a lot of queries need to be recompiled. Consider parameterizing more queries by using stored procedures, using forced parameterization or allocating more memory.

Query:
```terraform
avg(last_1d):(max:sqlserver.stats.sql_compilations{tag:xxx} by {host} / max:sqlserver.stats.batch_requests{tag:xxx} by {host}) * 100 >= 20
```

| variable                                   | default                                  | required | description                      |
|--------------------------------------------|------------------------------------------|----------|----------------------------------|
| batches_compiled_percent_enabled           | True                                     | No       |                                  |
| batches_compiled_percent_warning           | 10                                       | No       |                                  |
| batches_compiled_percent_critical          | 20                                       | No       |                                  |
| batches_compiled_percent_evaluation_period | last_1d                                  | No       |                                  |
| batches_compiled_percent_note              | ""                                       | No       |                                  |
| batches_compiled_percent_docs              | When this metric is high, a lot of queries need to be recompiled. Consider parameterizing more queries by using stored procedures, using forced parameterization or allocating more memory. | No       |                                  |
| batches_compiled_percent_filter_override   | ""                                       | No       |                                  |
| batches_compiled_percent_alerting_enabled  | True                                     | No       |                                  |
| batches_compiled_percent_priority          | 4                                        | No       | Number from 1 (high) to 5 (low). |


## Procs Blocked

High number of procs blocked can indicate deadlocks. Check for deadlocks by investigating which queries are waiting for locks to be released.

Query:
```terraform
avg(last_10m):max:sqlserver.stats.procs_blocked{tag:xxx} by {host} >= 1
```

| variable                        | default                                  | required | description                      |
|---------------------------------|------------------------------------------|----------|----------------------------------|
| procs_blocked_enabled           | True                                     | No       |                                  |
| procs_blocked_warning           | None                                     | No       |                                  |
| procs_blocked_critical          | 1                                        | No       |                                  |
| procs_blocked_evaluation_period | last_10m                                 | No       |                                  |
| procs_blocked_note              | ""                                       | No       |                                  |
| procs_blocked_docs              | High number of procs blocked can indicate deadlocks. Check for deadlocks by investigating which queries are waiting for locks to be released. | No       |                                  |
| procs_blocked_filter_override   | ""                                       | No       |                                  |
| procs_blocked_alerting_enabled  | True                                     | No       |                                  |
| procs_blocked_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                   | default  | required | description  |
|----------------------------|----------|----------|--------------|
| env                        |          | Yes      |              |
| alert_env                  |          | Yes      |              |
| filter_str                 |          | Yes      |              |
| service                    |          | Yes      |              |
| notification_channel       |          | Yes      |              |
| additional_tags            | []       | No       |              |
| name_prefix                | ""       | No       |              |
| name_suffix                | ""       | No       |              |
| locked                     | True     | No       |              |
| service_check_include_tags | None     | No       |              |
| service_check_exclude_tags | None     | No       |              |


