
## required packages
pkgs <- c(
  "tidyverse",
  "gbm",
  "keras",
  "kerasformula",
  "remotes",
  "rtweet",
  "rvest",
  "tidytext",
  "tidyverse",
  "quanteda"
)

## version numbers
pkg_versions <- lapply(pkgs, packageVersion)
names(pkg_versions) <- pkgs

## installed packages
ip <- installed.packages()

## validation functions
is_installed <- function(pkg) {
  pkg %in% ip
}
is_updated <- function(pkg, version) {
  packageVersion(pkg) >= version
}
is_current <- function(pkg, version) {
  if (!is_installed(pkg) || !is_updated(pkg, version)) {
    if (identical(pkg, "textfeatures")) {
      remotes::install_github("mkearney/textfeatures", dependencies = TRUE)
    } else {
      install.packages(pkg, dependencies = TRUE)
    }
  } else {
    message("{", pkg, "} is already installed!")
  }
}
are_current <- function(pkgs, versions) {
  for (i in seq_along(pkgs)) {
    is_current(pkgs[i], versions[[i]])
  }
}

## package versions
pkg_versions <- list(
  tidyverse = package_version('1.2.1'),
  gbm = package_version('2.1.4'),
  keras = package_version('2.2.0'),
  kerasformula = package_version('1.5.1'),
  remotes = package_version('2.0.0'),
  rtweet = package_version('0.6.8'),
  rvest = package_version('0.3.2'),
  tidytext = package_version('0.1.9'),
  tidyverse = package_version('1.2.1'),
  quanteda = package_version('1.3.4'))

## check/install packages
are_current(pkgs, pkg_versions)
