Goals

-CRUD actions on all reports.
-Keep track of all reports (daily activity sheets, incident reports)
-Users can create accounts, log in, log out.
-User authentication.
-Validate user input.

Stretch Goals

-CSS for the visual aspect
-Build a join model
-Add date scheduling feature

Models
##User/Guard
##Report

Attributes				
Guard				Report
-Name				-Type
-Email			-Date
-Phone Number	-Time/Period
-Location		-Location/Zone
-Company			-Description
-password      -Guard ID

Associations
Guard				      Report
-Has Many Reports		-Belongs To a Guard
