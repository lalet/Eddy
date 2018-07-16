FROM centos:7

RUN yum install -y wget file libpng12 libmng bzip2
COPY fslinstaller.py /tmp/
RUN su -c "python /tmp/fslinstaller.py -D -E -d /usr/local/fsl --fslversion 5.0.11"

RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_cuda7.5 && \
        chmod 755 eddy_cuda7.5 && \
        mv eddy_cuda7.5 ${FSLDIR}/bin && \
        mv ${FSLDIR}/bin/eddy_cuda ${FSLDIR}/bin/eddy_cuda7.5

ENV PATH "${PATH}:${FSLDIR}/bin"
RUN . ${FSLDIR}/etc/fslconf/fsl.sh
RUN ${FSLDIR}/etc/fslconf/fslpython_install.sh -f $FSLDIR -q

