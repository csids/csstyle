
#  # data <- test_data_time_series()
#  plot_timeseries(data,
#                   var_y = c("Covid cases" = "cases_n", "Covid deaths" ="deaths_n", "Covid tests" = "tests_n"),
#                   breaks_x = every_nth(2),
#                   lab_main = "Norge",
#                   lab_sub = "Antall tilfeller og dødsfall",
#                  lab_y = "Antall",
#                  lab_x = "Uker",
#                  lab_legend = "Legend",
#                  palette = "warning",
#                  palette_dir = -1
#
# )


#  plot_timeseries(data,
#                   var_y = c("Covid cases" = "cases_n", "Covid deaths" ="deaths_n"),
#                   breaks_x = every_nth(2),
#                   lab_main = "Norge",
#                   lab_sub = "Antall tilfeller og dødsfall",
#                  lab_y = "Antall",
#                  lab_x = "Uker",
#                  lab_legend = "Legend",
#                  facet_wrap = "location_code",
#                  facet_ncol = 4
#
# )

#' plot_timeseries
#' @param data Dataset
#' @param var_x "date" or "isoyearweek"
#' @param var_y The name of the variable to use on the y-axis of the graph
#' @param breaks_x Use splstyle::every_nth() to choose how many ticks to show on the x-axis
#' @param lab_main The main title of the graph
#' @param lab_sub The subtitle of the graph
#' @param lab_caption If not specified, splstyle::fhi_caption() is used as the lab_caption.
#' @param lab_x The label of the x-axis
#' @param lab_y The label of the y-axis
#' @param lab_legend The label of the legend.
#' @param legend_position The position the legend should have. If not specified, "bottom" is used.
#' @param format_y How the y-axis ticks should be formatted. For example splstyle::format_nor_num_0 or fhiplot::format_nor_perc_0
#' @param facet_wrap What column in the dataset to use to split the dataset.
#' @param facet_ncol How many columns with graphs if facet_wrap is used.
#' @param palette What palette to use for the lines. The default is "primary".
#' @param palette_dir 1 or -1.
#' @param scale_y How to scale the y-axis if the graph is split with facet_wrap. Free or fixed.
#' @param base_size The base size of the plot.
#' @export
plot_timeseries <- function(data,
                            var_x = "isoyearweek",
                            var_y,
                            breaks_x = NULL,
                            lab_main = NULL,
                            lab_sub = NULL,
                            lab_caption = fhi_caption(),
                            lab_y = NULL,
                            lab_x = NULL,
                            lab_legend = NULL,
                            legend_position = "bottom",
                            format_y = format_nor_num_0,
                            facet_wrap = NULL,
                            facet_ncol = NULL,
                            palette = "primary",
                            palette_dir = 1,
                            scale_y = "free",
                            base_size = 12,
                            wide_table = TRUE
                            ) {



  if(wide_table){
    d <- melt(data,
              id.vars = c(facet_wrap, var_x),
              measure.vars = list(n = var_y),
              value.name = "n"
    )

    d_name <- data.table(name_outcome= names(var_y), variable = var_y)

    d <- d_name[d, on = 'variable']
  }
  # d <- melt(data,
  #             id.vars = c(facet_wrap, var_x),
  #             measure.vars = list(n = var_y),
  #             value.name = "n"
  # )
  #
  # d_name <- data.table(name_outcome= names(var_y), variable = var_y)
  # d <- d_name[d, on = 'variable']


  q <- ggplot(d, aes_string(x = var_x))
  q <- q + geom_path(aes(y = n, color = name_outcome, group = name_outcome), size = 1.5)
  q <- q + scale_x_discrete(name = lab_x, breaks = breaks_x)
  q <- q + scale_y_continuous(name = lab_y,
                              breaks = fhiplot::pretty_breaks(10),
                              expand = expand_scale(mult = c(0, 0.1)),
                              labels = format_y
                              )
  if(!is.null(facet_wrap)){
    q <- q + lemon::facet_rep_wrap(~get(facet_wrap), repeat.tick.labels = "y", scales = scale_y, ncol = facet_ncol)

  }



  q <- q + expand_limits(y = 0)
  q <- q + fhiplot::scale_color_fhi(lab_legend, palette = palette, direction = palette_dir)
  # q <- q + guides(color = guide_legend(order = 1, reverse = F), color = guide_legend(order = 2))
  q <- q + theme_fhi_lines_horizontal(legend_position = legend_position, base_size = base_size)
  # q <- q + theme_fhi_basic(legend_position = legend_position, base_size = base_size)
  # q <- q + fhiplot::theme_fhi_basic(base_size = 9, legend_position = "bottom")
  q <- q + labs(title = lab_main,
                subtitle = lab_sub,
                caption = lab_caption
                )
  q <- q + fhiplot::set_x_axis_vertical()
  q

}



test_data_time_series <- function(var_x = "isoyearweek") {
  set.seed(4)
  dates <- sample(seq.Date(as.Date("2018-01-01"),
                           as.Date("2018-07-08"), 1),
                  20000,
                  replace = T)
  d <- expand.grid(
    location_code = "norge",
    # location_code = unique(fhidata::norway_locations_b2020$county_code),
    date = dates
  )
  # Convert to data.table
  setDT(d)

  # print
  # print(d)

  # Convert to data.table
  setDT(d)

  # aggregate
  d <- d[,
         .(
           cases_n = .N
         ),
         keyby = .(
           location_code,
           date
         )
  ]

  d[, deaths_n := cases_n]
  d[, tests_n := cases_n]
  # aggregated daily dataset that does not contain days with 0 cases
  # print(d)

  # create skeleton
  skeleton <- data.table(expand.grid(
    location_code = "norge",
    # location_code = unique(fhidata::norway_locations_b2020$county_code),
    date = seq.Date(min(d$date), max(d$date), 1)
  ))

  # merge the two datasets together
  d <- merge(d, skeleton, by=c("location_code", "date"), all=T)

  # Fill in 'missing' Ns with 0
  d[is.na(cases_n), cases_n := 0]

  # Now you have a clean aggregated daily dataset that contains days with 0 cases!
  # print(d)

  # d <- d[location_code %in% c(
  #   "county03",
  #   "county11",
  #   "county15"
  #   # "county30",
  #   # "county34"
  # )]

  if(!is.null(var_x)){
    # create 3 new variables:
    d[, isoyearweek := fhi::isoyearweek(date)]

    # aggregate down to weekly level
    w <- d[,
           .(
             cases_n = sum(cases_n),
             deaths_n = sum(deaths_n),
             tests_n = sum(tests_n)
           ),
           keyby = .(
             location_code,
             isoyearweek
           )
    ]

    w[, deaths_n := deaths_n - 100]
    w[, tests_n := tests_n - 200]
    w[, cases_n := as.numeric(cases_n)]
    print(w)
    return(w)
  }

  return(d)
}
