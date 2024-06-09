
#---------------------------------------------------#
# The configuration file needs to be placed in $HOME/.config/clash/config.yml
# Or run config.yml in the directory
#---------------------------------------------------#
# Mixed port HTTP and SOCKS5 use one port
mixed-port: 7890

# HTTP proxy port
# port: 7890

# SOCKS5 proxy port
socks-port: 7891

# redir proxy port for Linux and macOS (uncomment if you want to use this feature)
# run-port: 7892

# Allow LAN connections (can be used to share proxies)
allow-lan: true

# Only applies if allow-lan is set to true
# #"*": bind all IP addresses
# #192.168.122.11: Bind a single IPv4 address
# #"[aaaa::a8aa:ff:fe09:57d8]": Bind a single IPv6 address
bind-address: "*"
ipv6: true

# Rule mode: rule (rule) / global (global proxy) / direct (global direct connection) / script (script)
mode: rule

# Set the log output level (default level: silent, which means no output to avoid program memory overflow due to excessive log content).
# 5 levels: silent / error / warning / info / debug. The higher the level, the larger the log output, and the more inclined to debugging. Please enable it if necessary.
log-level: info


# Clash 的 RESTful API
external-controller: '127.0.0.1:9090'

# You can place static web resources (such as clash-dashboard) in a directory, and clash will serve `RESTful API/ui`
# The parameter should be filled in with the relative path or absolute path of the configuration directory.
# http://127.0.0.1:9090/ui/#/
# external-ui: folder
# yacd panel: https://github.com/haishanh/yacd
# Razord panel: http://clash.razord.top/#/proxies
# external-ui: dashboard

# RESTful API password (optional)
# secret: ""

# Experimental Features
experimental:
  ignore-resolve-fail: true # Ignore DNS resolution failure, the default value is true
  # interface-name: en0 # outbound interface name

# Local SOCKS5 / HTTP(S) service authentication
# authentication:
#  - "user1:pass1"
#  - "user2:pass2"

# Experimental feature hosts, supports wildcards (such as *.clash.dev or even *.foo.*.example.com)
# Static domain names have higher priority than wildcard domain names (foo.example.com takes precedence over *.example.com)
# Note: hosts does not work in fake-ip mode
#hosts:
#   '*.clash.dev': 127.0.0.1
#   'alpha.clash.dev': '::1'

dns:
  enabled: true
  ipv6: true
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip # Mode: redir-host or fake-ip
  fake-ip-range: 198.18.0.1/16 #
  fake-ip-filter: # fake ip whitelist, if you don't know the function of this parameter, please do not modify it
     - '*.and'
     - localhost.ptlogin2.qq.com
  nameserver:
    - 119.29.29.29
    - 223.5.5.5
    - https://dns.google/dns-query
    - https://dns.cloudflare.com/dns-query	
  fallback:
    - 8.8.8.8
    - 8.8.4.4
    - 1.1.1.1
    - tls://1.0.0.1:853
    - tls://dns.google:853

#dns:
  #enable: true # Whether to enable dns false
  #ipv6: false
  #listen: 0.0.0.0:53
  #enhanced-mode: redir-host # Mode: redir-host or fake-ip
  #fake-ip-range: 198.18.0.1/16 #
  #fake-ip-filter: # fake ip whitelist, if you don't know the function of this parameter, please do not modify it
     #- '*.and'
     #- localhost.ptlogin2.qq.com
  #nameserver:
     #- 223.5.5.5 # Alibaba DNS
     #- 180.76.76.76 # Baidu DNS
     #- 119.29.29.29 # Tencent DNS
     #- 117.50.11.11 # ONE DNS interception version malicious website interception, advertising filtering
     #- 117.50.10.10 # ONE DNS pure version directly returns its real response result
     #- 114.114.114.114 # 114DNS
     #- https://dns.alidns.com/dns-query # Ali DoH DNS
     #- https://doh.360.cn/dns-query # 360 DoH DNS
  #fallback:
     #- 8.8.8.8 # Google DNS
     #- 1.1.1.1 # Cloudflare DNS
     #- tls://dns.rubyfish.cn:853
     #- tls://1.0.0.1:853
     #- tls://dns.google:853
     #- https://dns.rubyfish.cn/dns-query
     #- https://cloudflare-dns.com/dns-query
     #- https://dns.google/dns-query
  #fallback-filter:
     #geoip: true # default
     #ipcidr: #IP addresses in this network segment will be considered polluted IPs
       #- 240.0.0.0/4

