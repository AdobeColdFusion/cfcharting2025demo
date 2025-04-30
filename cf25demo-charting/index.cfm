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
    <body hx-get="chartplayground.cfm" hx-target="#main_viewport" hx-trigger="load">
        <button name="btn_chartplayground" id="btn_chartplayground" class="button is-info" hx-get="chartplayground.cfm" hx-target="#main_viewport">Chart Playground</button> 
        <button name="btn_themedemo" id="btn_themedemo" class="button is-danger" hx-get="themedemo.cfm" hx-target="#main_viewport">Theme Demo</button>
        <div class="block"></div>
        <div id="main_viewport"></div>
        
        
        
    </body>
<script src="https://unpkg.com/htmx.org@2.0.0"></script>
<script>
function clearDivContainer(divid){
    document.getElementById(divid).innerHTML = "";
}
</script>
</html>
