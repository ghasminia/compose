settings {
    logfile    = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd.status",
    inotifyMode = "CloseWrite",
}

sync {
    default.rsyncssh,
    source = "/source",
    host = "root@your_ip",
    targetdir = "/backups/server-131/duplicati",
    rsync = {
        archive = true,
        compress = false,
        verbose = true,
        binary = "/usr/bin/sshpass",
        _extra = {"-p", "password", "rsync", "-e", "ssh -p 22", "--delete"}

    }
}