# 1. Clash DNS request logic:
# (1) When accessing a domain name, nameserver concurrently requests all servers in the fallback list to obtain the IP address corresponding to the domain name.
# (2) clash will select the fastest resolution result in the nameserver list.
# (3) If the IP address in the resolution result belongs to a foreign country, then clash will select the fastest resolution result in the fallback list.
#
# Therefore, I placed pollution-free, fast-resolution domestic DNS servers in both nameserver and fallback to achieve the fastest resolution speed.
# However, the servers in the fallback list will be used to resolve overseas websites. In order to ensure that the results are absolutely uncontaminated, I only retained two servers that support DoT/DoH.
#
# 2. Notes on clash DNS configuration:
# (1) If you want to ensure that the DNS resolution results are not polluted, please only keep the DNS servers starting with tls:// or https:// in the list, but this is usually not necessary for domestic domain names.
# (2) If you do not care about the possibility of parsing polluted results and prefer speed, please insert the servers in the nameserver list into the fallback list and remove duplicates.
#
# 3. About the choice of DNS over HTTPS (DoH) and DNS over TLS (DoT):
# Both sides have their own opinions on the two technologies, and there will be endless debates, each has its own advantages and disadvantages. Please choose according to your specific needs, but DoT is enabled by default in the configuration file because there is no blockade or regulation in China at present.
# DoH: DNS servers starting with https://. It has better disguise and is almost impossible to be blocked by operators or network management, but the query efficiency and security may be slightly lower.
# DoT: DNS server starting with tls://. It has higher security and query efficiency, but the port may be controlled or blocked.
# To learn more about DoH/DoT related technologies, please refer to the specification document.

# Proxy Group
# Do not include the following 3 in the subscription, otherwise there will be errors
# Will be ignored after profile selection
#proxies:
#  - name: Shadowsocks
#    type: socks5
#    server: 127.0.0.1
#    port: 1080
#proxy-groups:
#  - name: Proxy
#    type: select
#    proxies:
# - Shadowsocks
#rules:
#  - 'MATCH,DIRECT'

# Clash for Windows
# Proxies module latency test settings
cfw-latency-timeout: 3000
cfw-latency-url: http://www.gstatic.com/generate_204

# Mixin
#Supports injecting common property settings into all configuration files
#cfw-profile-mixin:
  #dns:
    #enable: true
    #listen: :53
    #enhanced-mode: fake-ip
    #nameserver:
     #- 223.5.5.5 # Alibaba DNS
     #- 180.76.76.76 # Baidu DNS
     #- 119.29.29.29 # Tencent DNS
     #- 117.50.11.11 # ONE DNS interception version malicious website interception, advertising filtering
     #- 117.50.10.10 # ONE DNS pure version directly returns its real response result
     #- 114.114.114.114 # 114DNS
  #experimental:
    #interface-name: WLAN

#Custom configuration directory
#cfw-profiles-path: 'C:\Users\Administrator\.config\clash\profiles'

# Disconnect
# Identify strategy of breaking connections after switching to a new proxy/profile/mode
# Options for proxy: none, chain(proxy group in connection chains), all
# Options for profile: true, false
# Options for mode: true, false
cfw-conn-break-strategy:
  proxy: none # none/chain/all
  profile: true # true/false
  mode: false # true/false

# Customize status bar icon
#cfw-tray-icon:
#default: .\resources\static\imgs\logo_64.png # Default icon
#system-proxy-on: .\resources\static\imgs\custom.ico # Icon after turning on system proxy

# Custom Fonts
#cfw-font-family: "Noto Sans TC" # Fonts available in the system

# Custom request headers
#cfw-http-headers:
  #token: "123456"
  #cfw-version: "0.9.11"

# Custom node sorting
# Optional parameters:
# default: Define the node order according to the configuration file
# latency: Sort by node latency in ascending order
# alphabet: Arrange by node name alphabetically
# Sort proxies in Proxies module by default/latency/alphabet
cfw-proxies-order: default

