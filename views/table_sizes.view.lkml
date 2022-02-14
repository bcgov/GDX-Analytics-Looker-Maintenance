view: table_sizes {
  sql_table_name: maintenance.table_sizes ;;

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      minute,
      minute10,
      time_of_day,
      hour_of_day,
      hour,
      date,
      day_of_month,
      day_of_week,
      week,
      month,
      quarter,
      year
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

  dimension: estimated_visible_rows {
    description: "The estimated rows in the table. This value does not include rows marked for deletion."
    type: number
    sql: ${TABLE}.estimated_visible_rows ;;
  }

  dimension: tombstoned_rows {
    description: "The number of rows in the table minus the estimated visible rows."
    type: number
    sql: ${TABLE}.tombstoned_rows ;;
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

  ## Estimated visible rows measures

  measure: estimated_visible_rows_average {
    group_label: "Table row measures"
    type: average
    sql: ${estimated_visible_rows} ;;
  }

  measure: estimated_visible_rows_max {
    group_label: "Table row measures"
    type: max
    sql: ${estimated_visible_rows} ;;
  }

  measure: estimated_visible_rows_min {
    group_label: "Table row measures"
    type: min
    sql: ${estimated_visible_rows} ;;
  }

  measure: estimated_visible_rows_sum {
    group_label: "Table row measures"
    type: sum
    sql: ${estimated_visible_rows} ;;
  }

  ## Tombstoned rows measures

  measure: tombstoned_rows_average {
    group_label: "Table row measures"
    type: average
    sql: ${tombstoned_rows} ;;
  }

  measure: tombstoned_rows_max {
    group_label: "Table row measures"
    type: max
    sql: ${tombstoned_rows} ;;
  }

  measure: tombstoned_rows_min {
    group_label: "Table row measures"
    type: min
    sql: ${tombstoned_rows} ;;
  }

  measure: tombstoned_rows_sum {
    group_label: "Table row measures"
    type: sum
    sql: ${tombstoned_rows} ;;
  }
}
