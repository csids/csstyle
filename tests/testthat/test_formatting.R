context("number formatting")

test_that("format_num_as_nor_num functions work with valid input", {
  testthat::expect_equal(format_num_as_nor_num_0(1234.56), "1235")
  testthat::expect_equal(format_num_as_nor_num_1(1234.56), "1234,6")
  testthat::expect_equal(format_num_as_nor_num_2(1234.56), "1234,56")
})

test_that("format_num_as_nor_num handles NA values", {
  testthat::expect_equal(format_num_as_nor_num_0(NA), "IK")
  testthat::expect_equal(format_num_as_nor_num_1(NA), "IK")
  testthat::expect_equal(format_num_as_nor_num_2(NA), "IK")
})

test_that("format_num_as_nor_perc functions work", {
  testthat::expect_equal(format_num_as_nor_perc_0(12.34), "12 %")
  testthat::expect_equal(format_num_as_nor_perc_1(12.34), "12,3 %")
  testthat::expect_equal(format_num_as_nor_perc_2(12.34), "12,34 %")
})

test_that("format_num_as_nor_perc handles NA values", {
  testthat::expect_equal(format_num_as_nor_perc_0(NA), "IK")
  testthat::expect_equal(format_num_as_nor_perc_1(NA), "IK")
  testthat::expect_equal(format_num_as_nor_perc_2(NA), "IK")
})

test_that("format_num_as_nor_per100k functions work", {
  testthat::expect_equal(format_num_as_nor_per100k_0(123.45), "123 /100k")
  testthat::expect_equal(format_num_as_nor_per100k_1(123.45), "123,5 /100k")
  testthat::expect_equal(format_num_as_nor_per100k_2(123.45), "123,45 /100k")
})

test_that("format_num_as_nor_per100k handles NA values", {
  testthat::expect_equal(format_num_as_nor_per100k_0(NA), "IK")
  testthat::expect_equal(format_num_as_nor_per100k_1(NA), "IK")
  testthat::expect_equal(format_num_as_nor_per100k_2(NA), "IK")
})

test_that("inverse log functions work", {
  testthat::expect_equal(format_num_as_nor_invlog2_1(1), "2,0")  # 2^1 = 2
  testthat::expect_equal(format_num_as_nor_invlog10_1(1), "10,0")  # 10^1 = 10
  testthat::expect_equal(format_num_as_nor_invloge_1(0), "1,0")  # exp(0) = 1
})