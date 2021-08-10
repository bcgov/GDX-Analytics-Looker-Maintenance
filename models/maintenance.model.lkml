connection: "redshift_pacific_time"

include: "/views/**/*.view"

datagroup: table_sizes_default_datagroup {
  sql_trigger: SELECT MAX(date) FROM maintenance.table_sizes;;
}

persist_with: table_sizes_default_datagroup

explore: table_sizes {}
explore: daily_max_table_size {}
explore: daily_cluster_size {}
