bash -c "ant exejar"
taskkill /F /IM javaw.exe
javaw -jar dist\weka.jar