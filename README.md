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

Add you user name
-----------------
Lets crate user named aryan 

```
sudo adduser aryan && sudo usermod -aG sudo aryan && su aryan
```

On Gitpod Needed If on /workspace space is greater than /
```
sudo su
cd .. && mkdir aryan && rm -rf /home/aryan && ln -s /workspace/aryan /home/aryan && chown -R aryan:aryan /home/aryan && chown -R aryan:aryan /workspace && cd /home/aryan && pwd && chmod 717 /work*/* && exit
cd /home/aryan
```

Change Timezone
----
```
sudo dpkg-reconfigure tzdata
```

Check timezone :
```
cat /etc/timezone
```

Check Date & Time :
```
date
```

Environment Setup
---
```
sudo apt update && cd ~ && sudo apt install git aria2 -y && git clone https://github.com/aryankaran/scripts_build.git scripts && cd scripts && sudo bash setup/android_build_env.sh && cd .. && rm -rf scripts && sudo apt install openjdk-8-jdk -y && sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
```

**And** Important ****
```
sudo nano /etc/java-8-openjdk/security/java.security
```

Clone Command + Patches (screen)
---
Screen
```
cd ~
screen -S los14
```

```
git config --global user.name "Aryan Karan"
git config --global user.email "aryankaran28022004@gmail.com"
git config --global color.ui true
cd ~
mkdir los14 && cd los14
repo init -u git://github.com/LineageOS/android.git -b cm-14.1
repo sync -c -j30 --force-sync --no-clone-bundle --no-tags || repo sync -c -j`expr 2 \* $(nproc --all)` --force-sync --no-clone-bundle --no-tags
git clone https://github.com/aryankaran/android_device_intex_Cloud_Q11.git device/intex/Cloud_Q11 && git clone https://github.com/Evolution-X-Modded-By-Aryan/android_vendor_intex_Cloud_Q11.git vendor/intex/Cloud_Q11
cd device/intex/Cloud_Q11/patches
bash apply-patches.sh
cd ../../../..
```

After this do neverallow sepolicy fix as below :-
i.e.,
```
nano system/sepolicy/mediaserver.te
```

Bug	tracker
---------------
- [ ] Video recording interchanged color (workarround: any third party camera, like footej)
- [ ] Sometimes Number of shown cpu cores are 2 or 3 not 4 just a reboot fixes that..
- [ ] Some app glitches are present (app crashes has been fixed, glitches are left)

Compiling on Ubuntu 18.04/20.04
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

Jack Fix 
---------------

1. Remove TLSv1, TLSv1.1 from jdk.tls.disabledAlgorithms in /etc/java-8-openjdk/security/java.security file | Its near ends
   ```
   sudo nano /etc/java-8-openjdk/security/java.security
   ```
3. Restart the jack server if needed :
   ```
   cd prebuilts/sdk/tools && ./jack-admin kill-server && ./jack-admin start-server && cd ../../..
   ```

Java 8 Fix
---
```
sudo apt install openjdk-8-jdk -y && sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
```
OR
```
sudo apt install openjdk-8-jdk -y && sudo update-alternatives --config java
```

Gitpod java-11 persisting problem change to jdk-8
---
```
   sudo apt install openjdk-8-jdk -y && sudo update-alternatives --config java && cd /usr/lib/jvm && sudo rm -rf default-java java-1.11.0-openjdk-amd64 java-11-openjdk-amd64 .java-1.11.0-openjdk-amd64.jinfo && sudo ln -s java-1.8.0-openjdk-amd64 default-java && cd && sudo rm -rf /home/gitpod/.sdkman/candidates/java/11.0.11.fx-zulu && sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64 /home/gitpod/.sdkman/candidates/java/11.0.11.fx-zulu && java -version && whereis java
```

Build with backed up ccache
---------------
```
. build/envsetup.sh
export USE_CCACHE=1
export CCACHE_DIR=~/ccache
ccache -s
export CCACHE_EXEC=$(which ccache)
ccache -M 100G

export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"

./prebuilts/sdk/tools/jack-admin kill-server

./prebuilts/sdk/tools/jack-admin start-server

export LC_ALL=C

brunch Cloud_Q11
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
