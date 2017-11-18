FROM openshift/base-centos7

MAINTAINER Rob Geada <rgeada@redhat.com>

ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="S2I builder for Neural-Style Training or Evaluation." \
      io.k8s.display-name="Neural-Style" \
      io.openshift.expose-services="8888:http" \
      io.openshift.tags="builder,python,neural-style"

RUN yum install -y epel-release 
RUN yum install -y tree which python-pip \
	&& yum clean all -y
	
RUN pip install tensorflow scipy Pillow


ADD neural-style /opt/app-root/src/neural-style/

#Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root; \
	chmod -R 777 /opt/app-root/src/neural-style;

COPY ./s2i/bin/ /usr/libexec/s2i

# This default user is created in the openshift/base-centos7 image
USER 1001

COPY s2i /opt/app-root/s2i

EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
