library(here)

# Display list of available date stamp folders for whiting
whitingdir_base <- file.path(
    "G:",
    "Shared drives",
    "NMFS NWC FRAM EDC CE (contains MSA Confidential Data)",
    "FISHEyE",
    "data",
    "Whiting"
)

dir(whitingdir_base)

date_stamp <- "2026-06-04"

whitingdir <- file.path(whitingdir_base, date_stamp)

whitingfiles <- list.files(whitingdir)[grepl('RDS', list.files(whitingdir))]

getwd()

try(
    if (length(whitingfiles) == 0) {
        stop("There aren't any files to move in that folder")
    }
)


# copy all of the whiting files from fisheyedataprep output folder to app folder
for (wfiles in whitingfiles) {
    file.copy(
        from = file.path(whitingdir, whitingfiles),
        to = here::here(),
        overwrite = T
    )
}

# copy gdp_defl from the performance metrics app into whiting app
file.copy(
    from = file.path(
        "G:",
        "Shared drives",
        "NMFS NWC FRAM EDC CE (contains MSA Confidential Data)",
        "FISHEyE",
        "data",
        "PerformanceMetrics",
        "2026-04-07",
        "gdp_defl.RData"
    ),
    to = here::here(),
    overwrite = T
)
