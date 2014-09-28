FROM ubuntu:14.04
MAINTAINER David Morton <davidlmorton@gmail.com>
WORKDIR /root
RUN echo 'America/Chicago' | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get update && apt-get install -y git vim
RUN mkdir git_repos && cd git_repos && git clone https://github.com/davidlmorton/development-environment.git
RUN git_repos/development-environment/install
CMD ["/bin/bash"]
