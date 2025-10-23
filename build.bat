@echo off
REM Build script for deploy4j-docker-droplet
REM This script builds the Docker image

set IMAGE_NAME=deploy4j-docker-droplet
set IMAGE_TAG=latest

echo Building Docker image: %IMAGE_NAME%:%IMAGE_TAG%
docker build -t %IMAGE_NAME%:%IMAGE_TAG% .

if %errorlevel% equ 0 (
    echo Build successful!
    echo Image: %IMAGE_NAME%:%IMAGE_TAG%
) else (
    echo Build failed!
    exit /b 1
)
