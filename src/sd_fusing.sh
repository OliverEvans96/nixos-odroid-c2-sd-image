#!/bin/sh
#
# Copyright (C) 2015 Hardkernel Co,. Ltd
# Dongjin Kim <tobetter@gmail.com>
#
# Modified for Arch Linux ARM package uboot-odroid-c2-mainline
#
# SPDX-License-Identifier:	GPL-2.0+
#
# https://archlinuxarm.org/packages/aarch64/uboot-odroid-c2-mainline/files/sd_fusing.sh

BL1=bl1.bin.hardkernel
UBOOT=u-boot.gxbb

if [ -z $1 ]; then
        echo "Usage ./sd_fusing.sh <SD card reader's device>"
        exit 1
fi

if [ ! -f $BL1 ]; then
        echo "error: $BL1 does not exist"
        exit 1
fi

if [ ! -f $UBOOT ]; then
        echo "error: $UBOOT does not exist"
        exit 1
fi

# NOTE: This originally said `conv=fsync`,
# but conv=notrunc is necessary when `of`
# points to a file, not a block device.
dd if=$BL1 of=$1 conv=notrunc bs=1 count=442
dd if=$BL1 of=$1 conv=notrunc bs=512 skip=1 seek=1
dd if=$UBOOT of=$1 conv=notrunc bs=512 seek=97

sync

echo Finished.