# Subprocess starts other applications
# Run child process after CFW started
# Refer: https://docs.cfw.lbyczf.com/contents/childprocess.html
#cfw-child-process:
  # Start the subscription conversion program, port number 7893
  #- command: "subconverter.exe" # run.cmd program name subconverter.exe -cfw >>logs/run.log 2>&1
    #args:
      #- "-cfw" # Run parameter 1
      #- "-f" # Run parameter 2
      #- "pref-acl4ssr.yml" # Run parameter 3
    #options:
      #cwd: subconverter # subprocess working directory
      #detached: true # The child process runs independently of its parent process
      #shell: true # Run command in shell
      #windowsHide: true # Hide the console window of the child process
  # Start NetEase Cloud, port number 3333
  #- command: "unblockneteasemusic.exe" # Start NetEase Cloud Music
    #args:
      #- "-p" # Run parameter 1
      #- "3333" # Run parameter 2
    #options:
      #cwd: unblockNeteaseMusic # subprocess working directory
      #detached: true # The child process runs independently of its parent process
      #shell: true # Run command in shell
      #windowsHide: true # Hide the console window of the child process

# System proxy bypass list cfw-bypass
# System proxy will ignore these domains(or ipnet)
# System proxy skip list - backup, does not work,
# You can interchange the contents of cfw-bypass-bak and cfw-bypass when using
cfw-bypass-bak:
  # The original fields do not need to be deleted
  - qq.com
  - 'music.163.com' # NetEase Cloud Domain Name 1
  - '*.music.126.net' # NetEase Cloud domain name 2
  - localhost
  - 127.*
  - 10.*
  - 172.16.*
  - 172.17.*
  - 172.18.*
  - 172.19.*
  - 172.20.*
  - 172.21.*
  - 172.22.*
  - 172.23.*
  - 172.24.*
  - 172.25.*
  - 172.26.*
  - 172.27.*
  - 172.28.*
  - 172.29.*
  - 172.30.*
  - 172.31.*
  - 192.168.*
  - <local>
