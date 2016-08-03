@echo off
REM THIS IS A GENERATED FILE: PLEASE DO NOT EDIT
REM Post Build processing for IAR Workbench.
SET TARGET_BPATH=%1%
SET PROJECT_DIR=%2%
echo " "
echo "This converts an IAR .out to Ember Bootload File format if a bootloader has been selected in AppBuilder"
echo " "
@echo on
cmd /C ""ielftool.exe" "%TARGET_BPATH%.out" --srec --srec-s3only "%TARGET_BPATH%.s37" > "%TARGET_BPATH%-ielftool-output.txt""
@echo off
type "%TARGET_BPATH%-ielftool-output.txt"
@echo on
cmd /C ""%ISA3_UTILS_DIR%\em3xx_convert.exe" --chip efr32  "%TARGET_BPATH%.s37" "%TARGET_BPATH%.ebl" > "%TARGET_BPATH%-em3xx-convert-output.txt""
@echo off
type "%TARGET_BPATH%-em3xx-convert-output.txt"

echo " "
echo "This creates a ZigBee OTA file if the "OTA Client Policy Plugin" has been enabled."
echo "It uses the parameters defined there.  "
echo " "
@echo on
cmd /C "@echo Image-builder not invoked since 'OTA Bootload Cluster Policy plugin' is not enabled" > "%TARGET_BPATH%-image-builder-output.txt"
@echo off
type "%TARGET_BPATH%-image-builder-output.txt"
