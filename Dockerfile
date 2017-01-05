FROM centos:7

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
#RUN sed -i 's/plugins=1/plugins=0/g' /etc/yum.conf
RUN yum install nodejs -y && yum clean all
RUN yum install supervisor -y && yum clean all
RUN yum install nginx -y && yum clean all
COPY container_files /
COPY . /app/
WORKDIR /app/
RUN npm install --registry=https://registry.npm.taobao.org
EXPOSE 80
VOLUME /app/
CMD ["supervisord", "-n"]