# System proxy skip list works
cfw-bypass:
  # Direct connection list
  # MyList
  - "*.13th.tech"
  - "*.423down.com"
  - "*.bokecc.com"
  - "*.chaipip.com"
  - "*.chinaplay.store"
  - "*.hrtsea.com"
  - "*.kaikeba.com"
  - "*.laomo.me"
  - "*.mpyit.com"
  - "*.msftconnecttest.com"
  - "*.msftncsi.com"
  - "*.qupu123.com"
  - "*.pdfwifi.com"
  - "*.zhenguanyu.biz"
  - "*.zhenguanyu.com"
  - "*.snapdrop.net"
  - "*.tebex.io"
  # CN domain name direct connection (China | Company | Network)
  - "*.cn"
  - "*.xn--fiqs8s"
  - "*.xn--55qx5d"
  - "*.xn--io0a7i"
  # Common domain name keywords in China
  - "*360buy*"
  - "*alicdn*"
  - "*alimama*"
  - "*alipay*"
  - "*appzapp*"
  - "*baidupcs*"
  - "*bleeping*"
  - "*ccgslb*"
  - "*chinacache*"
  - "*duobao*"
  - "*jdpay*"
  - "*moke*"
  - "*qhimg*"
  - "*vpimg*"
  - "*xiami*"
  - "*xiaomi*"
  # 360
  - "*.360.com"
  - "*.360kuai.com"
  - "*.360safe.com"
  - "*.dhrest.com"
  - "*.qhres.com"
  - "*.qhstatic.com"
  - "*.qhupdate.com"
  - "*.so.com"
  # 4399
  - "*.4399.com"
  - "*.4399pk.com"
  - "*.5054399.com"
  - "*.img4399.com"
  # 58
  - "*.58.com"
  # Ali Baba
  - "*.1688.com"
  - "*.aliapp.org"
  - "*.alibaba.com"
  - "*.alibabacloud.com"
  - "*.alibabausercontent.com"
  - "*.alicdn.com"
  - "*.alicloudccp.com"
  - "*.aliexpress.com"
  - "*.aliimg.com"
  - "*.alikunlun.com"
  - "*.alipay.com"
  - "*.alipayobjects.com"
  - "*.alisoft.com"
  - "*.aliyun.com"
  - "*.aliyuncdn.com"
  - "*.aliyuncs.com"
  - "*.aliyundrive.com"
  - "*.aliyundrive.net"
  - "*.amap.com"
  - "*.autonavi.com"
  - "*.dingtalk.com"
  - "*.ele.me"
  - "*.hichina.com"
  - "*.mmstat.com"
  - "*.mxhichina.com"
  - "*.soku.com"
  - "*.taobao.com"
  - "*.taobaocdn.com"
  - "*.tbcache.com"
  - "*.tbcdn.com"
  - "*.tmall.com"
  - "*.tmall.hk"
  - "*.ucweb.com"
  - "*.xiami.com"
  - "*.xiami.net"
  - "*.ykimg.com"
  - "*.youku.com"
  # Baidu
  - "*.baidu.com"
  - "*.baidubcr.com"
  - "*.baidupcs.com"
  - "*.baidustatic.com"
  - "*.bcebos.com"
  - "*.bdimg.com"
  - "*.bdstatic.com"
  - "*.bdurl.net"
  - "*.hao123.com"
  - "*.hao123img.com"
  - "*.jomodns.com"
  - "*.yunjiasu-cdn.net"
  # Bilibili
  - "*.acg.tv"
  - "*.acgvideo.com"
  - "*.b23.tv"
  - "*.bigfun.cn"
  - "*.bigfunapp.cn"
  - "*.biliapi.com"
  - "*.biliapi.net"
  - "*.bilibili.com"
  - "*.bilibili.co"
  - "*.biliintl.co"
  - "*.biligame.com"
  - "*.biligame.net"
  - "*.bilivideo.com"
  - "*.bilivideo.cn"
  - "*.hdslb.com"
  - "*.im9.com"
  - "*.smtcdns.net"
  # ByteDance
  - "*.amemv.com"
  - "*.bdxiguaimg.com"
  - "*.bdxiguastatic.com"
  - "*.byted-static.com"
  - "*.bytedance.com"
  - "*.bytedance.net"
  - "*.bytedns.net"
  - "*.bytednsdoc.com"
  - "*.bytegoofy.com"
  - "*.byteimg.com"
  - "*.bytescm.com"
  - "*.bytetos.com"
  - "*.bytexservice.com"
  - "*.douyin.com"
  - "*.douyincdn.com"
  - "*.douyinpic.com"
  - "*.douyinstatic.com"
  - "*.douyinvod.com"
  - "*.feelgood.cn"
  - "*.feiliao.com"
  - "*.gifshow.com"
  - "*.huoshan.com"
  - "*.huoshanzhibo.com"
  - "*.ibytedapm.com"
  - "*.iesdouyin.com"
  - "*.ixigua.com"
  - "*.kspkg.com"
  - "*.pstatp.com"
  - "*.snssdk.com"
  - "*.toutiao.com"
  - "*.toutiao13.com"
  - "*.toutiaoapi.com"
  - "*.toutiaocdn.com"
  - "*.toutiaocdn.net"
  - "*.toutiaocloud.com"
  - "*.toutiaohao.com"
  - "*.toutiaohao.net"
  - "*.toutiaoimg.com"
  - "*.toutiaopage.com"
  - "*.wukong.com"
  - "*.zijieapi.com"
  - "*.zijieimg.com"
  - "*.zjbyte.com"
  - "*.zjcdn.com"
  # CCTV
  - "*.cctv.com"
  - "*.cctvpic.com"
  - "*.livechina.com"
  # ChinaNet
  - "*.21cn.com"
  # DiDi
  - "*.didialift.com"
  - "*.didiglobal.com"
  - "*.udache.com"
  # Douyu Douyu
  - "*.douyu.com"
  - "*.douyu.tv"
  - "*.douyuscdn.com"
  - "*.douyutv.com"
  # Epic
  - "*.epicgames.com"
  - "*.epicgames.dev"
  - "*.helpshift.com"
  - "*.paragon.com"
  - "*.unrealengine.com"
  # HuaWei
  - "*.dbankcdn.com"
  - "*.hc-cdn.com"
  - "*.hicloud.com"
  - "*.hihonor.com"
  - "*.huawei.com"
  - "*.huaweicloud.com"
  - "*.huaweishop.net"
  - "*.hwccpc.com"
  - "*.vmall.com"
  - "*.vmallres.com"
  # Heytap
  - "*.allawnfs.com"
  - "*.allawno.com"
  - "*.allawntech.com"
  - "*.coloros.com"
  - "*.heytap.com"
  - "*.heytapcs.com"
  - "*.heytapdownload.com"
  - "*.heytapimage.com"
  - "*.heytapmobi.com"
  - "*.oppo.com"
  - "*.oppoer.me"
  - "*.oppomobile.com"
  # Iflytek iFlytek
  - "*.iflyink.com"
  - "*.iflyrec.com"
  - "*.iflytek.com"
  #Iqiyi
  - "*.71.am"
  - "*.71edge.com"
  - "*.iqiyi.com"
  - "*.iqiyipic.com"
  - "*.ppsimg.com"
  - "*.qiyi.com"
  - "*.qiyipic.com"
  - "*.qy.net"
  # JD
  - "*.360buy.com"
  - "*.360buyimg.com"
  - "*.jcloudcs.com"
  - "*.jd.com"
  - "*.jd.hk"
  - "*.jdcloud.com"
  - "*.jdpay.com"
  - "*.paipai.com"
  # Kingsoft
  - "*.iciba.com"
  - "*.ksosoft.com"
  - "*.ksyun.com"
  # Kuaishou Quick
  - "*.kuaishou.com"
  - "*.yximgs.com"
  # Daughter
  - "*.meitu.com"
  - "*.meitudata.com"
  - "*.meitustat.com"
  - "*.meipai.com"
  # LeTV
  - "*.le.com"
  - "*.lecloud.com"
  - "*.letv.com"
  - "*.letvcloud.com"
  - "*.letvimg.com"
  - "*.letvlive.com"
  - "*.letvstore.com"
  #MGTV Mango TV
  - "*.hitv.com"
  - "*.hunantv.com"
  - "*.mgtv.com"
  # WE
  - "*.duokan.com"
  - "*.mi-img.com"
  - "*.mi.com"
  - "*.miui.com"
  - "*.xiaomi.com"
  - "*.xiaomi.net"
  - "*.xiaomicp.com"
  # NetEase
  - "*.126.com"
  - "*.126.net"
  - "*.127.net"
  - "*.163.com"
  - "*.163yun.com"
  - "*.lofter.com"
  - "*.netease.com"
  - "*.ydstatic.com"
  - "*.youdao.com"
  # PPTV、PPLive
  - "*.pplive.com"
  - "*.pptv.com"
  #PDD Pinduoduo
  - "*.pindooduo.com"
  - "*.yangkeduo.com"
  # Sina
  - "*.leju.com"
  - "*.miaopai.com"
  - "*.sina.com"
  - "*.sina.com.cn"
  - "*.sina.cn"
  - "*.sinaapp.com"
  - "*.sinaapp.cn"
  - "*.sinaimg.com"
  - "*.sinaimg.cn"
  - "*.weibo.com"
  - "*.weibo.cn"
  - "*.weibocdn.com"
  - "*.weibocdn.cn"
  - "*.xiaoka.tv"
  # Sohu Sogo
  - "*.go2map.com"
  - "*.sogo.com"
  - "*.sogou.com"
  - "*.sogoucdn.com"
  - "*.sohu-inc.com"
  - "*.sohu.com"
  - "*.sohucs.com"
  - "*.sohuno.com"
  - "*.sohurdc.com"
  - "*.v-56.com"
  # Sony
  - "*.playstation.com"
  - "*.playstation.net"
  - "*.playstationnetwork.com"
  - "*.sony.com"
  - "*.sonyentertainmentnetwork.com"
  # SteamCN
  - "*.cm.steampowered.com"
  - "*.steamcontent.com"
  - "*.steamusercontent.com"
  - "*.steamchina.com"
  - "csgo.wmsj.cn"
  - "dota2.wmsj.cn"
  - "wmsjsteam.com"
  - "dl.steam.clngaa.com"
  - "dl.steam.ksyna.com"
  - "st.dl.bscstorage.net"
  - "st.dl.eccdnx.com"
  - "st.dl.pinyuncloud.com"
  - "xz.pphimalayanrt.com"
  - "steampipe.steamcontent.tnkjmec.com"
  - "steampowered.com.8686c.com"
  - "steamstatic.com.8686c.com"
  # Tencent
  - "*.foxmail.com"
  - "*.gtimg.com"
  - "*.idqqimg.com"
  - "*.igamecj.com"
  - "*.myapp.com"
  - "*.myqcloud.com"
  - "*.qq.com"
  - "*.qqmail.com"
  - "*.qqurl.com"
  - "*.smtcdns.com"
  - "*.smtcdns.net"
  - "*.soso.com"
  - "*.tencent-cloud.net"
  - "*.tencent.com"
  - "*.tencentmind.com"
  - "*.tenpay.com"
  - "*.wechat.com"
  - "*.weixin.com"
  - "*.weiyun.com"
  # Vip Vipshop
  - "*.appsimg.com"
  - "*.appvipshop.com"
  - "*.vip.com"
  - "*.vipstatic.com"
  # Ximalaya
  - "*.ximalaya.com"
  - "*.xmcdn.com"
  # Xunlei
  - "*.00cdn.com"
  - "*.88cdn.com"
  - "*.kanimg.com"
  - "*.kankan.com"
  - "*.p2cdn.com"
  - "*.sandai.net"
  - "*.thundercdn.com"
  - "*.xunlei.com"
  # YYeTs
  - "*.got001.com"
  - "*.p4pfile.com"
  - "*.rrys.tv"
  - "*.rrys2020.com"
  - "*.yyets.com"
  - "*.zimuzu.io"
  - "*.zimuzu.tv"
  - "*.zmz001.com"
  - "*.zmz002.com"
  - "*.zmz003.com"
  - "*.zmz004.com"
  - "*.zmz2019.com"
  - "*.zmzapi.com"
  - "*.zmzapi.net"
  - "*.zmzfile.com"
  # TeamViewer
  - "*.teamviewer.com"
  # Public Direct CDN
  - "*.baomitu.com"
  - "*.bootcss.com"
  - "*.jiasule.com"
  - "*.staticfile.org"
  - "*.upaiyun.com"
  # China DNS
  - "*.doh.pub"
  - "*.dns.alidns.com"
  - "*.doh.360.cn"
  # AccelerateDirectSites
  - "*.10010.com"
  - "*.115.com"
  - "*.12306.com"
  - "*.17173.com"
  - "*.178.com"
  - "*.17k.com"
  - "*.360doc.com"
  - "*.36kr.com"
  - "*.3dmgame.com"
  - "*.51cto.com"
  - "*.51job.com"
  - "*.51jobcdn.com"
  - "*.56.com"
  - "*.8686c.com"
  - "*.abchina.com"
  - "*.abercrombie.com"
  - "*.acfun.tv"
  - "*.air-matters.com"
  - "*.air-matters.io"
  - "*.aixifan.com"
  - "*.algocasts.io"
  - "*.babytree.com"
  - "*.babytreeimg.com"
  - "*.baicizhan.com"
  - "*.baidupan.com"
  - "*.baike.com"
  - "*.biqudu.com"
  - "*.biquge.com"
  - "*.bitauto.com"
  - "*.bosszhipin.com"
  - "*.c-ctrip.com"
  - "*.camera360.com"
  - "*.cdnmama.com"
  - "*.chaoxing.com"
  - "*.che168.com"
  - "*.chinacache.net"
  - "*.chinaso.com"
  - "*.chinaz.com"
  - "*.chinaz.net"
  - "*.chuimg.com"
  - "*.cibntv.net"
  - "*.clouddn.com"
  - "*.cloudxns.net"
  - "*.cn163.net"
  - "*.cnblogs.com"
  - "*.cnki.net"
  - "*.cnmstl.net"
  - "*.coolapk.com"
  - "*.coolapkmarket.com"
  - "*.csdn.net"
  - "*.ctrip.com"
  - "*.dangdang.com"
  - "*.dfcfw.com"
  - "*.dianping.com"
  - "*.dilidili.wang"
  - "*.douban.com"
  - "*.doubanio.com"
  - "*.dpfile.com"
  - "*.duowan.com"
  - "*.dxycdn.com"
  - "*.dytt8.net"
  - "*.easou.com"
  - "*.eastday.com"
  - "*.eastmoney.com"
  - "*.ecitic.com"
  - "*.element-plus.org"
  - "*.ewqcxz.com"
  - "*.fang.com"
  - "*.fantasy.tv"
  - "*.feng.com"
  - "*.fengkongcloud.com"
  - "*.fir.im"
  - "*.frdic.com"
  - "*.fresh-ideas.cc"
  - "*.ganji.com"
  - "*.ganjistatic1.com"
  - "*.geetest.com"
  - "*.geilicdn.com"
  - "*.ghpym.com"
  - "*.godic.net"
  - "*.guazi.com"
  - "*.gwdang.com"
  - "*.gzlzfm.com"
  - "*.haibian.com"
  - "*.haosou.com"
  - "*.hollisterco.com"
  - "*.hongxiu.com"
  - "*.huajiao.com"
  - "*.hupu.com"
  - "*.huxiucdn.com"
  - "*.huya.com"
  - "*.ifeng.com"
  - "*.ifengimg.com"
  - "*.images-amazon.com"
  - "*.infzm.com"
  - "*.ipip.net"
  - "*.it168.com"
  - "*.ithome.com"
  - "*.ixdzs.com"
  - "*.jianguoyun.com"
  - "*.jianshu.com"
  - "*.jianshu.io"
  - "*.jianshuapi.com"
  - "*.jiathis.com"
  - "*.jmstatic.com"
  - "*.jumei.com"
  - "*.kaola.com"
  - "*.knewone.com"
  - "*.koowo.com"
  - "*.ksyungslb.com"
  - "*.kuaidi100.com"
  - "*.kugou.com"
  - "*.lancdns.com"
  - "*.landiannews.com"
  - "*.lanzou.com"
  - "*.lanzoui.com"
  - "*.lanzoux.com"
  - "*.lemicp.com"
  - "*.letitfly.me"
  - "*.lizhi.fm"
  - "*.lizhi.io"
  - "*.lizhifm.com"
  - "*.luoo.net"
  - "*.lvmama.com"
  - "*.lxdns.com"
  - "*.maoyan.com"
  - "*.meilishuo.com"
  - "*.meituan.com"
  - "*.meituan.net"
  - "*.meizu.com"
  - "*.migucloud.com"
  - "*.miguvideo.com"
  - "*.mobike.com"
  - "*.mogu.com"
  - "*.mogucdn.com"
  - "*.mogujie.com"
  - "*.moji.com"
  - "*.moke.com"
  - "*.msstatic.com"
  - "*.mubu.com"
  - "*.myunlu.com"
  - "*.nruan.com"
  - "*.nuomi.com"
  - "*.onedns.net"
  - "*.oneplus.com"
  - "*.onlinedown.net"
  - "*.oracle.com"
  - "*.oschina.net"
  - "*.ourdvs.com"
  - "*.polyv.net"
  - "*.qbox.me"
  - "*.qcloud.com"
  - "*.qcloudcdn.com"
  - "*.qdaily.com"
  - "*.qdmm.com"
  - "*.qhimg.com"
  - "*.qianqian.com"
  - "*.qidian.com"
  - "*.qihucdn.com"
  - "*.qin.io"
  - "*.qiniu.com"
  - "*.qiniucdn.com"
  - "*.qiniudn.com"
  - "*.qiushibaike.com"
  - "*.quanmin.tv"
  - "*.qunar.com"
  - "*.qunarzz.com"
  - "*.realme.com"
  - "*.repaik.com"
  - "*.ruguoapp.com"
  - "*.runoob.com"
  - "*.sankuai.com"
  - "*.segmentfault.com"
  - "*.sf-express.com"
  - "*.shumilou.net"
  - "*.simplecd.me"
  - "*.smzdm.com"
  - "*.snwx.com"
  - "*.soufunimg.com"
  - "*.sspai.com"
  - "*.startssl.com"
  - "*.suning.com"
  - "*.synology.com"
  - "*.taihe.com"
  - "*.th-sjy.com"
  - "*.tianqi.com"
  - "*.tianqistatic.com"
  - "*.tianyancha.com"
  - "*.tianyaui.com"
  - "*.tietuku.com"
  - "*.tiexue.net"
  - "*.tmiaoo.com"
  - "*.trip.com"
  - "*.ttmeiju.com"
  - "*.tudou.com"
  - "*.tuniu.com"
  - "*.tuniucdn.com"
  - "*.umengcloud.com"
  - "*.upyun.com"
  - "*.uxengine.net"
  - "*.videocc.net"
  - "*.vivo.com"
  - "*.wandoujia.com"
  - "*.weather.com"
  - "*.weico.cc"
  - "*.weidian.com"
  - "*.weiphone.com"
  - "*.weiphone.net"
  - "*.womai.com"
  - "*.wscdns.com"
  - "*.xdrig.com"
  - "*.xhscdn.com"
  - "*.xiachufang.com"
  - "*.xiaohongshu.com"
  - "*.xiaojukeji.com"
  - "*.xinhuanet.com"
  - "*.xip.io"
  - "*.xitek.com"
  - "*.xiumi.us"
  - "*.xslb.net"
  - "*.xueqiu.com"
  - "*.yach.me"
  - "*.yeepay.com"
  - "*.yhd.com"
  - "*.yihaodianimg.com"
  - "*.yinxiang.com"
  - "*.yinyuetai.com"
  - "*.yixia.com"
  - "*.ys168.com"
  - "*.yuewen.com"
  - "*.yy.com"
  - "*.yystatic.com"
  - "*.zealer.com"
  - "*.zhangzishi.cc"
  - "*.zhanqi.tv"
  - "*.zhaopin.com"
  - "*.zhihu.com"
  - "*.zhimg.com"
  - "*.zhipin.com"
  - "*.zhongsou.com"
  - "*.zhuihd.com"
  - "localhost"
  - 127.*
  - 10.*
  - 172.16.*
  - 172.17.*
  - 172.18.*
  - 172.19.*
  - 172.20.*
  - 172.21.*
  - 172.22.*
  - 172.23.*
  - 172.24.*
  - 172.25.*
  - 172.26.*
  - 172.27.*
  - 172.28.*
  - 172.29.*
  - 172.30.*
  - 172.31.*
  - 192.168.*
  - <local>

