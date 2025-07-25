#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld.git' >> feeds.conf.default
#echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >>feeds.conf.default
echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >>feeds.conf.default
echo 'src-git openclash https://github.com/vernesong/OpenClash.git;dev' >> feeds.conf.default
echo 'src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main' >> feeds.conf.default
#echo 'src-git luci-app-smartdns https://github.com/pymumu/luci-app-smartdns.git;master' >>feeds.conf.default
#echo 'src-git openwrt-smartdns https://github.com/pymumu/openwrt-smartdns.git;master' >>feeds.conf.default

#git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/opasswall-packages
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
#git clone --depth=1 -b dev https://github.com/vernesong/OpenClash package/luci-app-openclash
#git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-nikki package/luci-app-nikki

#git clone --depth=1 https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
#git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

git clone --depth=1 -b js https://github.com/sirpdboy/luci-app-poweroffdevice package/luci-app-poweroffdevice     #关机
git clone --depth=1 -b main https://github.com/lwb1978/openwrt-gecoosac package/openwrt-gecoosac   #集客
git clone --depth=1 -b main https://github.com/sirpdboy/luci-app-netwizard package/luci-app-netwizard   #网络设置向导
git clone --depth=1 -b js https://github.com/sirpdboy/luci-theme-kucat package/luci-theme-kucat
git clone --depth=1 -b main https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth=1 -b main https://github.com/oppen321/luci-app-wolplus package/luci-app-wolplus

WORKINGDIR="`pwd`/feeds/packages/net/smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
rmdir $WORKINGDIR/openwrt-smartdns-master
rm $WORKINGDIR/master.zip

LUCIBRANCH="master" #更换此变量
WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
rm $WORKINGDIR/${LUCIBRANCH}.zip

# 更新 golang 1.25 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang
