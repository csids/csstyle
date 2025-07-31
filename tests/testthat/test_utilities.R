context("utility functions")

test_that("set_global function works", {
  # Save original values
  original_label <- global$location_code_to_factor_label
  original_unique <- global$location_code_to_factor_label_if_not_unique
  
  # Test setting new values
  set_global(
    location_code_to_factor_label = "test_label",
    location_code_to_factor_label_if_not_unique = "test_unique"
  )
  
  testthat::expect_equal(global$location_code_to_factor_label, "test_label")
  testthat::expect_equal(global$location_code_to_factor_label_if_not_unique, "test_unique")
  
  # Restore original values
  set_global(
    location_code_to_factor_label = original_label,
    location_code_to_factor_label_if_not_unique = original_unique
  )
})

test_that("every_nth function works", {
  testthat::expect_type(every_nth(2), "closure")
  testthat::expect_type(every_nth(3), "closure")
})

test_that("pretty_breaks function works", {
  testthat::expect_type(pretty_breaks(), "closure")
  testthat::expect_type(pretty_breaks(n = 5), "closure")
})