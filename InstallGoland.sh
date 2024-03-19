#!/bin/bash


echo "Select the Go version to download:"
echo "1) 1.18.10"
echo "2) 1.19.13"
echo "3) 1.20.14"
echo "4) 1.21.8"
echo "5) 1.22.1"

# Prompt user for a choice
read -p "Enter choice [1-5]: " choice


# Base URL for downloading
BASE_URL="https://golang.google.cn/dl/"



# Use case statement to set the proper version number
case $choice in
  1)
    VERSION="1.18.10"
    ;;
  2)
    VERSION="1.19.13"
    ;;
  3)
    VERSION="1.20.14"
    ;;
  4)
    VERSION="1.21.8"
    ;;
  5)
    VERSION="1.22.1"
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

# Define filename and URL
FILENAME="go${VERSION}.linux-amd64.tar.gz"
DOWNLOAD_URL="${BASE_URL}${FILENAME}"

# Inform the user about the download
echo "Downloading Go version ${VERSION}..."


# Install wget and unzip if not already installed
yum install wget unzip -y

if [ ! -f "/opt/${FILENAME}" ]; then
    # Download the specified Go package
    wget -O "/opt/${FILENAME}" "${DOWNLOAD_URL}"
    #wget -O /opt/go1.20.3.linux-amd64.tar.gz https://golang.google.cn/dl/go1.20.3.linux-amd64.tar.gz

    # Inform the user download is complete and where it's located
    echo "Download complete! File located at /opt/${FILENAME}"
else
   # File exists, do not download
      echo "The file ${FILENAME} already exists, skipping download."
fi

# 定义安装路径
LOCAL_PATH="/usr/local/"
INSTALL_PATH="/usr/local/go/"
BAK_PATH="/usr/local/tmp/bak"
mkdir -p "${INSTALL_PATH}"
mkdir -p "${BAK_PATH}"

# Check if INSTALL_PATH exists
# 检查INSTALL_PATH下是否存在文件 (使用通配符 *)
if ls "${INSTALL_PATH}"* 1> /dev/null 2>&1; then
    # 存在文件，将它们移动到备份目录
    echo "Moving existing files from ${INSTALL_PATH} to ${BAK_PATH}"
    mv -r "${INSTALL_PATH}"* "${BAK_PATH}"
else
    # 不存在文件
    echo "No files found in ${INSTALL_PATH} to move."
    #Extract packages to a location
    #tar -C /usr/local -xzf /opt/go1.20.3.linux-amd64.tar.gz

fi
sleep 2s
tar -C "${LOCAL_PATH}" -xzf "/opt/${FILENAME}"

##Export Variable path
#/usr/local/go/1.22.1/go/bin
# 配置环境变量
if ! grep -q "${INSTALL_PATH}bin" /etc/profile; then
  echo "export PATH=\$PATH:${INSTALL_PATH}bin" >> /etc/profile
fi
source /etc/profile
##Installation completed.
clear
echo "GoLang has been installed succesfully"
sleep 2s
clear
echo "You must need to logout and login again to complete the Installation"
echo "#####################################################################"
echo "GG GL HF"
echo "###show go env!######################################################"
go env

rm  "/opt/${FILENAME}"

if [ ! -f "/opt/${FILENAME}" ]; then
    echo "File deleted successfully."
else
    echo "Failed to delete the file."
fi