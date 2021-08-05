connection: "redshift_pacific_time"

include: "/views/**/*.view"

datagroup: table_sizes_default_datagroup {
  sql_trigger: SELECT MAX(date) FROM maintenance.table_sizes;;
}

persist_with: table_sizes_default_datagroup

explore: table_sizes {
   join: daily_max_table_size {
    type: left_outer
    sql_on: ${table_sizes.table} = ${daily_max_table_size.table}
      AND DATE(${table_sizes.timestamp_date}) = ${daily_max_table_size.date_date} ;;
    relationship: many_to_one
   }
}
explore: daily_max_table_size {}
