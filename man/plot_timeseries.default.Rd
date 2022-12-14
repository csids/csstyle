% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_timeseries.r
\name{plot_timeseries.default}
\alias{plot_timeseries.default}
\title{plot_timeseries}
\usage{
\method{plot_timeseries}{default}(
  x,
  var_x = "isoyearweek",
  var_y,
  breaks_x = NULL,
  breaks_y = NULL,
  lab_main = NULL,
  lab_sub = NULL,
  lab_caption = fhi_caption(),
  lab_date = "\%Y-\%m-\%d",
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
  var_group = NULL,
  geom_point = FALSE,
  ...
)
}
\arguments{
\item{x}{Dataset}

\item{var_x}{"date" or "isoyearweek"}

\item{var_y}{The name of the variable to use on the y-axis of the graph}

\item{breaks_x}{Use csstyle::every_nth() to choose how many ticks to show on the x-axis}

\item{breaks_y}{Use csstyle::pretty_breaks() to add ticks on the y-axis}

\item{lab_main}{The main title of the graph}

\item{lab_sub}{The subtitle of the graph}

\item{lab_caption}{If not specified, csstyle::fhi_caption() is used as the lab_caption.}

\item{lab_date}{How the dates on the x-axis should be formatted if var_x = "date"}

\item{lab_y}{The label of the y-axis}

\item{lab_x}{The label of the x-axis}

\item{lab_legend}{The label of the legend.}

\item{legend_position}{The position the legend should have. If not specified, "bottom" is used.}

\item{legend_direction}{layout of items in legend ("horizontal" or "vertical")}

\item{format_y}{How the y-axis ticks should be formatted. For example csstyle::format_nor_num_0 or csstyle::format_nor_perc_0}

\item{facet_wrap}{What column in the dataset to use to split the dataset.}

\item{facet_ncol}{How many columns with graphs if facet_wrap is used.}

\item{palette}{What palette to use for the lines. The default is "primary".}

\item{palette_dir}{1 or -1.}

\item{scale_y}{How to scale the y-axis if the graph is split with facet_wrap. Free or fixed.}

\item{base_size}{The base size of the plot.}

\item{wide_table}{TRUE if the data.table is wide and FALSE if the data.table is long.}

\item{var_group}{variable to group by}

\item{geom_point}{TRUE if points should be included in the graph.}

\item{...}{Not currently used.}
}
\description{
If the dataset is already long it needs to include the following columns: variable, name_outcome and n.
}
\examples{
plot_timeseries(nor_covid19_cases_by_time_location[granularity_geo == "nation" & granularity_time == "isoweek"], var_y = c("Covid cases" = "covid19_cases_testdate_n"), breaks_x = every_nth(8), breaks_y = csstyle::pretty_breaks(5))
plot_timeseries(nor_covid19_cases_by_time_location[location_code \%in\% c("county_nor03", "county_nor18", "county_nor30", "county_nor54") & granularity_time == "isoweek"], var_y = c("Covid cases" = "covid19_cases_testdate_n"), breaks_x = every_nth(8), breaks_y = csstyle::pretty_breaks(5), facet_wrap = "location_code")
plot_timeseries(nor_covid19_cases_by_time_location[granularity_geo == "county" & granularity_time == "isoweek"], var_y = c("Covid cases" = "covid19_cases_testdate_n"), breaks_x = every_nth(8), breaks_y = csstyle::pretty_breaks(5), var_group = "location_code")
}
