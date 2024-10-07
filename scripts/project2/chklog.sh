#!/bin/bash


#########로그파일 스크립트##########

logfile=/var/log/messages       #모니터링 대상 로그 파일 이름
timeinterver=10                 #비교 시간

tmp1=/tmp/tmp1                  # 첫번째 임시 파일
tmp2=/tmp/tmp2                  # 두번째 임시 파일
tmp3=/tmp/tmp3                  # 새로 추가된 안 좋은 메세지 내용

#초기 임시 파일 생성
egrep -i 'warn|fail|error|crit|alter|emerg' $logfile > $tmp1

# 초기 임시 파일과 새로운 임시 파일 비교
while true
do
    # 비교 시간 차이
    sleep $timeinterver
    # 새로운 임시 파일 생성
    egrep -i 'warn|fail|error|crit|alter|emerg' $logfile > $tmp2

    #초기 임시 파일과 새로운 임시파일 비교 동작
    # * 파일의 내용이 같으면 30초 쉬었다가 다시 비교
    # * 파일의 내용이 다르면 관리자에게 메일 전송
    diff $tmp1 $tmp2 > $tmp3 && continue

    #관리자에게 메일 전송
    mailx -s '[ warn ] 로그 파일 점검 요망' root < $tmp3

    # 로그 파일 다시 초기화
    egrep -i 'warn|fail|error|crit|alter|emerg' $logfile > $tmp1
done