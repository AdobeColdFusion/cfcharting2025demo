<cfscript>
optionLinecolor = '<div class="block"></div>Line color (hex)<input type="color" name="linecolor" id="linecolor" class="input" />';
optionHiddenLinecolor = '<input type="hidden" name="linecolor" id="linecolor" class="input" value="##000000" />';
optionMarkercolor = '<div class="block"></div>Marker color (hex)<input type="color" name="markercolor" id="markercolor" class="input" />';
optionHiddenMarkercolor = '<input type="hidden" name="markercolor" id="markercolor" value="" />';

optionTitlecolor = '<div class="block"></div>Title color (hex)<input type="color" name="titlecolor" id="titlecolor" class="input"  />';
optionRefangle = '<div class="block"></div>Ref Angle (donut chart only) [<span id="refangleval">0</span>]<input type="range" min="0" max="360" value="0" name="refangle" id="refangle" class="input"  />'
optionApertureangle = '<div class="block"></div>Aperture Angle (donut chart only) [<span id="apertureval">360</span>]<input type="range" name="aperture" min="0" max="360" value="360" id="aperture" class="input"  />'
switch (form.charttype){
    case "line":
        writeOutput(optionLinecolor);
        writeOutput(optionMarkercolor);
        writeOutput(optionTitlecolor);
    break;

    case "curvedarea":
        writeOutput(optionLinecolor);
        writeOutput(optionTitlecolor);
    break;

    case "steppedarea":
        writeOutput(optionLinecolor);
        writeOutput(optionTitlecolor);
    break;

    case "ring":
        writeOutput(optionHiddenLinecolor);
        writeOutput(optionRefangle);
        writeOutput(optionApertureangle);
        writeOutput(optionTitlecolor);
    break;

    case "bar":
        writeOutput(optionLinecolor);
        writeOutput(optionTitlecolor);
    break;

    default:

    break;
}

</cfscript>


<script>
    var apertureslider = document.getElementById("aperture");
    var apertureoutput = document.getElementById("apertureval");
    apertureoutput.innerHTML = apertureslider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    apertureslider.oninput = function() {
    apertureoutput.innerHTML = this.value;
    }
    var refangleslider = document.getElementById("refangle");
    var refangleoutput = document.getElementById("refangleval");
    refangleoutput.innerHTML = refangleslider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    refangleslider.oninput = function() {
    refangleoutput.innerHTML = this.value;
    }
</script>