<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<!-- head 공통 부분으로 meta 및 css, js 등 사이트 공통 요소를 불러옵니다  -->
<!-- #include file ="inc_headMeta.htm" -->  
<body>
<div id="container"> 
  <!-- #include file ="header.html" -->  	
<!-- <div id="leftbar2"></div> -->
<div id="contents">
    <div id="mainTitbox2">
        <table width="100%">
            <tr>
            <td width="180px"><img src="images/main_img1.gif" alt="TV,PC,Mobile" /></td>
            <td width=""><div id="mainTit"><span class="mainTB">T</span>OTAL <span class="mainTB">A</span>DS <span class="mainTB">R</span>ATING</span></div>
            <div id="main-description">THE MOST TRUSTED FOR CROSS-PLATFORM CAMPAIGN MEASUREMENT</div>
            </td>
            </tr>
        </table>
    </div>
    <div id="mainwrap2">
        <table class="tablestyG1">
            <tr>
            <td width="50%" valign="top">
            <div class="main-graphBox">
                <div class="main-graphBoxT">스크린 이용률</div>
                <div class="main-graphBoxG" id="graph1" style="height:200px"></div>
            </div>
            <div class="main-graphBox">
                <div class="main-graphBoxT">광고 도달률</div>
                <div class="main-graphBoxG" id="graph2" style="height:200px"></div>
            </div>
            <div class="main-graphBox">
                <div class="main-graphBoxT">스크린이용자의 성 구성비</div>
                <div class="main-graphBoxG" id="graph3" style="height:200px"></div>
            </div>
            </td>
            <td width="50%" valign="top">
                <div class="main-graphBox">
                <div class="main-graphBoxT">스크린 총 광고비</div>
                <div class="main-graphBoxG" id="cost_graph" style="height:355px"></div>
            </div> 
            <div class="main-graphBox">
                <div class="main-graphBoxT">스크린이용자의 연령 구성비</div>
                <div class="main-graphBoxG" id="age_graph" style="height:355px"></div>
            </div>    
            </td>
            </tr>
        </table>
        <div id="footer">Copyright © Nielsen Company. All rights reserved. </div>
        </div>
  </div>
</div>
</body>
</html>

<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">

var labelTop = {
    normal : {
        label : {
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom',
                color: '#000000'
            }
        },
        labelLine : {
            show : false
        }
    }
};

var labelTopTV = {
    normal : {
        color: '#00aeef',
        label : {            
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom'
            }
        },
        labelLine : {
            show : false
        }
    }
};

var labelTopPC = {
    normal : {
        color: '#8dc63f',
        label : {            
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom'
            }
        },
        labelLine : {
            show : false
        }
    }
};

var labelTopMO = {
    normal : {
        color: '#ffb100',
        label : {            
            show : true,
            position : 'center',
            formatter : '{b}',
            textStyle: {
                baseline : 'bottom'
            }
        },
        labelLine : {
            show : false
        }
    }
};

var labelTV = {
    normal : {
        label : {
            show : true,
            position : 'center',
            formatter : 'TV',
            textStyle: {
                baseline : 'top',
                color: '#666',
                fontSize: 16
            }
        },
        labelLine : {
            show : false
        }
    }
};
var labelPC = {
    normal : {
        label : {
            show : true,
            position : 'center',
            formatter : 'PC',
            textStyle: {
                baseline : 'top',
                color: '#666',
                fontSize: 16
            }
        },
        labelLine : {
            show : false
        }
    }
};
var labelMo = {
    normal : {
        color: '#FE8463',
        label : {
            show : true,
            position : 'center',
            formatter : 'Mobile',
            textStyle: {
                baseline : 'top',
                color: '#666',
                fontSize: 16
            }
        },
        labelLine : {
            show : false
        }
    }
};
var labelTop2 = {
    normal : {
        color: '#588dd5',
        label : {
            show : false,
            position : 'right',
            formatter : '{c}',
            textStyle: {
                baseline : 'top'
            }
        },
        labelLine : {
            show : false
        }
    }
};
var labelFromatter = {
    normal : {
        label : {
            formatter : function (params){
                return 100 - params.value + '%'
            },
            textStyle: {
                baseline : 'top'
            },
            show: true
        }
    },
}

var labelBottom = {
    normal : {
        color: '#cdcdcd',
        label : {
            show : true,
            position : 'center',
            textStyle:{ fontSize: 16, color: '#00000'}
        },
        labelLine : {
            show : false
        }
    },

};

