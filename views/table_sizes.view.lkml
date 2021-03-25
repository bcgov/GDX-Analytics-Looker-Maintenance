view: table_sizes {
  sql_table_name: maintenance.table_sizes ;;

  dimension_group: date {
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

  dimension: table_rows {
    type: number
    sql:  ${TABLE}.tbl_rows ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.schema ;;
  }

  dimension: table_with_schema{
    type:  string
    sql: CONCAT(${schema}, CONCAT('.',${table})) ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}."table" ;;
  }

  measure: size_sum {
    type: sum
    sql: ${size} ;;
  }

  measure: size_average {
    type: average
    sql: ${size} ;;
  }

  measure: table_rows_sum {
    type: sum
    sql: ${table_rows} ;;
  }

  measure: table_rows_average {
    type: average
    sql: ${table_rows} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
