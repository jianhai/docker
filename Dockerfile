#Pull base image.
FROM ubuntu:latest

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y man vim git cscope make && \
  apt-get install -y tmux net-tools iputils-ping && \
  rm -rf /var/lib/apt/lists/*

# Add files.
 ADD root/.bashrc /root/.bashrc
 ADD root/.vimrc /root/.vimrc
# ADD root/.gitconfig /root/.gitconfig
# ADD root/scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
