FROM centos:8


RUN yum -y install vim net-tools nginx wget yum-utils e4fsprogs
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN wget https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.10-3.2.el7.x86_64.rpm
RUN yum -y install /containerd.io-1.2.10-3.2.el7.x86_64.rpm
RUN yum -y install docker-ce docker-ce-cli

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN yum makecache
RUN yum -y update

EXPOSE 80

CMD ["bin/bash"]

# docker run -d --name mycentos3.2 --privileged=true jiangyinzuo/mycentos:3.2 /sbin/init