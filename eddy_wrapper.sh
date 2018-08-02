#!/bin/bash

COMMAND_LINE=""
PATH=""
LD_LIBRARY_PATH=""
for i in "$@"
do
case $i in
    --imain)
    COMMAND_LINE="$2"
    shift # past argument
    shift
    ;;
    --mask)
    COMMAND_LINE="${COMMAND_LINE} --mask="$2""
    shift # past argument
    shift
    ;;
    --index)
    COMMAND_LINE="${COMMAND_LINE} --index="$2""
    shift # past argument
    shift
    ;;
    --acqp)
    COMMAND_LINE="${COMMAND_LINE} --acqp="$2""
    shift # past argument
    shift
    ;;
    --bvecs)
    COMMAND_LINE="${COMMAND_LINE} --bvecs="$2""
    shift # past argument
    shift
    ;;
    --bvals)
    COMMAND_LINE="${COMMAND_LINE} --bvals="$2""
    shift # past argument
    shift
    ;;
    --fwhm)
    COMMAND_LINE="${COMMAND_LINE} --fwhm="$2""
    shift # past argument
    shift
    ;;
    --topup)
    COMMAND_LINE="${COMMAND_LINE} --topup="$2""
    shift # past argument
    shift
    ;;
    --flm)
    COMMAND_LINE="${COMMAND_LINE} --flm="$2""
    shift # past argument
    shift
    ;;
    --out)
    COMMAND_LINE="${COMMAND_LINE} --out="$2""
    shift # past argument
    shift
    ;;
    -v)
    COMMAND_LINE="${COMMAND_LINE} -v"
    shift # past argument
    ;;
    --data_is_shelled)
    COMMAND_LINE="${COMMAND_LINE} --data_is_shelled"
    shift # past argument
    ;;
  --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    ;;
esac
done

echo "${FSLDIR}"
source ${FSLDIR}/etc/fslconf/fsl.sh
export PATH=/home/shawn.mcin/apps/cuda8.0/bin:/home/shawn.mcin/eddy/host_files/bin:${FSLDIR}/bin:$PATH
export LD_LIBRARY_PATH=/home/shawn.mcin/apps/cuda8.0/lib64:/home/shawn.mcin/eddy/host_files/lib64:$LD_LIBRARY_PATH
echo COMMAND_LINE = "${COMMAND_LINE}"
eddy_cuda8.0 ${COMMAND_LINE}
