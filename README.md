## Institute Website
Simple Institute Website

## Requirements
* Microsoft released Visual Studio 2010

## Database File Setting
1. Go to "Server Explorer".
2. Under "Data Connections" Heading right click on database file ".mdf" and click on properties.
3. Copy the Connection String.
4. Now open web.config file.
5. Look for "appSettings" tag in web.config file and paste the new Connection String under Value attribute.
6. Save the webconfig file.

## Mail Setting
1. Open web.config file.
2. Look for "mailSettings" tag.
3. Change the Email address and password.