pieGraph1();
pieGraph2();
pieGraph3();
costGraph();
ageGraph();

    function pieGraph1(){
      require.config({
          paths: { echarts: 'http://echarts.baidu.com/build/dist'}
      });
      require(
          [
              'echarts',
              'echarts/chart/pie' // require the specific chart type
          ],
          function (ec) {
            var myChart = ec.init(document.getElementById('graph1')); 
            
            var option = {
                legend: {
                    data:[ 'TV','PC','Mobile'],                
                },		
                series: [
                {
                    type : 'pie',
                    center : ['20%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:9.1, itemStyle : labelBottom},
                        {name:'TV', value:90.9, itemStyle : labelTopTV}
                    ]
                },
                {
                    type : 'pie',
                    center : ['50%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:24.6, itemStyle : labelBottom},
                        {name:'PC', value:75.4,itemStyle : labelTopPC}
                    ]
                },
                {
                    type : 'pie',
                    center : ['80%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:9.8, itemStyle : labelBottom},
                        {name:'Mobile', value:90.2,itemStyle : labelTopMO}
                    ]
                }
                ]
        };
        
                // Load data into the ECharts instance 
                myChart.setOption(option); 
                $(function () {
                  // Resize chart on menu width change and window resize
                  $(window).on('resize', resize);
                  $(".menu-toggle").on('click', resize);
                  // Resize function
                  function resize() {
                    setTimeout(function() {
                      // Resize chart
                      myChart.resize();
                    }, 200);
                  }
                });
            }
        );
    }

    function pieGraph2(){
      require.config({
          paths: { echarts: 'http://echarts.baidu.com/build/dist'}
      });
      require(
          [
              'echarts',
              'echarts/chart/pie' // require the specific chart type
          ],
          function (ec) {
            var myChart = ec.init(document.getElementById('graph2')); 
            
            var option = {
                    title: {
                        subtext: '',
                        textStyle: {
                            fontSize: 16,
                            color: '#333'
                        },
                        subtextStyle: {
                            fontSize: 14,
                            color: '#333',
                            padding:20
                        },
                        left: 'center'
                    },
                legend: {
                x : '',
                data:[ 'TV','PC','Mobile']
                },		
                series: [
                {
                    type : 'pie',
                    center : ['20%', '50%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:9.1, itemStyle : labelBottom},
                        {name:'TV', value:90.9,itemStyle : labelTopTV}
                    ]
                },
                {
                    type : 'pie',
                    center : ['50%', '50%'],
                    radius: ['45%', '60'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:24.6, itemStyle : labelBottom},
                        {name:'PC', value:75.4,itemStyle : labelTopPC}
                    ]
                },
                {
                    type : 'pie',
                    center : ['80%', '50%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'other', value:9.8, itemStyle : labelBottom},
                        {name:'Mobile', value:90.2,itemStyle : labelTopMO}
                    ]
                }
                ]
        };
        
                // Load data into the ECharts instance 
                myChart.setOption(option); 
                $(function () {
                  // Resize chart on menu width change and window resize
                  $(window).on('resize', resize);
                  $(".menu-toggle").on('click', resize);
                  // Resize function
                  function resize() {
                    setTimeout(function() {
                      // Resize chart
                      myChart.resize();
                    }, 200);
                  }
                });
            }
        );
    }
    
    function pieGraph3(){
      require.config({
          paths: { echarts: 'http://echarts.baidu.com/build/dist'}
      });
      require(
          [
              'echarts',
              'echarts/chart/pie' // require the specific chart type
          ],
          function (ec) {
            var myChart = ec.init(document.getElementById('graph3')); 
            
            var option = {
                tooltip : {
                    show: true,
                    formatter: '{b}: {c}%',
                    trigger: 'item',
                    axisPointer : {            
                        type : 'shadow'        
                    }
                },          
                legend: {
                  x : 'center',
                //   y : 'center',
                  data:['남성', '여성']
                },		
                series: [
                {
                    type : 'pie',
                    center : ['20%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'남성', value:9.1, itemStyle : labelTop2},
                        {name:'여성', value:90.9,itemStyle : labelTV}
                    ]
                },
                {
                    type : 'pie',
                    center : ['50%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'남성', value:24.6, itemStyle : labelTop2},
                        {name:'여성', value:75.4,itemStyle : labelPC}
                    ]
                },
                {
                    type : 'pie',
                    center : ['80%', '60%'],
                    radius: ['45%', '60%'],
                    x: '0%', // for funnel
                    itemStyle : labelFromatter,
                    data : [
                        {name:'남성', value:9.8, itemStyle : labelTop2},
                        {name:'여성', value:90.2,itemStyle : labelMo}
                    ]
                }
                ]
        };
        
                // Load data into the ECharts instance 
                myChart.setOption(option); 
                $(function () {
                  // Resize chart on menu width change and window resize
                  $(window).on('resize', resize);
                  $(".menu-toggle").on('click', resize);
                  // Resize function
                  function resize() {
                    setTimeout(function() {
                      // Resize chart
                      myChart.resize();
                    }, 200);
                  }
                });
            }
        );
    }
    

  // 스크린 광고비 차트
  function costGraph(){
        require.config({
            paths: { echarts: 'http://echarts.baidu.com/build/dist'}
        });
        
        require(
            [
                'echarts',
                'echarts/chart/bar' // require the specific chart type
            ],
            function (ec) {
                // Initialize after dom ready
                var myChart = ec.init(document.getElementById('cost_graph')); 
                var td_title = ['지상파', '케이블', '종편', '디지털동영상'];
                var cost_data = [1534.0, 2695.9, 719.9, 454.2];
                option = {  
                    color: ['#f56c5c'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            
                            type : 'shadow'        
                        }
                    },  
                    calculable : true,
                    xAxis: [
                        {
                            type: 'category',
                            show: true,
                            data: td_title,
                            axisLine:{lineStyle:{color: '#2f2f2f', type:'thin'}}
                        },

                    ],
                    yAxis: [
                        {
                            type: 'value',
                            show: true,
                            name: '억 원',
                            axisLine:{lineStyle:{color: '#2f2f2f', type:'thin'}}
                        }
                    ],
                    series: [
                        {
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: function(params) {
                                        // build a color map as your need.
                                        var colorList = ['#00aeef','#8dc63f','#ffb100','#999b9e'];
                                        return colorList[params.dataIndex]
                                    },
                                    label: {
                                        show: true,
                                        position: 'top',
                                        formatter: '{c}'
                                    }
                                }
                            },
                            data: cost_data,
                            barWidth: 40,
                        }
                    ]
                };                                                
                // Load data into the ECharts instance 
                myChart.setOption(option); 
                $(function () {
                  // Resize chart on menu width change and window resize
                  $(window).on('resize', resize);
                  $(".menu-toggle").on('click', resize);
                  // Resize function
                  function resize() {
                    setTimeout(function() {
                      // Resize chart
                      myChart.resize();
                    }, 200);
                  }
                });                
            }
        );    
    }


    function ageGraph(){
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // use
        require(
            [
                'echarts',
                'echarts/chart/bar' // require the specific chart type
            ],
            function (ec) {
                // Initialize after dom ready
                var myChart = ec.init(document.getElementById('age_graph')); 
                option = {                  
                    tooltip : {
                        trigger: 'item',
                        axisPointer : {           
                            type : 'shadow'       
                        },
                        formatter: '{b} {a}: {c}%',
                    },
                    legend: {
                        data:['10대', '20대', '30대', '40대', '50대', '60대'],
                        x: 'center',
                        y: 'bottom'
                    },                    
                    calculable : true,
                    xAxis : [
                        {
                            type : 'value',
                            axisLine:{show: false},
                        }
                    ],
                    yAxis : [
                        {
                            type : 'category',
                            data : ['Mobile','PC','TV'],
                            axisLine:{lineStyle:{color: '#2f2f2f', type:'thin'}}
                        }
                    ],
                    series : [
                        {
                            name:'10대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#baeaf9', label : {show: true, position: 'insideRight'}}},
                            data:[320, 302, 301]
                        },
                        {
                            name:'20대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#6bd6f7', label : {show: true, position: 'insideRight'}}},
                            data:[120, 132, 101]
                        },
                        {
                            name:'30대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#00aeef', label : {show: true, position: 'insideRight'}}},
                            data:[220, 182, 191]
                        },
                        {
                            name:'40대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#0073c2', label : {show: true, position: 'insideRight'}}},
                            data:[150, 212, 201]
                        },
                        {
                            name:'50대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#00409e', label : {show: true, position: 'insideRight'}}},
                            data:[820, 832, 901]
                        },
                        {
                            name:'60대',
                            type:'bar',
                            stack: '总量',
                            itemStyle : { normal: {color: '#002152', label : {show: true, position: 'insideRight'}}},
                            data:[820, 832, 901]
                        }
                    ]
                };
                    ;                                                
                // Load data into the ECharts instance 
                myChart.setOption(option); 
                $(function () {
                  // Resize chart on menu width change and window resize
                  $(window).on('resize', resize);
                  $(".menu-toggle").on('click', resize);
                  // Resize function
                  function resize() {
                    setTimeout(function() {
                      // Resize chart
                      myChart.resize();
                    }, 200);
                  }
                });                
            }
        );    
    }     

    </script>