context("journal number formatting")

test_that("format_num_as_journal_num functions work with valid input", {
  testthat::expect_equal(format_num_as_journal_num_0(1234.56), "1,235")
  testthat::expect_equal(format_num_as_journal_num_1(1234.56), "1,234.6")
  testthat::expect_equal(format_num_as_journal_num_2(1234.56), "1,234.56")
})

test_that("format_num_as_journal_num handles NA values", {
  testthat::expect_equal(format_num_as_journal_num_0(NA), "NA")
  testthat::expect_equal(format_num_as_journal_num_1(NA), "NA")
  testthat::expect_equal(format_num_as_journal_num_2(NA), "NA")
})

test_that("format_num_as_journal_perc functions work", {
  testthat::expect_equal(format_num_as_journal_perc_0(12.34), "12%")
  testthat::expect_equal(format_num_as_journal_perc_1(12.34), "12.3%")
  testthat::expect_equal(format_num_as_journal_perc_2(12.34), "12.34%")
})

test_that("format_num_as_journal_perc handles NA values", {
  testthat::expect_equal(format_num_as_journal_perc_0(NA), "NA")
  testthat::expect_equal(format_num_as_journal_perc_1(NA), "NA")
  testthat::expect_equal(format_num_as_journal_perc_2(NA), "NA")
})

test_that("format_num_as_journal_per100k functions work", {
  testthat::expect_equal(format_num_as_journal_per100k_0(123.45), "123/100k")
  testthat::expect_equal(format_num_as_journal_per100k_1(123.45), "123.5/100k")
  testthat::expect_equal(format_num_as_journal_per100k_2(123.45), "123.45/100k")
})

test_that("format_num_as_journal_per100k handles NA values", {
  testthat::expect_equal(format_num_as_journal_per100k_0(NA), "NA")
  testthat::expect_equal(format_num_as_journal_per100k_1(NA), "NA")
  testthat::expect_equal(format_num_as_journal_per100k_2(NA), "NA")
})

test_that("journal inverse log functions work", {
  testthat::expect_equal(format_num_as_journal_invlog2_1(1), "2.0")  # 2^1 = 2
  testthat::expect_equal(format_num_as_journal_invlog10_1(1), "10.0")  # 10^1 = 10
  testthat::expect_equal(format_num_as_journal_invloge_1(0), "1.0")  # exp(0) = 1
})

test_that("journal vs norwegian formatting differences", {
  x <- c(1234.56, NA)
  
  # Number formatting differences
  testthat::expect_equal(format_num_as_nor_num_1(x), c("1234,6", "IK"))
  testthat::expect_equal(format_num_as_journal_num_1(x), c("1,234.6", "NA"))
  
  # Percentage formatting differences  
  testthat::expect_equal(format_num_as_nor_perc_1(12.34), "12,3 %")
  testthat::expect_equal(format_num_as_journal_perc_1(12.34), "12.3%")
})

context("journal date formatting")

test_that("journal date formatting functions work", {
  test_date <- as.Date("2023-12-25")
  test_datetime <- as.POSIXct("2023-12-25 14:30:00")
  
  testthat::expect_equal(format_date_as_journal(test_date), "2023-12-25")
  testthat::expect_equal(format_datetime_as_journal(test_datetime), "2023-12-25 14:30:00")
  testthat::expect_equal(format_datetime_as_journal_file(test_datetime), "2023_12_25_143000")
})

test_that("journal vs norwegian date formatting differences", {
  test_date <- as.Date("2023-12-25")
  
  # Date formatting differences
  testthat::expect_equal(format_date_as_nor(test_date), "25.12.2023")
  testthat::expect_equal(format_date_as_journal(test_date), "2023-12-25")
})