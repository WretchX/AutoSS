### This takes a screenshot every X amount of seconds and puts it in a folder on your desktop. 
### Requires AutoIt installation.
# User Config
Top few lines of the source code

## `Global $quality = 80`
The quality of the JPG screenshot. **1-100**


## `Global $seconds = 10`
How many seconds between each screenshot. **Any integer**


## `Global $folderName = "Project1"`
Folder on desktop screenshots will be saved to. The script will not create this folder if it doesn't exist. **String**


## `Global $tooltipEnable = True`
Whether status tooltip will be shown or not. **True/False**


## `Global $programToActivate = "Adobe Photoshop"`
Title of the window that must be active to take a screenshot. Leave blank ("") to always be true. **String**
