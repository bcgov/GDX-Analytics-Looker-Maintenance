connection: "redshift_pacific_time"

# include all the views
include: "/views/**/*.view"

datagroup: table_sizes_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: table_sizes_default_datagroup

explore: table_sizes {}

# explore: events_new {}
