view: table_sizes {
  sql_table_name: scratch.table_sizes ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.schema ;;
  }

  dimension: size {
    hidden: yes
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}."table" ;;
  }
  measure: sum {
    type: sum
    sql: ${size} ;;
  }

  measure: average {
    type: average
    sql: ${size} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
