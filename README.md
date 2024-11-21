Demo application assets for CF25 beta launch.

To run this, do the following:

- Download files to your cfusion director for CF25 in a folder named cf25demo-spreadsheet.
- In that folder, create two more folders: "data" and "tempdata". Those will hold your CSVs.
- In the application.cfc, make sure that the rootdiskPath, rootappPath, and datadiskpath all match your environment.
- You can now put as many CSV files as you'd like in the "data" folder and the app will allow you to view, edit, and search them using the new CF25 features. You can also create a new CSV.

Notes:

- There seems to be a bug where sometimes the CSVs are overwriting each other. I'm uncertain as to why and have not been able to track down the logic error.
- I would love to add more options/charting types (and eventually themes) here
