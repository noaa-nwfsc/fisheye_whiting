library(here)

# Display list of available date stamp folders for whiting
dir(
    "G:/Shared drives/NMFS NWC FRAM EDC CE (contains MSA Confidential Data)/FISHEyE/data/Whiting"
)
whitingdir <- "G:/Shared drives/NMFS NWC FRAM EDC CE (contains MSA Confidential Data)/FISHEyE/data/Whiting/2026-03-27"
whitingfiles <- list.files(whitingdir)[grepl('RDS', list.files(whitingdir))]

file.path(whitingdir, whitingfiles)

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
        "G:/Shared drives/NMFS NWC FRAM EDC CE (contains MSA Confidential Data)/FISHEyE/data/PerformanceMetrics/2026-03-31/gdp_defl.RData"
    ),
    to = here::here(),
    overwrite = T
)