rule-providers:
  reject:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/reject.txt"
    path: ./ruleset/reject.yaml
    interval: 86400
  iran_other_sites:
    type: http
    format: text
    behavior: domain
    url: "https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/clash_rules_other.txt"
    path: ./ruleset/iran_other.txt
    interval: 432000
  iran_ads:
    type: http
    format: text
    behavior: domain
    url: "https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/clash_rules_ads.txt"
    path: ./ruleset/iran_ads.txt
    interval: 432000

#  ads:
#    type: http
#    format: text
#    behavior: domain
#    url: "https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt"
#    path: ./ruleset/ads.txt
#    interval: 86400

#  lancidr:
#    type: http
#    behavior: ipcidr
#    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/lancidr.txt"
#    path: ./ruleset/lancidr.yaml
#    interval: 86400
  BanAD:
    type: http
    format: text
    behavior: classical
    url: 🛑 Global Block, https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list
    path: ./ruleset/BanAD.list
    interval: 432000
  BanProgramAD:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list
    path: ./ruleset/BanProgramAD.list
    interval: 432000
  Adobe:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/cmliu/ACL4SSR/main/Clash/adobe.list
    path: ./ruleset/adobe.list
    interval: 432000
  GoogleFCM:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleFCM.list
    path: ./ruleset/GoogleFCM.list
    interval: 432000
  MS:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Microsoft.list
    path: ./ruleset/Microsoft.list
    interval: 432000
  Apple:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list
    path: ./ruleset/Apple.list
    interval: 432000
  TG:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Telegram.list
    path: ./ruleset/Telegram.list
    interval: 432000    
  OpenAI:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/OpenAi.list
    path: ./ruleset/OpenAi.list
    interval: 432000
  AI:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/juewuy/ShellClash/master/rules/ai.list
    path: ./ruleset/ai.list
    interval: 432000    
  YT:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/YouTube.list
    path: ./ruleset/YouTube.list
    interval: 432000
  NetFlix:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list
    path: ./ruleset/Netflix.list
    interval: 432000  
  Foreign-Media:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyMedia.list
    path: ./ruleset/Foreign-Media.list
    interval: 432000
  Proxy Lite:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyLite.list
    path: ./ruleset/Proxy-Lite.list
    interval: 432000
rules:
  - RULE-SET, reject, 🛑 Global Block
  - RULE-SET,iran_ads, 🛑 Global Block
  
  - RULE-SET,BanAD, 🛑 Global Block
  - RULE-SET,BanProgramAD, 🍃 Application Ban
  - RULE-SET,BanProgramAD, 🍃 Application Ban
  - RULE-SET,GoogleFCM, 📢 Google FCM
  - RULE-SET,MS,Ⓜ️ MS Services
  - RULE-SET,Apple, 🍎 Apple Services
  - RULE-SET,TG,📲 Telegram Info
  - RUlE-SET,OpenAI, 🤖 OpenAI
  - RUlE-SET,AI, 🤖 OpenAI
  - RULE-SET,YT,📹 YouTube video
  - RULE-SET,NetFlix,🎥 Netflix
  - RULE-SET,Foreign-Media,🌍 Foreign Media
  #- RULE_SET,Proxy Lite,🚀 Node Selection

  
  - GEOIP,IR,DIRECT
  - DOMAIN-SUFFIX,ir,DIRECT
  - RULE-SET,iran_other_sites, 🎯 Global Direct Connection
  - MATCH,🐟 Free Fish
