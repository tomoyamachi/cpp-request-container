FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app
RUN apt-get update \
  && apt-get install --no-install-recommends -y\
    ssh gdb make clang cmake rsync \
    libssl-dev libcurl4-openssl-dev ca-certificates \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN ( \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd \
  && useradd -m clion \
  && yes clion | passwd clion

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]