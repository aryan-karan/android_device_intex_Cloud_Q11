Intex Cloud Q11
===========
Device Tree for LineageOS 14.1
------------------

| Device | Cloud_Q11 |
| ------ | ------ |
| Chipset | MT6580 |
| Kernel | Marshmallow 6.0 (3.18.19+) |
| Display | 5,0" 1280x720 |
| Battery | 2200MAh |
| Storage | 1GB RAM, 8GB storage |
| Camera | 8MP rear / 2MP front |

Bug	tracker
---------------
- [ ] Video recording interchanged color (workarround: any third party camera, like footej)
- [ ] Some app glitches are present (app crashes has been fixed, glitches are left)

Compiling on Ubuntu 18.04/20.10
---------------
First add device patches from device tree into Lineage
```
. build/envsetup.sh 

export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"

./prebuilts/sdk/tools/jack-admin kill-server

./prebuilts/sdk/tools/jack-admin start-server

export LC_ALL=C

brunch Cloud_Q11
```
Jack Fix 
---------------

1. Remove TLSv1, TLSv1.1 from jdk.tls.disabledAlgorithms in /etc/java-8-openjdk/security/java.security file
2. Restart the jack server: cd /prebuilts/sdk/tools/ ./jack-admin kill-server ./jack-admin start-server

ccache
---------------
```
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 100G
```

To apply sepolicy 29 patches
---------------
```
cd main_root_dir

bash device/intex/Cloud_Q11/patches/apply-patches.sh
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
