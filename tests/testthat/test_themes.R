context("ggplot2 themes")

test_that("theme_cs creates valid ggplot2 theme", {
  theme_obj <- theme_cs()
  testthat::expect_s3_class(theme_obj, "theme")
  testthat::expect_s3_class(theme_obj, "gg")
})

test_that("theme_cs with different parameters works", {
  theme_bottom <- theme_cs(legend_position = "bottom")
  theme_vertical <- theme_cs(x_axis_vertical = TRUE)
  theme_no_panel <- theme_cs(panel_on_top = FALSE)
  
  testthat::expect_s3_class(theme_bottom, "theme")
  testthat::expect_s3_class(theme_vertical, "theme")
  testthat::expect_s3_class(theme_no_panel, "theme")
})

test_that("set_x_axis_vertical returns theme element", {
  axis_theme <- set_x_axis_vertical()
  testthat::expect_s3_class(axis_theme, "theme")
})