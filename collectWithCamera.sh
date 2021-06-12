#!/bin/bash

SD_PATH=/jetson-inference/python/training/detection/ssd
DATA_PATH=${SD_PATH}/data

CONFIRM="F"

collectTags(){
   LABEL_FILE="${DATA_PATH}/labels.txt"
   if [ -f ${LABEL_FILE} ]; then
      rm ${LABEL_FILE}
   fi
   echo "What tags do you want to use? Enter 'done' when finished"
   read TAG
   while [[ "$TAG" != "done" ]]; do
      echo $TAG >> ${LABEL_FILE}
      echo "Next Tag: "
      read TAG
   done
}
verify(){
    echo ""
    echo "TAGS"
    echo "-----------"
    cat $LABEL_FILE
    echo "-----------"
    echo "Tags ok? [y/n]"
    read CHECK
    if [[ "$CHECK" == 'y' ]]; then
       CONFIRM="T" 
    fi
}

while [[ $CONFIRM != "T" ]]; do
   collectTags
   verify
done


camera-capture /dev/video0
