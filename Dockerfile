FROM centos:7

RUN yum install -y wget file libpng12 libmng bzip2
COPY fslinstaller.py /tmp/
RUN su -c "python /tmp/fslinstaller.py -D -E -d /usr/local/fsl --fslversion 5.0.11"
