{% macro grant_select(schema=target.schema, project=target.project) %}

  {% set sql %} 
  grant `roles/bigquery.dataViewer` on schema `{{ project }}`.`{{ schema }}` to "user:mherkaliuk@gmail.com";
  {% endset %}

  {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to project ' ~ project, info=True) }}
  {% do run_query(sql) %}
  {{ log('Privileges granted', info=True) }}

{% endmacro %}