Intex Cloud Q11
===========
Device Tree for LineageOS 14.1
------------------

| Device | Cloud_Q11 |
| ------ | ------ |
| Chipset | MT6580 |
| Kernel | Marshmallow 6.0 (3.18.19+) |
| Display | 5,0" 1280x720 |
| Battery | 2800MAh |
| Storage | 1GB RAM, 8GB storage |
| Camera | 8MP rear / 2MP front |

Clone Command
---
```
git clone https://github.com/aryankaran/android_device_intex_Cloud_Q11.git device/intex/Cloud_Q11 && git clone https://github.com/Evolution-X-Modded-By-Aryan/android_vendor_intex_Cloud_Q11.git vendor/intex/Cloud_Q11
```
Bug	tracker
---------------
- [ ] Video recording interchanged color (workarround: any third party camera, like footej)
- [ ] Sometimes Number of shown cpu cores are 2 or 3 not 4 just a reboot fixes that..
- [ ] Some app glitches are present (app crashes has been fixed, glitches are left)

Compiling on Ubuntu 18.04/20.10
---------------

First add device patches from device tree into Lineage i.e, sepolicy 29 patches
---------------
```
cd device/intex/Cloud_Q11/patches
bash apply-patches.sh
cd ../../../..
```

Build Error neverallow Fix before build
---------------
```
nano system/sepolicy/mediaserver.te
```
and ommit this line present at end of file

neverallowxperm mediaserver domain:{ rawip_socket tcp_socket udp_socket } ioctl priv_sock_ioctls;

Build
---------------
```
. build/envsetup.sh
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 100G
```
```

export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"

./prebuilts/sdk/tools/jack-admin kill-server

./prebuilts/sdk/tools/jack-admin start-server

export LC_ALL=C

brunch Cloud_Q11
```
Jack Fix 
---------------

1. Remove TLSv1, TLSv1.1 from jdk.tls.disabledAlgorithms in /etc/java-8-openjdk/security/java.security file | Its near ends
   ```
   sudo nano /etc/java-8-openjdk/security/java.security
   ```
3. Restart the jack server:
```
cd prebuilts/sdk/tools && ./jack-admin kill-server && ./jack-admin start-server && cd ../../..
```

Result
---------------

Your Lineage OS 14.1 rom is successfully build whohoo

Credits
---------------
* Rock12 ([Github](https://github.com/rock12))
* pedropereira22 ([Github](https://github.com/pedropereira22))
* ibrahim1973 ([Github](https://github.com/ibrahim1973))
* svoboda18 ([Github](https://github.com/svoboda18))
* Andrey Litvin (4PDA)
