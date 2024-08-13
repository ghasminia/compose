FROM ubuntu:22.04

RUN apt-get update && apt-get install -y lftp inotify-tools && apt-get clean

COPY sync.sh /sync.sh

RUN chmod +x /sync.sh

# Run the script
CMD ["/sync.sh"]
