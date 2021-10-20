#!/bin/bash
#flutter pub run pigeon \
#  --dart_null_safety \
#  --input pigeons/route_api.dart \
#  --dart_out lib/channel/route_channel.dart \
#  --java_out ../app/src/main/java/com/histudio/app/flutter/RouteChannel.java \
#  --java_package "com.histudio.app.flutter"
# -o如果没有就生成 route_api_channel.dart 的文件
#-i (--input)  -o (--dart_out)  -n (java的名字)
# .ios_pigons.sh -i route_api -o route_channel -n RouteChannel
#
#
#
input=""
name=""
out=""
orginname=""
while getopts ":n:i:o:" opt
do
    case $opt in
        n)
        name=$OPTARG
        ;;
        i)
        input=$OPTARG
        ;;
        o)
        out=$OPTARG
        ;;
        ?)
            echo "未知参数$opt"
            echo "参数值$OPTARG"
        ;;
    esac
done

PARA=$input


if [ "$out" == "" ];then
out="${input}_channel"
fi


#将下划线改成驼峰命名
arr=(`echo $PARA | tr '_' ' '`)
result=''
for var in ${arr[@]}
do
     firstLetter=`echo ${var:0:1} | awk '{print toupper($0)}'`
     otherLetter=${var:1}
     result=$result$firstLetter$otherLetter
done

firstResult=$(echo ${result:0:1} | tr '[A-Z]' '[a-z]')
result=$firstResult${result:1}

#首字母大写
result="$(tr '[:lower:]' '[:upper:]' <<< ${result:0:1})${result:1}"
name=${result}
orginname=${name}
name="${name}Channel"

ochname="../zykjoeappstudentpad/ZykjOeAppStudentPad/Flutter/Channel/$name.h"
ocmname="../zykjoeappstudentpad/ZykjOeAppStudentPad/Flutter/Channel/$name.m"
flutter pub run pigeon \
  --dart_null_safety \
  --input pigeons/$input.dart \
  --dart_out lib/channel/$out.dart \
  --objc_header_out $ochname \
  --objc_source_out $ocmname \
  --java_package "com.histudio.app.flutter"

deledate="${name}Deledate"
deledatePathh="../zykjoeappstudentpad/ZykjOeAppStudentPad/Flutter/ChannelDeledate/${deledate}.h"
deledatePathm="../zykjoeappstudentpad/ZykjOeAppStudentPad/Flutter/ChannelDeledate/${deledate}.m"

if [ ! -f ${deledatePathh} ]; then
 rm -f ${deledatePathh}
rm -f ${deledatePathm}
deledatePathhc='
//
\n////  ChannelDeledate.h
\n//  ZykjOeAppStudentPad
\n//
//  Created by DeerClass on 2021/4/20.
\n//  Copyright © 2021 zykj. All rights reserved.
\n//
\n
\n
\n#import "ChannelDeledate.h"
\n#import "'${name}'.h"
\n
\n@interface '${deledate}' : ChannelDeledate <'${orginname}'HostApi>
\n
\n@end'

deledatePathmc='
//
\n////  ChannelDeledate.m
\n//  ZykjOeAppStudentPad
\n//
//  Created by DeerClass on 2021/4/20.
\n//  Copyright © 2021 zykj. All rights reserved.
\n//
\n
\n
\n#import "'${deledate}'.h"
\n#import "ChannelResponse.h"
\n
\n@interface '${deledate}' ()
\n
\n@end
\n
\n@implementation '${deledate}'
\n
\n@end'

echo -e ${deledatePathhc}>>${deledatePathh}
echo -e ${deledatePathmc}>>${deledatePathm}
fi

#删除
ochLine=`sed -n "/@interface FChannelResponse : NSObject/=" ${ochname}`
if [ ! -z "$ochLine" ]; then
let ochLine2=ochLine+2
ochlinecmd="${ochLine},${ochLine2}d"
 sed -i "" "$ochlinecmd" $ochname

ocmLine=`sed -n "/@interface FChannelResponse ()/=" ${ocmname}`
let ocmLine2=ocmLine+17
ocmlinecmd="${ocmLine},${ocmLine2}d"
 sed -i "" "$ocmlinecmd" $ocmname

fi
