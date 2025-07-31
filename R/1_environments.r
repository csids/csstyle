global <- new.env()
global$location_code_to_factor_label <- "location_name"
global$location_code_to_factor_label_if_not_unique <- "location_name_description_nb"

#' Set global configuration parameters for location code formatting
#' 
#' @description This function sets global parameters that control how location codes are formatted throughout the package.
#' @param location_code_to_factor_label Column name to use for location labels (default: "location_name")
#' @param location_code_to_factor_label_if_not_unique Column name to use when location names are not unique (default: "location_name_description_nb")
#' @returns NULL (invisibly) - function called for side effects
#' @examples
#' # Set global location formatting preferences
#' set_global(
#'   location_code_to_factor_label = "custom_name",
#'   location_code_to_factor_label_if_not_unique = "custom_description"
#' )
#' 
#' # Reset to defaults
#' set_global()
#' @family csstyle_utilities
#' @export
set_global <- function(
    location_code_to_factor_label = "location_name",
    location_code_to_factor_label_if_not_unique = "location_name_description_nb"
){
  global$location_code_to_factor_label <- location_code_to_factor_label
  global$location_code_to_factor_label_if_not_unique <- location_code_to_factor_label_if_not_unique
}

#' Color palette definitions for CSIDS styling
#' 
#' @description A list containing named colors, base colors, and predefined color palettes for consistent visualization styling.
#' @returns List with color definitions including named_colors, base color, and palettes
#' @examples
#' # Access named colors
#' colors$named_colors["H1"]
#' 
#' # View primary palette
#' colors$palettes$primary_3
#' 
#' # See all available palettes
#' names(colors$palettes)
#' @family csstyle_utilities
#' @export
colors <- list()
colors$named_colors <- c(
  "H1" = "#393C61",
  "H2" = "#0975B5",
  "H3" = "#2EA1C0",
  "H4" = "#709900",
  "H5" = "#B11643",
  "H6" = "#FC5F56",
  "H7" = "#F7B500",
  "H8" = "blue",
  "H9" = "green",
  "H10" = "yellow",
  "H11" = "black",
  "H12" = "purple"
)

colors$base <- colors$named_colors["H1"]

colors$palettes <- list()

# primary
colors$palettes$primary_1 <- c(
  colors$named_colors["H1"]
)
colors$palettes$primary_2 <- c(
  colors$palettes$primary_1,
  colors$named_colors["H4"]
)
colors$palettes$primary_3 <- c(
  colors$palettes$primary_2,
  colors$named_colors["H2"]
)
colors$palettes$primary_4 <- c(
  colors$palettes$primary_3,
  colors$named_colors["H6"]
)
colors$palettes$primary_5 <- c(
  colors$palettes$primary_4,
  colors$named_colors["H3"]
)
colors$palettes$primary_6 <- c(
  colors$palettes$primary_5,
  colors$named_colors["H5"]
)
colors$palettes$primary_7 <- c(
  colors$palettes$primary_6,
  colors$named_colors["H7"]
)
colors$palettes$primary_8 <- c(
  colors$palettes$primary_7,
  colors$named_colors["H8"]
)
colors$palettes$primary_9 <- c(
  colors$palettes$primary_8,
  colors$named_colors["H9"]
)
colors$palettes$primary_10 <- c(
  colors$palettes$primary_9,
  colors$named_colors["H10"]
)
colors$palettes$primary_11 <- c(
  colors$palettes$primary_10,
  colors$named_colors["H11"]
)
colors$palettes$primary_12 <- c(
  colors$palettes$primary_11,
  colors$named_colors["H12"]
)

# warning - low medium high
colors$palettes$warning_3 <- c(
  colors$named_colors["H3"],
  colors$named_colors["H7"],
  colors$named_colors["H6"]
)

# posneg - yes-no
colors$palettes$posneg_1 <- c(
  colors$palettes$primary["H6"]
)

colors$palettes$posneg_2 <- c(
  colors$named_colors["H3"],
  colors$named_colors["H6"]
)

colors$palette_names <- c(
  "primary",
  "posneg",
  "warning"
)
