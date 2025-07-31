context("color palettes")

test_that("colors object is properly structured", {
  testthat::expect_type(colors, "list")
  testthat::expect_true("named_colors" %in% names(colors))
  testthat::expect_true("palettes" %in% names(colors))
  testthat::expect_true("palette_names" %in% names(colors))
})

test_that("primary palette functions work", {
  testthat::expect_true("primary_1" %in% names(colors$palettes))
  testthat::expect_true("primary_2" %in% names(colors$palettes))
  testthat::expect_length(colors$palettes$primary_1, 1)
  testthat::expect_length(colors$palettes$primary_2, 2)
})

test_that("scale_color_cs creates ggplot2 scale", {
  testthat::skip_if_not_installed("ggplot2")
  scale_obj <- scale_color_cs()
  testthat::expect_s3_class(scale_obj, "Scale")
  testthat::expect_s3_class(scale_obj, "ScaleDiscrete")
})

test_that("scale_fill_cs creates ggplot2 scale", {
  testthat::skip_if_not_installed("ggplot2")
  scale_obj <- scale_fill_cs()
  testthat::expect_s3_class(scale_obj, "Scale")
  testthat::expect_s3_class(scale_obj, "ScaleDiscrete")
})

test_that("different palette types work", {
  testthat::skip_if_not_installed("ggplot2")
  scale_primary <- scale_color_cs(palette = "primary")
  scale_warning <- scale_color_cs(palette = "warning")
  scale_posneg <- scale_color_cs(palette = "posneg")
  
  testthat::expect_s3_class(scale_primary, "Scale")
  testthat::expect_s3_class(scale_warning, "Scale")
  testthat::expect_s3_class(scale_posneg, "Scale")
})