view: table_sizes {
  sql_table_name: maintenance.table_sizes ;;

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day
    ]
    sql: ${TABLE}.date ;;
  }

  ## Table Identifiers

  dimension: schema {
    type: string
    sql: ${TABLE}.schema ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}."table" ;;
  }

  dimension: table_with_schema{
    type:  string
    sql: CONCAT(${schema}, CONCAT('.',${table})) ;;
  }

  ## Point-in-time table attributes (size on disk in MB, and rows in table)

  dimension: size {
    description: "Size of the table in MB at this point in time. Use measures to aggregate values over tables or time ranges."
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: table_rows {
    description: "Number of rows in the table at this point in time. Use measures to aggregate values over tables or time ranges."
    type: number
    sql:  ${TABLE}.tbl_rows ;;
  }

  # MEASUREMENTS

  measure: count {
    type: count
    drill_fields: []
  }

  ## Measuring the size of the tables

  measure: size_average {
    group_label: "Size (MB) measures"
    type: average
    sql: ${size} ;;
  }

  measure: size_max {
    group_label: "Size (MB) measures"
    type: max
    sql: ${size} ;;
  }

  measure: size_min {
    group_label: "Size (MB) measures"
    type: min
    sql: ${size} ;;
  }

  measure: size_sum {
    group_label: "Size (MB) measures"
    type: sum
    sql: ${size} ;;
  }

  ## Measuring the rows in the tables

  measure: table_rows_average {
    group_label: "Table row measures"
    type: average
    sql: ${table_rows} ;;
  }

  measure: table_rows_max {
    group_label: "Table row measures"
    type: max
    sql: ${table_rows} ;;
  }

  measure: table_rows_min {
    group_label: "Table row measures"
    type: min
    sql: ${table_rows} ;;
  }

  measure: table_rows_sum {
    group_label: "Table row measures"
    type: sum
    sql: ${table_rows} ;;
  }
}
