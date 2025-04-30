<cfscript>

    plot = {
        "tooltip": {
        "align": "center",
        "alpha": "0.75",
       // "backgroundColor": "##000",
        "borderRadius": "4px",
        "borderWidth": "0px",
        "callout": true
       // "fontColor": "##fff",
       // "fontSize": "11px",
       // "fontWeight": "bold",
       // "padding": "5 10 10 5"
        },
        "valueBox": {
          "decimals": 0,
          //"fontColor": "##D83B01",
          "fontSize": "11px",
          "fontWeight": "normal",
          "placement": "out"
          },
        "animation": {
        "effect": 3,
        "method": 0,
        "speed": 300,
        "sequence": 1
          },
        "borderWidth": 1,
        "detach": false,
        "slice": '60%'
  }

  plotarea =  {
    "margin": "35 240 0 0 "
  }

  scaleR =  {
    "aperture": "180",
    "refAngle": "180"
  }

  labels = [
    {
      "borderBottom": "1px solid ##EDEDED",
      "width": "100%",
      "x": "5px",
      "y": "38px"
    },
        {
          "text": '2021<br>Overview',
          "align": 'center',
          //"fontColor": '##485463',
          "fontSize": '28px',
          "fontWeight": 'bold',
          "padding": '0px',
          "x": '10px',
          "y": '100px'
        },
        {
          "text": 'Percent celebrating',
          "align": 'center',
          //"fontColor": '##646E7A',
          "fontSize": '12px',
          "fontWeight": 'bold',
          "x": '220px',
          "y": '180px'
        },
        {
          "text": '$86.27',
          "align": 'center',
          //"fontColor": '##3cc1cf',
          "fontSize": '36px',
          "fontWeight": 'bold',
          "x": '430px',
          "y": '100px'
        },
        {
          "text": 'Average expected spending',
          "align": 'center',
          //"fontColor": '##646E7A',
          "fontSize": '12px',
          "fontWeight": 'bold',
          "x": '405px',
          "y": '150px'
        },
        {
          "text": '$8.8B',
          "align": 'center',
          //"fontColor": '##3cc1cf',
          "fontSize": '36px',
          "fontWeight": 'bold',
          "x": '630px',
          "y": '100px'
        },
        {
          "text": 'Total expected spending',
          "align": 'center',
          //"fontColor": '##646E7A',
          "fontSize": '12px',
          "fontWeight": 'bold',
          "x": '610px',
          "y": '150px'
        }

/*    {
      "text": "2021<br>Overview",
      "align": "center",
      //"fontColor": "##485463",
      "fontSize": "28px",
      "fontWeight": "bold",
      "padding": "0px",
      "x": "90px",
      "y": "85px"
    },
    {
      "text": "Percent celebrating",
      "align": "center",
    //  "fontColor": "##646E7A",
      "fontSize": "12px",
      "fontWeight": "bold",
      "x": "290px",
      "y": "140px"
    },
    {
      "text": "$86.27",
      "align": "center",
    //  "fontColor": "##3cc1cf",
      "fontSize": "36px",
      "fontWeight": "bold",
      "x": "500px",
      "y": "90px"
    },
    {
      "text": "Average expected spending",
      "align": "center",
    //  "fontColor": "##646E7A",
      "fontSize": "12px",
      "fontWeight": "bold",
      "x": "480px",
      "y": "140px"
    }
   /* {
      "text": "$8.8B",
      "align": "center",
    //  "fontColor": "##3cc1cf",
      "fontSize": "36px",
      "fontWeight": "bold",
      "x": "670px",
      "y": "100px"
    },
    {
      "text": "Total expected spending",
      "align": "center",
    //  "fontColor": "##646E7A",
      "fontSize": "12px",
      "fontWeight": "bold",
      "x": "650px",
      "y": "150px"
    }*/
  ]

  tooltip= {
       // "text": "<span style='font-size:16px;color:##999999;'>\u25CF</span> %t %node-value%"
        "text": "<span style='font-size:16px;'>\u25CF</span> %t %node-value%"
      }

