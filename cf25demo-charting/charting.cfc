component spreadsheet{
    public function ucFirst(required string textstring){ // User defined function for uppercasing the first letter of a string
        uppercasedString = uCase(left(arguments.textstring,1)) & right(arguments.textstring,len(arguments.textstring)-1);
        return uppercasedString;
    }
    public function buildTitleString(required string filename){ // User defined function to take the file name a build a dynamic title
        buildtitlestringtemp = ListDeleteAt(filename, ListLen(filename, "."), ".");
        buildtitlestringtemp = rereplace(buildtitlestringtemp, "_", " ");
        buildtitlestringtemp = listToArray(buildtitlestringtemp, " ");
        buildTitleString = "";
        for (title in buildtitlestringtemp){
            buildTitleString = buildTitleString & ucFirst(title) & " ";
        }
        return buildTitleString;
    }
    public function displayDataFilesForPreview(){ // Look into the data directory and return a select with the files we can preview
         
        filteredResults = directoryList("#request.rootdiskPath#data", true, "query");
        dataitem = "Select a dataset to preview<br /><select name='datafilestopreview' id='datafilestopreview' class='input select' hx-trigger='change' hx-post='previewtextarea.cfm' hx-target='##previewtextarea'>";
        dataitem = dataitem & "<option value=''></option>"
        for (item in filteredResults){ // Here we build the links which will allow you to view the data from each CSV.
            dataItem = dataItem & "<option value='#item.name#'>#item.name#</option>";
        }
        dataitem = dataItem & "</select>";
        writeOutput( dataItem );
        return false;
    }
    public function previewChart(required string csvfile, required string csvtext, required string titlecolor,required string linecolor){ // 
        theFile= getDirectoryFromPath(GetCurrentTemplatePath()) & "data\#csvfile#";
        format = "csvstring"; // Set format type.
        csvwrite(csvtext, format, #theFile#); // write CSV to disk
        titleString = buildTitleString(csvfile);
        try {
            theCSVFile = getDirectoryFromPath(GetCurrentTemplatePath()) & "data\#csvfile#"; // Grab the value of the location of the file
            format = "query"; // Set format type.
            csvObj = csvread(filepath = theCSVFile, outputformat = format); // Read CSV into memory
            QueryMetaDataArray = GetMetaData(csvObj); // Since we don't know the structure, we need the meta data.
            GetQueryColCount = arrayLen(QueryMetaDataArray);
            headerArray=[]; 
            for (row in csvObj){
                if (csvObj.currentRow > 1){ // Test whether we are on the first row (assuming headers are in first record). If not, break loop.
                    break;
                }
                for (colname in QueryMetaDataArray) // Loop through the meta data to get the total number of columns. Use that info to create a header array.
                    {
                        colnameeach = colname.Name; // Grab the column name from the struct
                        colvalue = csvObj[colnameeach][csvObj.currentRow]; // Grab the value in the first row at that column position
                        arrayAppend(headerArray, "#colvalue#"); // Append it to our header array
                    }
            }
            //readconfiguration={ "header"=#headerArray#, "skipHeaderRecord" = 1 } // Set csvformat to header info, ignore header row
            readconfiguration={}
            csvForOutput = csvread(filepath = theCSVFile, outputformat = format, csvformatconfiguration = readconfiguration); // Re-read the CSV, but this time set the headers correctly and ignore the first row
        }
        catch(any e){
            writeDump(e)
        }
        switch(form.charttype){
            case "line":
                generateChart1(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;
                
            case "curvedarea":
                generateChart2(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;

            case "steppedarea":
                generateChart3(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;

            case "ring":
                generateChart4(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;

            case "bar":
                generateChart5(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;
            
            default:
                //generateChart1(titleString,headerArray,csvforoutput,titlecolor,linecolor);
            break;
        }
        
    }
    public function previewtextarea(csvfile){
            theCSVFile = getDirectoryFromPath(GetCurrentTemplatePath()) & "data\#csvfile#"; // Grab the value of the location of the file
            format = "query"; // Set format type.
            csvObj = csvread(filepath = theCSVFile, outputformat = format); // Read CSV into memory
            QueryMetaDataArray = GetMetaData(csvObj); // Since we don't know the structure, we need the meta data.
            GetQueryColCount = arrayLen(QueryMetaDataArray);
            headerArray=[]; 
            for (row in csvObj){
                if (csvObj.currentRow > 1){ // Test whether we are on the first row (assuming headers are in first record). If not, break loop.
                    break;
                }
                for (colname in QueryMetaDataArray) // Loop through the meta data to get the total number of columns. Use that info to create a header array.
                    {
                        colnameeach = colname.Name; // Grab the column name from the struct
                        colvalue = csvObj[colnameeach][csvObj.currentRow]; // Grab the value in the first row at that column position
                        arrayAppend(headerArray, "#colvalue#"); // Append it to our header array
                    }
            }
            //readconfiguration={ "header"=#headerArray#, "skipHeaderRecord" = 1 } // Set csvformat to header info, ignore header row
            readconfiguration={}
            format = "csvstring"; // Set format type.
            csvForOutput = csvread(filepath = theCSVFile, outputformat = format, csvformatconfiguration = readconfiguration);
            writeOutput(csvForOutput);
    }
    public function generateChart1(required string titleString, required array headerArray, required query dataQuery,required string titlecolor, required string linecolor){

        //writeOutput(titleString & "<br />");
        //writeDump(headerArray);
        //writeOutput("<br />");
        //writeDump(dataquery);
        plotarea =  { "margin": "140 150 130 140" }
        legend = { "borderWidth": "0px", "item": {"fontSize": "10px", "fontWeight": "normal"},"layout" : "1x", "margin" = "370 auto auto auto", "marker": { "type": 'circle', "borderWidth": "0px", "size": 8}}
        plot = { 
            "tooltip": { "align": "center", "alpha": "0.75", "borderRadius": "4px", "borderWidth": "0px", "callout": true, "fontSize": "11px", "fontWeight": "normal", "padding": "5 10 10 5" },
            "animation": { "effect": 1, "sequence": 2, "speed": 100 },
            "aspect": "spline",
            "hoverMarker": { "type": "circle", "size": 5, "borderWidth": "1px" },
            "marker": { "type": "circle", "borderWidth": "1px", "size": 5, "backgroundColor": "#form.markercolor#" },
            "valueBox": { "text": '%node-value', "fontWeight": "normal", "fontSize": "10px" },
            "borderWidth": 1,
            "line-color":"#linecolor#"
            //"rules":[ { "rule":"%v<40", "line-color":"red" }, { "rule":"%v>70", "line-color":"orange" }]
        } 
        border = {"color":"##EDEDED","radius":0,"width":2};
        labels = [ { 
            "text": "#titleString#",
            "align": 'left',
            "fontColor": '#titlecolor#',
            "fontSize": '19px',
            "fontWeight": 'bold',
            "width": "100%",
            "padding": '10px',
            "x": "10px",
            "y": "16px"
            } ] 
        tooltip=  {
            "text": ""
        }
        
        cfchart(plot="#plot#", plotarea="#plotarea#", legend="#legend#", labels="#labels#", x="0%", y="0", height="800", width="900", border="#border#", showmarkers="true", xAxisTitle="#headerArray[1]#", yAxisTitle="#headerArray[2]#"){
            cfchartseries(type="#form.charttype#"){
                for (row in dataquery){
                    if(dataquery.currentrow != 1){
                        cfchartdata(item="#dataquery.col_1#", value="#dataquery.col_2#"); 
                    }
                    
                }
                  
                  
            }
        };
    }
    public function generateChart2(required string titleString, required array headerArray, required query dataQuery,required string titlecolor, required string linecolor){

        //writeOutput(titleString & "<br />");
        //writeDump(headerArray);
        //writeOutput("<br />");
        //writeDump(dataquery);
        plotarea =  { "margin": "140 150 130 140" }
        legend = { "borderWidth": "0px", "item": {"fontSize": "10px", "fontWeight": "normal"},"layout" : "1x", "margin" = "auto auto 0 auto", "marker": { "type": 'circle', "borderWidth": "0px", "size": 8}}
        plot = { 
            "tooltip": { "align": "center", "alpha": "0.75", "borderRadius": "4px", "borderWidth": "0px", "callout": true, "fontSize": "11px", "fontWeight": "normal", "padding": "5 10 10 5" },
            "animation": { "effect": 1, "sequence": 2, "speed": 100 },
            "aspect": "spline",
            "hoverMarker": { "type": "circle", "size": 5, "borderWidth": "1px" },
            "marker": { "type": "circle", "borderWidth": "1px", "size": 5},
            "valueBox": { "text": '%node-value', "fontWeight": "normal", "fontSize": "10px" },
            "borderWidth": 1,
            "line-color":"#linecolor#",
            "segmentTrackers": "false",
            "databackgroundcolor":"#linecolor#"
            //"rules":[ { "rule":"%v<40", "line-color":"red" }, { "rule":"%v>70", "line-color":"orange" }]
        } 
        border = {"color":"##EDEDED","radius":0,"width":2};
        labels = [ { 
            "text": "#titleString#",
            "align": 'left',
            "fontColor": '#titlecolor#',
            "fontSize": '19px',
            "fontWeight": 'bold',
            "width": "100%",
            "padding": '10px',
            "x": "10px",
            "y": "16px"
            } ] 
        tooltip=  {
            "text": ""
        }
        
        cfchart(plot="#plot#", plotarea="#plotarea#", legend="#legend#", labels="#labels#", x="0%", y="0", height="800", width="900", border="#border#", showmarkers="true", xAxisTitle="#headerArray[1]#", yAxisTitle="#headerArray[2]#"){
            cfchartseries(type="#form.charttype#", seriesColor="#linecolor#"){
                for (row in dataquery){
                    if(dataquery.currentrow != 1){
                        cfchartdata(item="#dataquery.col_1#", value="#dataquery.col_2#"); 
                    }
                    
                }
                  
                  
            }
        };
    }
    public function generateChart3(required string titleString, required array headerArray, required query dataQuery,required string titlecolor, required string linecolor){

        //writeOutput(titleString & "<br />");
        //writeDump(headerArray);
        //writeOutput("<br />");
        //writeDump(dataquery);
        plotarea =  { "margin": "140 150 130 140" }
        legend = { "borderWidth": "0px", "item": {"fontSize": "10px", "fontWeight": "normal"},"layout" : "1x", "margin" = "auto auto 0 auto", "marker": { "type": 'circle', "borderWidth": "0px", "size": 8}}
        plot = { 
            "tooltip": { "align": "center", "alpha": "0.75", "borderRadius": "4px", "borderWidth": "0px", "callout": true, "fontSize": "11px", "fontWeight": "normal", "padding": "5 10 10 5" },
            "animation": { "effect": 1, "sequence": 2, "speed": 100 },
            
            "hoverMarker": { "type": "circle", "size": 5, "borderWidth": "1px" },
            //"marker": { "type": "circle", "borderWidth": "1px", "size": 3, "backgroundColor": "#form.markercolor#" },
            "valueBox": { "text": '%node-value', "fontWeight": "normal", "fontSize": "10px" },
            "borderWidth": 1,
            "line-color":"#linecolor#",
            "segmentTrackers": "false"
            //"rules":[ { "rule":"%v<40", "line-color":"red" }, { "rule":"%v>70", "line-color":"orange" }]
        } 
        border = {"color":"##EDEDED","radius":0,"width":2};
        labels = [ { 
            "text": "#titleString#",
            "align": 'left',
            "fontColor": '#titlecolor#',
            "fontSize": '19px',
            "fontWeight": 'bold',
            "width": "100%",
            "padding": '10px',
            "x": "10px",
            "y": "16px"
            } ] 
        tooltip=  {
            "text": ""
        }
        
        cfchart(plot="#plot#", plotarea="#plotarea#", legend="#legend#", labels="#labels#", x="0%", y="0", height="800", width="900", border="#border#", showmarkers="true", xAxisTitle="#headerArray[1]#", yAxisTitle="#headerArray[2]#"){
            cfchartseries(type="#form.charttype#", seriesColor="#linecolor#"){
                for (row in dataquery){
                    if(dataquery.currentrow != 1){
                        cfchartdata(item="#dataquery.col_1#", value="#dataquery.col_2#"); 
                    }
                    
                }
                  
                  
            }
        };
    }
    public function generateChart4(required string titleString, required array headerArray, required query dataQuery,required string titlecolor, required string linecolor){

        //writeOutput(titleString & "<br />");
        //writeDump(headerArray);
        //writeOutput("<br />");
        //writeDump(dataquery);
        scaleR={"refAngle":#form.refAngle#,"aperture":#form.aperture#};
        plotarea =  { "margin": "140 150 130 140" }
        legend = { "borderWidth": "0px", "item": {"fontSize": "10px", "fontWeight": "normal"},"layout" : "1x", "margin" = "auto auto 0 auto", "marker": { "type": 'circle', "borderWidth": "0px", "size": 8}}
        plot = { 
            "tooltip": { "align": "center", "alpha": "0.75", "borderRadius": "4px", "borderWidth": "0px", "callout": true, "fontSize": "11px", "fontWeight": "normal", "padding": "5 10 10 5" },
            "animation": { "effect": 1, "sequence": 2, "speed": 100 },
            
            "hoverMarker": { "type": "circle", "size": 5, "borderWidth": "1px" },
            "marker": { "type": "circle", "borderWidth": "1px", "size": 3 },
            "valueBox": { "text": '%node-value', "fontWeight": "normal", "fontSize": "10px" },
            "borderWidth": 1,
            "line-color":"#linecolor#",
            "segmentTrackers": "false"
            //"rules":[ { "rule":"%v<40", "line-color":"red" }, { "rule":"%v>70", "line-color":"orange" }]
        } 
        border = {"color":"##EDEDED","radius":0,"width":2};
        labels = [ { 
            "text": "#titleString#",
            "align": 'left',
            "fontColor": '#titlecolor#',
            "fontSize": '19px',
            "fontWeight": 'bold',
            "width": "100%",
            "padding": '10px',
            "x": "10px",
            "y": "16px"
            } ] 
        tooltip=  {
            "text": ""
        }
        
        cfchart(plot="#plot#", scaleR=#scaleR#, plotarea="#plotarea#", legend="#legend#", labels="#labels#", x="0%", y="0", height="800", width="900", border="#border#", showmarkers="true", xAxisTitle="#headerArray[1]#", yAxisTitle="#headerArray[2]#"){
            cfchartseries(type="#form.charttype#"){
                for (row in dataquery){
                    if(dataquery.currentrow != 1){
                        cfchartdata(item="#dataquery.col_1#", value="#dataquery.col_2#"); 
                    }
                    
                }
                  
                  
            }
        };
    }
     public function generateChart5(required string titleString, required array headerArray, required query dataQuery,required string titlecolor, required string linecolor){

        //writeOutput(titleString & "<br />");
        //writeDump(headerArray);
        //writeOutput("<br />");
        //writeDump(dataquery);
        plotarea =  { "margin": "140 150 130 140" }
        legend = { "borderWidth": "0px", "item": {"fontSize": "10px", "fontWeight": "normal"},"layout" : "1x", "margin" = "auto auto 0 auto", "marker": { "type": 'circle', "borderWidth": "0px", "size": 8}}
        plot = { 
            "tooltip": { "align": "center", "alpha": "0.75", "borderRadius": "4px", "borderWidth": "0px", "callout": true, "fontSize": "11px", "fontWeight": "normal", "padding": "5 10 10 5" },
            "animation": { "effect": 1, "sequence": 2, "speed": 100 },
            
            "hoverMarker": { "type": "circle", "size": 5, "borderWidth": "1px" },
            "marker": { "type": "circle", "borderWidth": "1px", "size": 3 },
            "valueBox": { "text": '%node-value', "fontWeight": "normal", "fontSize": "10px" },
            "borderWidth": 1,
            "line-color":"#linecolor#",
            "segmentTrackers": "false"
            //"rules":[ { "rule":"%v<40", "line-color":"red" }, { "rule":"%v>70", "line-color":"orange" }]
        } 
        border = {"color":"##EDEDED","radius":0,"width":2};
        labels = [ { 
            "text": "#titleString#",
            "align": 'left',
            "fontColor": '#titlecolor#',
            "fontSize": '19px',
            "fontWeight": 'bold',
            "width": "100%",
            "padding": '10px',
            "x": "10px",
            "y": "16px"
            } ] 
        tooltip=  {
            "text": ""
        }
        cfchart(plot="#plot#", plotarea="#plotarea#", legend="#legend#", labels="#labels#", x="0%", y="0", height="800", width="900", border="#border#", showmarkers="true", xAxisTitle="#headerArray[1]#", yAxisTitle="#headerArray[2]#"){
            cfchartseries(type="#form.charttype#", seriesColor="#linecolor#,##000"){
                for (row in dataquery){
                    if(dataquery.currentrow != 1){
                        cfchartdata(item="#dataquery.col_1#", value="#dataquery.col_2#"); 
                    }
                    
                }
                  
                  
            }
        };
    }
}