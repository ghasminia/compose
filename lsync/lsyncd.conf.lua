settings {
    logfile    = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd.status",
    inotifyMode = "CloseWrite",
}

sync {
    default.rsyncssh,
    source = "/source",
    host = "root@192.168.128.132",
    targetdir = "/backups/server-131/duplicati/",
    rsync = {
        binary = "/usr/local/bin/rsync_with_sshpass.sh",
        archive = true,
        compress = false,
        verbose = true,
        _extra = {"-e", "ssh -o StrictHostKeyChecking=no -p 22", "--delete"}
    }
}