plotarea2 = 
    {
        "margin": "40 50 30 40"
    }
    
    legend2 = {
        //"backgroundColor": "none",
        "borderWidth": "0px",
        "item": {
       // "color": "##464646",
        "fontSize": "10px",
        "fontWeight": "normal"
    },
    "layout" : "1x",
    "margin" = "370 auto auto auto",
    "marker": {
      "type": 'circle',
      "borderWidth": "0px",
      "size": 8
    }
   //"paddingTop":'15'
   //"align": 'center'
  }

  plot2 = {
    "tooltip": {
      "align": "center",
      "alpha": "0.75",
     // "backgroundColor": "##000",
      "borderRadius": "4px",
      "borderWidth": "0px",
      "callout": true,
     // "fontColor": "##fff",
      "fontSize": "11px",
      "fontWeight": "normal",
      "padding": "5 10 10 5"
    },
    "animation": {
      "effect": 1,
      "sequence": 2,
      "speed": 100
    },
    "aspect": "spline",
    "hoverMarker": {
      "type": "circle",
      "size": 5,
      //"backgroundColor": "##FFF",
      "borderWidth": "1px"
      //"borderColor": "##3CC1CF"
    },
    "marker": {
      "type": "circle",
      "borderWidth": "1px",
      //"borderColor": "##3CC1CF",
      "size": 3
      //"backgroundColor": "##3CC1CF"
    },
    "valueBox": {
      "text": '$%node-value',
      "fontWeight": "normal",
      "fontSize": "10px"
    },
    "borderWidth": 1,
    "rules":[
      {
        "rule":"%v<40",
        "line-color":"red"
      },
      {
        "rule":"%v>70",
        "line-color":"orange"
      }]
  }

  border2 = {"color":"##EDEDED","radius":0,"width":2};

  labels2 = [
    {
      "text": "Historical Halloween spending and celebration plans (2007 - 2021)",
      "align": 'left',
      "fontColor": '##464646',
      "fontSize": '13px',
      "fontStyle": 'italic',
      "fontWeight": 'normal',
      "width": "100%",
      "padding": '0px',
      "x": "0px",
      "y": "6px"
    } 
  ] 

tooltip2= 
  {
       // "text": "<span style='font-size:16px;color:##3CC1CF;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
    "text": "<span style='font-size:16px;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
  }

plotarea3 = 
    {
        "margin": "50 50 30 40"
    }
    
legend3 = {
      //backgroundColor: 'none',
      "borderWidth": '0px',
      "item": {
          //color: '#464646',
          "fontSize": '10px',
          "fontWeight": 'normal'
      },
        "layout": "1x",
        "margin": '400 auto 0 auto',
        "marker": {
          "type": 'circle',
          "size": 8,
          "borderWidth": '0px'
        }
}


/*legend2 = {
  //"backgroundColor": "none",
  "borderWidth": "0px",
  "item": {
  // "color": "##464646",
  "fontSize": "10px",
  "fontWeight": "normal"
  },
    "layout" : "1x",
    "margin" = "300 auto auto auto",
    "marker": {
      "type": 'circle',
      "borderWidth": "0px",
      "size": 8
    }
  }
*/


plot3 = {
        "tooltip": {
          "align": 'center',
          "alpha": 0.75,
          "backgroundColor": '##000',
          "borderRadius": '4px',
          "borderWidth": '0px',
          "callout": true,
          "fontColor": '##fff',
          "fontSize": '11px',
          "fontWeight": 'normal',
          "padding": '5 10 10 5'
        },
        "valueBox": {
          "text": '%node-value%',
          "fontColor": '##464646',
          "fontSize": '10px',
          "fontWeight": 'normal'
        },
        "animation": {
          "effect": 1,
          "sequence": 2,
          "speed": 100
        },
        "aspect": 'spline',
        "hoverMarker": {
          "type": 'circle',
          "backgroundColor": '##FFF',
          "borderWidth": '1px',
          "size": 5
        },
        "marker": {
          "type": 'circle',
          "borderWidth": '0px',
          "size": 4
        }
  }

