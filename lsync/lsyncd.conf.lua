settings {
    logfile    = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd.status",
    inotifyMode = "CloseWrite",
}

sync {
    default.rsync,
    source = "/source",
    target = "/target",
    rsync = {
        archive = true,
        compress = false,
        verbose = true,
        _extra = {"--delete"}
    }
}
