##0.准备数据（最新一次同步的时间）
##1.获取待同步的数据
##2.从第三方获取有价值的数据
##3.计算清洗整合
##4.写人同步结果  -- 同步时间 同步的数据量


main(){
    datetime now = new Date();
    datetime lastTime =  lastSyncTime(table_name);
    List<tables> waitDataList =  getWaitForSyncData(lastTime);
    List<tables> thirdDataList = getThirdData(lastSyncTime,waitDataList);
    int etlCount =  TEL(waitDataList,thirdDataList); --
    updateSyncTime(table_name,now,etlCount)
}


--ruleCal(data,rule);
{
    "s"
    "z"
}

cal(data,rules){
    var results = []
    for(var i=0;i<rules.lenng;i++>{
        var result = ruleCal(data,rules[i])
        results.push(result)
    })
    return results;
}

main(){
    var data = getData(); -- 10w
    var rules = getRules(); --10 rules
    var result = cal(data,rules); 

    [
        {
            rule:rule,
            result:{
                success:true/false,
                error:[{},{},{}],
                right:[{},{},{}],
                rightPercent:80%,
                rightCount:100,
                errorCount:80
            }
        }
    ]
    void record(result)
}