var dataMap = {};

function dataFormatter(obj) {
    var pList = ['司法极严重','司法较严重','司法一般严重','行为罚极严重','行为罚较严重','行为罚一般严重','财产极严重','财产较严重','财产一般严重'];
    var temp;
    var max = 0;
    for (var year = 2011; year <= 2015; year++) {
        temp = obj[year];
        for (var i = 0, l = temp.length; i < l; i++) {
            max = Math.max(max, temp[i]);
            obj[year][i] = {
                name : pList[i],
                value : temp[i]
            }
        }
        obj[year+'max'] = Math.floor(max/100) * 100;
    }
    return obj;
}

function dataFormatter1(obj) {
    var pList = ['司法','行为罚','财产/声誉'];
    var temp;
    var max = 0;
    for (var year = 2011; year <= 2015; year++) {
        temp = obj[year];
        for (var i = 0, l = temp.length; i < l; i++) {
            max = Math.max(max, temp[i]);
            obj[year][i] = {
                name : pList[i],
                value : temp[i]
            }
        }
        obj[year+'max'] = Math.floor(max/100) * 100;
    }
    return obj;
}

function dataMix(list) {
    var mixData = {};
    for (var i = 0, l = list.length; i < l; i++) {
        for (var key in list[i]) {
            if (list[i][key] instanceof Array) {
                mixData[key] = mixData[key] || [];
                for (var j = 0, k = list[i][key].length; j < k; j++) {
                    mixData[key][j] = mixData[key][j] 
                                      || {name : list[i][key][j].name, value : []};
                    mixData[key][j].value.push(list[i][key][j].value);
                }
            }
        }
    }
    return mixData;
}



dataMap.dataGDP_Estate = dataMix([dataMap.dataEstate, dataMap.dataGDP]);

dataMap.data1Red = dataFormatter({
	2011:[1,97,0,309,0,196,368,149,763],
	2012:[10,122,0,203,28,250,385,148,1388],
	2013:[85,104,1,70,19,117,179,92,365],
	2014:[1,306,57,52,0,42,81,23,85],
	2015:[1,277,3,44,0,21,64,17,52]
});

dataMap.data1RedSum = dataFormatter1({
	2011:[98,505,1280],
	2012:[132,481,1921],
	2013:[190,206,636],
	2014:[364,94,189],
	2015:[281,65,133]
});



