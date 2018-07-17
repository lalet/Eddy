FROM nvidia/cuda:7.5-runtime-centos7

ENV FSLDIR /usr/local/fsl

RUN yum install -y wget file gcc libpng12 libmng bzip2 sudo perl
#COPY fslinstaller.py /tmp/
RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/fslinstaller.py && \
    chmod 755 fslinstaller.py && \
    su -c "python ./fslinstaller.py -D -E -d /usr/local/fsl --fslversion 5.0.11"

RUN rm -rf fslinstaller.py

RUN curl -O https://fsl.fmrib.ox.ac.uk/fsldownloads/patches/eddy-patch-fsl-5.0.11/centos6/eddy_cuda7.5 && \
        chmod 755 eddy_cuda7.5 && \
        mv eddy_cuda7.5 ${FSLDIR}/bin && \
        mv ${FSLDIR}/bin/eddy_cuda ${FSLDIR}/bin/eddy_cuda7.5

ENV PATH "${PATH}:${FSLDIR}/bin"
RUN . ${FSLDIR}/etc/fslconf/fsl.sh
#RUN ${FSLDIR}/etc/fslconf/fslpython_install.sh -f $FSLDIR -q
#RUN curl -L -O http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run && \
 #   chmod 755 cuda_7.5.18_linux.run && \
 #   ./cuda_7.5.18_linux.run --silent --toolkit

#ENV PATH /usr/local/cuda/bin:${PATH}
#ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:${LD_LIBRARY_PATH}


#RUN wget -O cuda_9.2.148_396.37_linux.run https://developer.nvidia.com/compute/cuda/9.2/Prod2/local_installers/cuda_9.2.148_396.37_linux

#RUN sudo sh ./cuda_9.2.148_396.37_linux.run --override
#RUN sudo yum install http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-9.0.176-1.x86_64.rpm
#RUN sudo yum install cuda
#ENV CUDADIR /usr/local/cuda/

#ENV PATH "${PATH}:${CUDADIR}/bin"

