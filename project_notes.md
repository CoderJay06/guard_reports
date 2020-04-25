Goals

-CRUD actions on all reports.
-Keep track of all reports (daily activity sheets, incident reports)
-Users can create accounts, log in, log out.
-User authentication.
-Validate user input.

Models
##User/Guard
##Report

Attributes				
User				Report
-Name				-Type
-Email				-Date
-Phone Number		-Time/Period
-Location			-Location/Zone
-Company			-Description

Associations
User				      Report
-Has Many Reports		-Belongs To a User
