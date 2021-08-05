view: daily_max_table_size {
  derived_table: {
    sql:  SELECT
            distinct ts.table AS tablename,
            ts.date AS date,
            ts.schema AS schema,
            MAX(ts.size) OVER (
              PARTITION BY date_part('day', date), tablename
            ) as size
          FROM maintenance.table_sizes AS ts
          GROUP BY tablename, date, schema, size ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}.tablename ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.schema ;;
  }

  dimension: size {
    description: "Max size of the table in MB for a given day. Use measures to aggregate values over tables or time ranges."
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension_group: date {
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

  # Measures

  measure: size_sum {
    group_label: "Size (MB) measures"
    type: sum
    sql: ${size} ;;
  }
}