/*
  labels3 = 
  [{
      "text": 'Percent spending',
      "align": 'center',
      "borderLeft": '2px solid ##E5E5E5',
      "borderRight": '2px solid ##E5E5E5',
      "borderTop": '2px solid ##E5E5E5',
      "fontColor": '##464646',
      "fontSize": '12px',
      "fontWeight": 'normal',
      "id": 'lb3a',
      "padding": '6px',
      "width": '250px',
      "x": '20px',
      "y": '68px'
    }
  ]
  */

  tooltip3_a= {
       // "text": "<span style='font-size:16px;color:##3CC1CF;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
        "text": "<span style='font-size:16px;'>\u25CF</span><b>Costumes</b><br> %scale-key-value: $%node-value"
      }

  tooltip3_b= {
       // "text": "<span style='font-size:16px;color:##3CC1CF;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
        "text": "<span style='font-size:16px;'>\u25CF</span><b>Candy</b><br> %scale-key-value: $%node-value"
      }

  tooltip3_c= {
       // "text": "<span style='font-size:16px;color:##3CC1CF;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
        "text": "<span style='font-size:16px;'>\u25CF</span><b>Decorations</b><br> %scale-key-value: $%node-value"
      }

  tooltip3_d= {
       // "text": "<span style='font-size:16px;color:##3CC1CF;'>\u25CF</span><b>Per person expected Halloween spending</b><br> %scale-key-value: $%node-value"
        "text": "<span style='font-size:16px;'>\u25CF</span><b>Greeting Cards</b><br> %scale-key-value: $%node-value"
    }

  plotarea4 = 
    {
        "margin": "110 5 10 15"
    }

  plot4 = {
        "tooltip": {
          "align": 'center',
          "alpha": 0.75,
          "backgroundColor": '##000',
          "borderRadius": '4px',
          "borderWidth": '0px',
          "callout": true,
          "fontColor": '##fff',
          "fontSize": '11px',
          "fontWeight": 'normal',
          "padding": '5 10 10 5'
        },
        "valueBox": {
          "fontSize": '11px',
          "fontWeight": 'normal',
          "placement": 'bottom'
        },
        "animation": {
          "effect": 3,
          "sequence": 1,
          "speed": 200
        }
    }
    
    labels4 = {
          "borderBottom":'1px solid ##EDEDED',
          "width": '100%',
          "x": '5px',
          "y": '45px',
          "text": 'Gender',
          "align": 'center',
          "borderLeft": '2px solid ##E5E5E5',
          "borderRight": '2px solid ##E5E5E5',
          "borderTop": '2px solid ##E5E5E5',
          "fontColor": '##464646',
          "fontSize": '12px',
          "fontWeight": 'normal',
          "id": 'lb4a',
          "padding": '8px'
    }


    plotarea9_a = {
        margin: '100 10 10 40'
    }
    
    legend9_a = {
        //"backgroundColor": "none",
        "borderWidth": "0px",
        "item": {
       // "color": "##464646",
        "fontSize": "10px",
        "fontWeight": "normal"
    },
    "layout" : "float",
    "margin" = "390 auto 0 auto",
    "marker": {
      "type": 'circle',
      "borderWidth": "0px",
      "size": 8
    }
   //"paddingTop":'15'
   //"align": 'center'
  }

  plot9_a = {
    "tooltip": {
      "align": "center",
      "alpha": "0.75",
     // "backgroundColor": "##000",
      "borderRadius": "4px",
      "borderWidth": "0px",
      "callout": true,
     // "fontColor": "##fff",
      "fontSize": "11px",
      "fontWeight": "normal",
      "padding": "5 10 10 5"
    },
    valueBox: {
      "text": '%node-value%',
      "angle": 270,
      "fontColor": '##464646',
      "fontSize": '9px',
      "fontWeight": 'normal',
      "placement": 'top-out'
    },
    "animation": {
      "effect": 4,
      "sequence": 1,
      "speed": 100
    },
    "barsSpaceLeft": 0.15,
    "barsSpaceRight": 0.15
  }

  border9_a = {"color":"##EDEDED","radius":0,"width":2}

tooltip9_a= 
  {
     "text": '<span style="font-size:16px;color:##3CC1CF;">\u25CF</span><b>All: %node-value%</b><br>%scale-key-value'
  }

labels9_a = [
{
  "text": "2021: Where do consumers look for Halloween inspiration",
  "align": 'left',
  "fontColor": '##464646',
  "fontSize": '13px',
  "fontStyle": 'italic',
  "fontWeight": 'normal',
  "width": "100%",
  "padding": '0px',
  "x": "0px",
  "y": "3px"
  } 
] 

plot8 = {
  tooltip: {
    "align": 'center',
    "alpha": 0.75,
    "backgroundColor": '##000',
    "borderRadius": '4px',
    "borderWidth": '0px',
    "callout": true,
    "fontColor": '##fff',
    "fontSize": '11px',
    "fontWeight": 'normal',
    "padding": '5 10 10 5'
  },
    "valueBox": {
      "fontSize": 11,
      "fontWeight": 'normal',
      "placement": 'bottom'
    },
      "animation": {
      "effect": 3,
      "sequence": 1,
      "speed": 100
    }  
}

plotarea8 = {
    "margin": '0 40 10 40'
}



tooltip8_1 = {
      "text": '<span style="font-size:16px;color:##FBAE44;">\u25CF</span><b>Retail store or costume shop</b><br> %node-size-value%'
}

tooltip8_2 = {
      "text": '<span style="font-size:16px;color:##FBAE44;">\u25CF</span><b>Retail store or costume shop</b><br> %node-size-value%'
}

tooltip8_3 = {
      "text": '<span style="font-size:16px;color:##485463;">\u25CF</span><b>Friends/Family</b><br> %node-size-value%'
}

