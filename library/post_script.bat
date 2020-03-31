@echo off
title post_process script

rem copy c file is there any
rem copy .\manual_wrapper\c\src\*.c  .\generated_wrapper\c\src -- example

rem cd generated_wrapper/eiffel/
rem del /f some_generated_file.e
rem cd ..
rem cd ..


rem copy Makefile script
rem copy Makefile-win.SH  .\generated_wrapper\c\src -- example

cd generated_wrapper/c/src/
finish_freezing -library
