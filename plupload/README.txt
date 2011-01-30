/* $Id: README.txt,v 1.3.2.2 2010/09/14 20:47:04 greggles Exp $ */

-- SUMMARY --

The Plupload Integration module provides a browser-based widget to allow users with the appropriate permissions to upload images and create nodes in one fell swoop.

Plupload is a GPL licensed multiple file uploading tool that can present widgets in Flash, Gears, HTML 5, Silverlight, BrowserPlus, and HTML4 depending on the capabilities of the client computer.

-- INSTALLATION --

1. Extract the module into sites/all/modules/
2. Dowload the Plupload library from http://www.plupload.com/
3. Extract the libary into sites/all/modules/plupload/ (it will look like sites/all/modules/plupload/plupload)
4. Assign user permissions appropriately  /admin/user/permissions
5. Configure target import field at the path on the config page: /admin/settings/plupload-bulk
6. Browse to the path /file-plupload
7. Add Files using the web interface. (Or even drag-and-drop files onto the widget)
8. Click Start Upload
9. Wait, the Plupload widget is working its magic.
10. You've made nodes.  Hooray!

-- CONFIGURATION --

Users with the 'administer plupload bulk uploads' permission can set the target content type and imagefield for the module at /admin/user/permissions

