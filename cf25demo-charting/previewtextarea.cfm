<cfscript>
    // Pass-through CFM to display the contents of a CSV in table format
    obj = createObject("component","charting"); // Instantiate our component
    invoke(obj,"previewtextarea",{csvfile = form.datafilestopreview,titlecolor = form.titlecolor}); // Invoke the table display and pass in the form field for which file to view
</cfscript>