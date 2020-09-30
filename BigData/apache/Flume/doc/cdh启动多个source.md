<!--
 * @Author: wjn
 * @Date: 2020-09-16 16:37:25
 * @LastEditors: wjn
 * @LastEditTime: 2020-09-16 16:37:25
-->
You can declare as many sources, channels and sinks as you want:

a1.sources = r1 r2
a1.sinks = k1 k2
a1.channels = c1 c2
And then bind them appropriately:

a1.sources.r1.channels = c1
a1.sources.r2.channels = c2
...
a1.sinks.k1.channel = c1
a1.sinks.k2.channel = c2


https://stackoverflow.com/questions/42785488/how-to-run-multiple-flume-agents-on-a-single-node-with-cloudera-manager