tooltip8_4 = {
      "text": '<span style="font-size:16px;color:##EF413C">\u25CF</span><b>Pinterest</b><br> %node-size-value%'
}

tooltip8_5 = 
{
      "text": '<span style="font-size:16px;color:##999999">\u25CF</span><b>Facebook</b><br> %node-size-value%'
}


markers =
{
  "yaxis" = [{"type" = "line", "range" = [30],
  "lineColor"= "red","lineWidth"= 2,"lineStyle"="solid","alpha"="0.8","label"= {
  "text"= "Value = 30"}}
  //{"type" = "area", "range" = [20, 60],"valueRange"= "true","backgroundColor"= "red"} 
  ]
}


</cfscript>





<!---
<cfchartset format="html" height="4800" width="1600" theme="adobe_cosmos_light.json"> 
--->

 <cfchartset format="html" height="4800" width="1600" theme="adobe_cosmos_dark.json">
    <cfchart  type="ring" labels="#labels#" plot="#plot#" plotarea="#plotarea#" scaleR = "#scaleR#" x="0%" y="0%" height="280" title="Historical Spending" showLegend="false" border="#border2#">
        <cfchartseries  tooltip="#tooltip#" >
            <cfchartdata item="Yes" value="68" >
            <cfchartdata item="No" value="32" >
        </cfchartseries>
        
    </cfchart>
    <cfchart type="line"  plot="#plot2#" plotarea="#plotarea2#" legend="#legend2#" labels="#labels2#" x="0%" y="280" height="400" border="#border2#" markers="#markers#" showmarkers="true">
            <cfchartseries  label="Per person expected Halloween spending"  tooltip="#tooltip2#">
                <cfchartdata  item="1" value="28.48" >
                <cfchartdata  item="2" value="59.06" >
                <cfchartdata  item="3" value="64.82" >
                <cfchartdata  item="4" value="66.82" >
                <cfchartdata  item="5" value="72.31" >
                <cfchartdata  item="6" value="79.82" >
                <cfchartdata  item="7" value="75.03" >
                <cfchartdata  item="8" value="77.52" >
                <cfchartdata  item="9" value="74.34" >
                <cfchartdata  item="10" value="82.93" >
                <cfchartdata  item="11" value="86.13" >
                <cfchartdata  item="12" value="86.79" >
                <cfchartdata  item="13" value="86.27" >
            </cfchartseries>
    </cfchart>

  <cfchart type="line" plot="#plot3#" plotarea="#plotarea3#" legend="#legend3#" x="0" y="680" height="450" title="Historical: Purchasing Plans" border="#border2#">
        <cfchartseries serieslabel="Costumes"  tooltip="#tooltip3_a#">
            <cfchartdata  item="2007" value="95" >
            <cfchartdata  item="2008" value="96" >
            <cfchartdata  item="2009" value="95" >
            <cfchartdata  item="2010" value="96" >
            <cfchartdata  item="2011" value="94" >
            <cfchartdata  item="2012" value="96" >
            <cfchartdata  item="2013" value="96" >
            <cfchartdata  item="2014" value="96" >
            <cfchartdata  item="2015" value="96" >
            <cfchartdata  item="2016" value="95" >
            <cfchartdata  item="2017" value="94" >
            <cfchartdata  item="2018" value="94" >
            <cfchartdata  item="2019" value="95" >
            <cfchartdata  item="2020" value="95" >
            <cfchartdata  item="2021" value="95" >
        </cfchartseries>
        <cfchartseries serieslabel="Candy"  tooltip="#tooltip3_b#">
            <cfchartdata  item="2007" value="60" >
            <cfchartdata  item="2008" value="67" >
            <cfchartdata  item="2009" value="61" >
            <cfchartdata  item="2010" value="68" >
            <cfchartdata  item="2011" value="62" >
            <cfchartdata  item="2012" value="68" >
            <cfchartdata  item="2013" value="69" >
            <cfchartdata  item="2014" value="73" >
            <cfchartdata  item="2015" value="70" >
            <cfchartdata  item="2016" value="69" >
            <cfchartdata  item="2017" value="67" >
            <cfchartdata  item="2018" value="70" >
            <cfchartdata  item="2019" value="72" >
            <cfchartdata  item="2020" value="74" >
            <cfchartdata  item="2021" value="72" >
        </cfchartseries>
        <cfchartseries serieslabel="Decorations"  tooltip="#tooltip3_c#">
            <cfchartdata  item="2007" value="53" >
            <cfchartdata  item="2008" value="60" >
            <cfchartdata  item="2009" value="61" >
            <cfchartdata  item="2010" value="62" >
            <cfchartdata  item="2011" value="59" >
            <cfchartdata  item="2012" value="62" >
            <cfchartdata  item="2013" value="65" >
            <cfchartdata  item="2014" value="66" >
            <cfchartdata  item="2015" value="70" >
            <cfchartdata  item="2016" value="67" >
            <cfchartdata  item="2017" value="64" >
            <cfchartdata  item="2018" value="67" >
            <cfchartdata  item="2019" value="69" >
            <cfchartdata  item="2020" value="68" >
            <cfchartdata  item="2021" value="67" >
        </cfchartseries>
        <cfchartseries type="line" serieslabel="Greeting Cards"  tooltip="#tooltip3_d#">
            <cfchartdata  item="2007" value="24" >
            <cfchartdata  item="2008" value="30" >
            <cfchartdata  item="2009" value="33" >
            <cfchartdata  item="2010" value="32" >
            <cfchartdata  item="2011" value="30" >
            <cfchartdata  item="2012" value="33" >
            <cfchartdata  item="2013" value="39" >
            <cfchartdata  item="2014" value="41" >
            <cfchartdata  item="2015" value="36" >
            <cfchartdata  item="2016" value="36" >
            <cfchartdata  item="2017" value="34" >
            <cfchartdata  item="2018" value="35" >
            <cfchartdata  item="2019" value="37" >
            <cfchartdata  item="2020" value="35" >
            <cfchartdata  item="2021" value="34" >        
        </cfchartseries>
    </cfchart>


    <cfchart type="bubble" plot="#plot8#" plotarea="#plotarea8#" x="0" y="1130" height="200">
        <cfchartseries  label="Online Search" tooltip="#tooltip3_d#">
            <cfchartdata  item="1" value="0" zvalue="35">
          </cfchartseries>
        <cfchartseries  label="Retail Store or Costume Shop" tooltip="#tooltip3_d#">   <!---tooltip="#tooltip8_1#">--->
            <cfchartdata  item="2" value="0" zvalue="28">
        </cfchartseries>
        <cfchartseries  label="Friends / Family" tooltip="#tooltip3_d#">   <!---tooltip="#tooltip8_1#">--->
            <cfchartdata  item="3" value="0" zvalue="35">
        </cfchartseries>
        <cfchartseries  label="Pinterest" tooltip="#tooltip3_d#">   <!---tooltip="#tooltip8_1#">--->
            <cfchartdata  item="4" value="0" zvalue="18">
        </cfchartseries>
        <cfchartseries  label="Facebook" tooltip="#tooltip3_d#">   <!---tooltip="#tooltip8_1#">--->
            <cfchartdata  item="5" value="0" zvalue="16">
        </cfchartseries>
    </cfchart>


    <cfchart type="bar"  plot="#plot9_a#" plotarea="#plotarea9_a#" legend="#legend9_a#" labels="#labels9_a#" x="0" y="1330" height="400" border="#border9_a#">
            <cfchartseries  label="Men"  tooltip="#tooltip2#">
                <cfchartdata  item="1" value="12" >
                <cfchartdata  item="2" value="35" >
                <cfchartdata  item="3" value="27" >
                <cfchartdata  item="4" value="21" >
                <cfchartdata  item="5" value="18" >
                <cfchartdata  item="6" value="8" >
                <cfchartdata  item="7" value="19" >
                <cfchartdata  item="8" value="15" >
                <cfchartdata  item="9" value="12" >
                <cfchartdata  item="10" value="9" >
                <cfchartdata  item="11" value="19" >
                <cfchartdata  item="12" value="4" >
                <cfchartdata  item="13" value="6" >
                <cfchartdata  item="14" value="3" >
                <cfchartdata  item="15" value="26" >
            </cfchartseries>
            <cfchartseries  label="Women"  tooltip="#tooltip2#">
                <cfchartdata  item="1" value="11" >
                <cfchartdata  item="2" value="35" >
                <cfchartdata  item="3" value="30" >
                <cfchartdata  item="4" value="18" >
                <cfchartdata  item="5" value="14" >
                <cfchartdata  item="6" value="6" >
                <cfchartdata  item="7" value="14" >
                <cfchartdata  item="8" value="14" >
                <cfchartdata  item="9" value="25" >
                <cfchartdata  item="10" value="3" >
                <cfchartdata  item="11" value="10" >
                <cfchartdata  item="12" value="3" >
                <cfchartdata  item="13" value="6" >
                <cfchartdata  item="14" value="3" >
                <cfchartdata  item="15" value="28" >
            </cfchartseries>
    </cfchart>

</cfchartset>
