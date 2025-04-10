#!/bin/bash

experiment_idx=2
model="rethinkmcts"
data=1

# dataset settings
if [ $data -eq 1 ]; then
    dataset="humaneval"
    APPDifficulty="introductory"
elif [ $data -eq 2 ]; then
    dataset="apps"
    APPDifficulty="introductory"
elif [ $data -eq 3 ]; then
    dataset="apps"
    APPDifficulty="interview"
elif [ $data -eq 4 ]; then
    dataset="apps"
    APPDifficulty="competition"
else
    echo "Invalid data option."
    exit 1
fi

message="run_${model}_${dataset}_${APPDifficulty}"

echo ${message} start!

# python ../ours/src/utils/send_email_utils.py -m "${message} start!" > ${message}.log 2>&1
python -u run.py -eid ${experiment_idx} -m ${model} -d ${dataset} --APPDifficulty ${APPDifficulty} >> ${message}.log 2>&1
# python ../ours/src/utils/send_email_utils.py -m "${message} done!" >> ${message}.log 2>&1