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

# ./android_pigeons.sh -i debug
#
#
input=""
name=""
out=""
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
name="${name}Channel"

flutter pub run pigeon \
  --dart_null_safety \
  --input pigeons/$input.dart \
  --dart_out lib/channel/$out.dart \
  --java_out ../zykjappclient-android/app/src/main/java/com/histudio/app/flutter/$name.java \
  --java_package "com.histudio.app.flutter"
