<!---<a href="animate.cfm">animate</a><br />
<a href="cfchart-cosmos-dark.cfm">cfchart-cosmos-dark</a><br />
<a href="cfchart-cosmos-light.cfm">cfchart-cosmos-light</a><br />
<a href="cfchart-feast-light.cfm">cfchart-feast-light</a><br />
<a href="cfchart.cfm">cfchart</a><br />
<a href="chartingDataFormatting.cfm">chartingDataFormatting</a><br />
<a href="chartingRules.cfm">chartingRules</a><br />--->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Adobe ColdFusion 2025 - Charting Demo App</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css">
    <style>
        body {
            padding: 30px;
        }
        
        .full-width-scroll {
            width: 100%;
            overflow: scroll;
        }
        .vh100minus150px {
            height: calc(100vh - 150px);
        }
        .textarea {
            width: 100%;
            height: 100px;
        }
        .textareaedit {
            width: 100%;
            height: 250px;
        }
    </style>
</head>
    <body><h1 class="is-size-2">Chart Playground</h1>
        <div id="main" class="columns">
            <div class="column is-3">
                <form hx-target="#previewtextarea">
                <button id="btn_preview" name="btn_preview" class="button is-warning" hx-post="previewcsvaschart.cfm" hx-target="#viewcontainer">PREVIEW DATA AS CHART</button>
                <div class="block"></div>
                Select a chart type to preview
                <select name="charttype" id="charttype" hx-trigger="change" hx-target="#chartoptions" hx-post="options.cfm" class="input select">
                    <option value=""></option>
                    <option value="line">Line</option>
                    <option value="curvedarea">Area(curved)</option>
                    <option value="steppedarea">Area(stepped)</option>
                    <option value="ring">Donut</option>
                    <option value="bar">Bar</option>
                    
                    <option value=""></option>
                </select>
                <div id="chartoptions"></div>
                <div class="block"></div>
                <cfscript>
                    obj = createObject("component","charting"); // Instantiate our component
                    invoke(obj,"displayDataFilesForPreview"); // Display available CSV files for preview
                </cfscript>
                <div class="block"></div>
                <textarea name="previewtextarea" id="previewtextarea" class="input textarea" style="height: 500px"></textarea>
                </form>
            </div>
            <div class="column">
                <div id="viewcontainer" class="full-width-scroll vh100minus150px box"></div>
            </div>
        </div>
        
        
        
    </body>
<script src="https://unpkg.com/htmx.org@2.0.0"></script>
<script>
function clearDivContainer(divid){
    document.getElementById(divid).innerHTML = "";
}
</script>
</html>
