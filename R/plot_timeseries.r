#' plot_timeseries
#' @param x Dataset
#' @param ... X
#' @export
plot_timeseries <- function(x,
                          ...) {
  UseMethod("plot_timeseries", x)
}

#' Create a new timeseries graph
#'
#' If the dataset is already long it needs to include the following columns: variable, name_outcome and n.
#' @param x Dataset
#' @param var_x "date" or "isoyearweek"
#' @param var_y The name of the variable to use on the y-axis of the graph
#' @param breaks_x Use splstyle::every_nth() to choose how many ticks to show on the x-axis
#' @param breaks_y Use splstyle::pretty_breaks() to add ticks on the y-axis
#' @param lab_main The main title of the graph
#' @param lab_sub The subtitle of the graph
#' @param lab_caption If not specified, splstyle::fhi_caption() is used as the lab_caption.
#' @param lab_x The label of the x-axis
#' @param lab_y The label of the y-axis
#' @param lab_legend The label of the legend.
#' @param legend_position The position the legend should have. If not specified, "bottom" is used.
#' @param legend_direction layout of items in legend ("horizontal" or "vertical")
#' @param format_y How the y-axis ticks should be formatted. For example splstyle::format_nor_num_0 or fhiplot::format_nor_perc_0
#' @param facet_wrap What column in the dataset to use to split the dataset.
#' @param facet_ncol How many columns with graphs if facet_wrap is used.
#' @param palette What palette to use for the lines. The default is "primary".
#' @param palette_dir 1 or -1.
#' @param scale_y How to scale the y-axis if the graph is split with facet_wrap. Free or fixed.
#' @param base_size The base size of the plot.
#' @param wide_table TRUE if the data.table is wide and FALSE if the data.table is long.
#' @param ... Not currently used.
#' @examples
#' plot_timeseries(norway_covid19_cases_by_time_location[granularity_geo == "nation" & granularity_time == "isoweek"], var_y = c("Covid cases" = "covid19_cases_testdate_n"), breaks_x = every_nth(8), breaks_y = splstyle::pretty_breaks(5))
#' plot_timeseries(norway_covid19_cases_by_time_location[location_code %in% c("county03", "county18", "county30", "county54") & granularity_time == "isoweek"], var_y = c("Covid cases" = "covid19_cases_testdate_n"), breaks_x = every_nth(8), breaks_y = splstyle::pretty_breaks(5), facet_wrap = "location_code")
#' @export
plot_timeseries.default <- function(x,
                            var_x = "isoyearweek",
                            var_y,
                            breaks_x = NULL,
                            breaks_y = NULL,
                            lab_main = NULL,
                            lab_sub = NULL,
                            lab_caption = fhi_caption(),
                            lab_y = NULL,
                            lab_x = NULL,
                            lab_legend = NULL,
                            legend_position = "bottom",
                            legend_direction = "horizontal",
                            format_y = format_nor_num_0,
                            facet_wrap = NULL,
                            facet_ncol = NULL,
                            palette = "primary",
                            palette_dir = 1,
                            scale_y = "free",
                            base_size = 12,
                            wide_table = TRUE,
                            ...
                            ) {


  if(wide_table){
    d <- melt(x,
              id.vars = c(facet_wrap, var_x),
              measure.vars = list(n = var_y),
              value.name = "n"
    )

    d_name <- data.table(name_outcome= names(var_y), variable = var_y)

    d <- d_name[d, on = 'variable']
  }

  if(!"name_outcome" %in% names(d)){
    stop("name_outcome is not a column in x")
  }

  if(!"variable" %in% names(d)){
    stop("variable is not a column in x")
  }

  if(!"n" %in% names(d)){
    stop("n is not a column in x")
  }


  q <- ggplot(d, aes_string(x = var_x))
  q <- q + geom_path(aes(y = n, color = name_outcome, group = name_outcome), lwd = 1)
  q <- q + scale_x_discrete(name = lab_x, breaks = breaks_x)
  q <- q + scale_y_continuous(name = lab_y,
                              breaks = breaks_y,
                              expand = expand_scale(mult = c(0, 0.1)),
                              labels = format_y
                              )

  if(!is.null(facet_wrap)){
    q <- q + lemon::facet_rep_wrap(~get(facet_wrap), repeat.tick.labels = "y", scales = scale_y, ncol = facet_ncol)

  }

  q <- q + expand_limits(y = 0)
  q <- q + fhiplot::scale_color_fhi(lab_legend, palette = palette, direction = palette_dir)
  q <- q + theme_fhi_lines_horizontal(legend_position = legend_position, base_size = base_size)
  q <- q + theme(legend.direction = legend_direction)
  q <- q + labs(title = lab_main,
                subtitle = lab_sub,
                caption = lab_caption
                )
  q <- q + fhiplot::set_x_axis_vertical()
  q

}
