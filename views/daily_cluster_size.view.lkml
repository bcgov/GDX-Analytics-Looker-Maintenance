view: daily_cluster_size {
  derived_table: {
    sql: WITH by_time AS (
          SELECT date AS timestamp, SUM(size) AS total_size_at_time
          FROM  maintenance.table_sizes
          GROUP BY 1
        )
        SELECT DATE_TRUNC('day', timestamp) AS date, MAX(total_size_at_time) AS max_total_size
        FROM by_time
        GROUP BY 1;;
  }

  dimension: max_total_size {
    type: number
    sql: ${TABLE}.max_total_size ;;
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

  measure: size_max {
    group_label: "Size (MB) measures"
    type: max
    sql: ${max_total_size} ;;
  }
}
