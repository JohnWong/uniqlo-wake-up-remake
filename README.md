# uniqlo-wake-up-remake
Make UNIQLO WAKE UP app work again. 
让`UNIQLO WAKE UP`应用重生。

![UNIQLO WAKE UP](http://johnwong.qiniudn.com/IMG_5359.PNG)

[UNIQLO WAKE UP](https://www.appinn.com/uniqlo-wake-up/)是一款非常有意思的闹钟应用。每天早晨用轻柔的音乐和人声唤醒你。几年前用过一段时间，前几天搜了下已经下架，从购买记录里重装回来一直闪退。于是准备用自己的能力来让它重生。

大概的方法就是下载越狱包重签名，运行时修复闪退。修复了字体的闪退后，发现这款应用严重依赖网络。之后一边看反编译的汇编代码，一边运行时调试分析，将网络请求替换成国内的云服务，终于可以运行起来啦。目前只支持国内城市，因为国际城市收费。
