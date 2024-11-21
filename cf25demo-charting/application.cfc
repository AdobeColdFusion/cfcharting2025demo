
component {
	this.name = "acf25chartingdemo";
    this.sessionManagement = true;
    this.SessionTimeout = CreateTimeSpan( 0, 0, 90, 0 );
    this.scriptProtect="none";
    function onApplicationStart(){
        // Instantiation state on first application load
    }
    function onSessionStart(){
        // Instantiation state on first session load
        
    }
    function onRequestStart(){
        // Instantiation state on first request load
        // Set root paths to match environment
        request.rootdiskPath = "C:\CFNextAlpha\cfusion\wwwroot\cf25demo-charting\";
        request.rootappPath = "/cf25demo-charting/";
        request.datadiskpath = "\data\"
    }
}