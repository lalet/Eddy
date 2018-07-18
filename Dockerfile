FROM nvidia/cuda:8.0-runtime-centos7

ENV FSLDIR /usr/local/fsl

RUN yum install -y wget file gcc libpng12 libmng bzip2 sudo perl
#COPY fslinstaller.py /tmp/
RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py && \
    chmod 755 fslinstaller.py && \
    su -c "python ./fslinstaller.py -D -E -d /usr/local/fsl --fslversion 5.0.11"

RUN rm -rf fslinstaller.py

RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_cuda8.0 && \
        chmod 755 eddy_cuda8.0 && \
        mv eddy_cuda8.0 ${FSLDIR}/bin && \
        mv ${FSLDIR}/bin/eddy_cuda ${FSLDIR}/bin/eddy_cuda8.0

ENV PATH "${PATH}:${FSLDIR}/bin"
RUN . ${FSLDIR}/etc/fslconf/fsl.sh

#ENV PATH /usr/local/cuda/bin:${PATH}
#ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:${LD_LIBRARY_PATH}
