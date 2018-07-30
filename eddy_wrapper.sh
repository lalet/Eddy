#!/bin/bash

COMMAND_LINE=""
PATH=""
LD_LIBRARY_PATH=""
for i in "$@"
do
case $i in
    --imain=*)
    COMMAND_LINE="--imain=${i#*=}"
    shift # past argument
    ;;
    --mask=*)
    COMMAND_LINE="${COMMAND_LINE} --mask=${i#*=}"
    shift # past argument
    ;;
    --index=*)
    COMMAND_LINE="${COMMAND_LINE} --index=${i#*=}"
    shift # past argument
    ;;
    --acqp=*)
    COMMAND_LINE="${COMMAND_LINE} --acqp=${i#*=}"
    shift # past argument
    ;;
    --bvecs=*)
    COMMAND_LINE="${COMMAND_LINE} --bvecs=${i#*=}"
    shift # past argument
    ;;
    --bvals=*)
    BVALS="${i#*=}"
    COMMAND_LINE="${COMMAND_LINE} --bvals=${i#*=}"
    shift # past argument
    ;;
    --fwhm=*)
    COMMAND_LINE="${COMMAND_LINE} --fwhm=${i#*=}"
    shift # past argument
    ;;
    --topup=*)
    COMMAND_LINE="${COMMAND_LINE} --topup=${i#*=}"
    shift # past argument
    ;;
    --flm=*)
    COMMAND_LINE="${COMMAND_LINE} --flm=${i#*=}"
    shift # past argument
    ;;
    --out=*)
    COMMAND_LINE="${COMMAND_LINE} --out=${i#*=}"
    shift # past argument
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
#echo COMMAND_LINE = "${COMMAND_LINE}"
eddy_cuda8.0 ${COMMAND_LINE}
