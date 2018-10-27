#!/bin/sh

ssh 131.94.133.216 "rm -rf /tileservice/run/*"
scp -r ./* liangdong@131.94.133.216:/tileservice/run


