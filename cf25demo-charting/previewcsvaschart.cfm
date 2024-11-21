<cfscript>
    // Pass-through CFM to display the contents of a CSV in table format
    obj = createObject("component","charting"); // Instantiate our component
    invoke(obj,"previewChart",{csvfile = form.datafilestopreview,csvtext = form.previewtextarea,titlecolor = form.titlecolor,linecolor = form.linecolor}); // Invoke the table display and pass in the form field for which file to view
</cfscript>