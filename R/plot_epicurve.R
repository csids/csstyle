#' Epicurve
#' @param x Dataset
#' @param ... X
#' @export
plot_epicurve <- function(x,
                          ...) {
  UseMethod("plot_epicurve", x)
}

#' Epicurve
#' @param x Dataset
#' @param type "single", "stacked" or "dodged"
#' @param fill_var variable to fill by.
#' @param fill_lab fill label
#' @param facet_wrap What column in the dataset to use to split the dataset.
#' @param facet_ncol How many columns with graphs
#' @param var_x "date" or "isoyearweek"
#' @param var_y The name of the variable to use on the y-axis of the graph
#' @param breaks_x Use csstyle::every_nth() to choose how many ticks to show on the x-axis
#' @param lab_x The label of the x-axis
#' @param lab_y The label of the y-axis
#' @param lab_main The main title of the graph
#' @param lab_sub The subtitle of the graph
#' @param lab_caption If not specified, csstyle::fhi_caption() is used as the lab_caption.
#' @param lab_date How the dates on the x-axis should be formatted if var_x = "date"
#' @param format_y How the y-axis ticks should be formatted. For example csstyle::format_nor_num_0 or csstyle::format_nor_perc_0
#' @param scale_y How to scale the y-axis if the graph is split with facet_wrap. Free or fixed.
#' @param palette what palette to use
#' @param base_size size of plot
#' @param ... Not currently used.
#' @examples
#' plot_epicurve(nor_covid19_cases_by_time_location[location_code == "county_nor03"], type = "single", var_y = "covid19_cases_testdate_n")
#' plot_epicurve(nor_covid19_cases_by_time_location[granularity_geo == "county"], type = "stacked", fill_var = "location_code", var_y = "covid19_cases_testdate_n")
#' plot_epicurve(nor_covid19_cases_by_time_location[granularity_geo == "county" & location_code %in% c("county_nor34", "county_nor38", "county_nor11")], type = "dodged", fill_var = "location_code", var_y = "covid19_cases_testdate_n")
#' @export
plot_epicurve.default <- function(x,
                                  type = "single",
                                  fill_var = NULL,
                                  fill_lab = NULL,
                                  facet_wrap = NULL,
                                  facet_ncol = NULL,
                                  var_x = "isoyearweek",
                                  var_y,
                                  breaks_x = csstyle::every_nth(n = 2),
                                  lab_x = NULL,
                                  lab_y = NULL,
                                  lab_main = NULL,
                                  lab_sub = NULL,
                                  lab_caption = fhi_caption(),
                                  lab_date = "%Y-%m-%d",
                                  format_y = format_nor_num_0,
                                  scale_y = "free",
                                  palette = "primary",
                                  base_size = 12,
                                  ...) {

  stopifnot(var_x %in% c("date", "isoyearweek"))
  stopifnot(type %in% c("single", "stacked", "dodged"))

  # dots <- list(...)

  if(type == "stacked"){
    q <- ggplot(x, aes_string(x = var_x, y = var_y, fill = fill_var))
    q <- q + geom_col(width = 0.8)
    q <- q + scale_fill_fhi(fill_lab, palette = palette)
  } else if(type == "single"){
    q <- ggplot(x, aes_string(x = var_x, y = var_y))
    q <- q + geom_col(fill = base_color, width = 0.8)
  } else if (type == "dodged") {
    q <- ggplot(x, aes_string(x = var_x, y = var_y, fill = fill_var))
    q <- q + geom_col(position = "dodge", width = 0.8)
    q <- q + scale_fill_fhi(fill_lab, palette = palette)
  }

  if(var_x == "date"){
    q <- q + scale_x_date(name = lab_x, date_labels = lab_date, breaks = breaks_x)
  } else{
    q <- q + scale_x_discrete(name = lab_x, breaks = breaks_x)
  }

  if(!is.null(facet_wrap)){
    q <- q + lemon::facet_rep_wrap(~get(facet_wrap), repeat.tick.labels = "y", ncol = facet_ncol)

  }

  q <- q + scale_y_continuous(name = lab_y,
                              expand = expansion(mult = c(0, 0.1)),
                              breaks = pretty_breaks(5),
                              labels = format_y
  )
  q <- q + labs(title = lab_main,
                subtitle = lab_sub,
                caption = lab_caption,
  )
  q <- q + theme_fhi_lines_horizontal(legend_position = "bottom", base_size = base_size)
  q <- q + set_x_axis_vertical()
  q
}
