#!/bin/bash
sshpass -p "$SSHPASS" rsync "$@"
