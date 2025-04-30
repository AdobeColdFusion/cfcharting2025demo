<h1 class="is-size-2">Chart Playground</h1>
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