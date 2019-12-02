# UBUNTU18.04 + WINDOWS 10 双系统安装
[参考](https://blog.csdn.net/zhujinchong/article/details/80954911)
## 安装WINDOWS 10
## 压缩存储空间
使用磁盘管理压缩存储空间，本次压缩了50G。

右键单击显示为GPT分区（UEFI启动）还是MBR分区（LEGENCY启动），如显示`转换为MBR分区`，则为GPT分区。

## 制作启动盘
下载镜像并使用RUFUS制作启动盘。

## U盘启动安装
* 关闭WINDOWS快速启动。
* 如果电脑支持UEFI，选择UEFI U盘启动。
* 试用UBUNTU。
* 安装。
* UBUNTU与WINDOWS BOOT MANAGER 共存。
* 在BIOS中设置启动项顺序为UBUNTU第一。

## 安装后配置
### 设置时间
```bash
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc
```
修复安装后Windows时间错误问题。

