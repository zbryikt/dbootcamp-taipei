locales = <[zh en]>
base = do
  translate: (data, locale) ->
    ret = if typeof(data) == typeof([]) and data.length => [] else {}
    onlyLocale = !!![k for k of data].filter(->!(it in locales)).length
    for k,v of data =>
      if k == locale =>
        if typeof(v) == typeof({}) => ret <<< v
        else if typeof(v) == typeof("") => 
          if onlyLocale => ret = v else ret.name = v
      else if (k in locales) and k != locale => continue
      else if typeof(v) == typeof({}) => 
        ret[k] = @translate v, locale
      else ret[k] = v
    ret
  byID: {}
  index: (data) ->
    for k,v of data => if v.id => @byID["\##that"] = v
    for k,v of data => if typeof(v) == typeof({}) => @index(v)

  expand: (data) ->
    for k,v of data =>
      if typeof(v) == typeof("") and /^#/.exec(v) => if @byID[v] => data[k] = that
      if typeof(v) == typeof({}) => @expand(v)

  locale: (locale) ->
    ret = {}
    raw = @data
    ret = @translate raw, locale
    @index ret
    @expand ret
    ret.locale = locale
    ret

base.data = do
  aux:
    sessions: zh: "議程表", en: "Sessions"
    land-speakers: zh: "講師陣容", en: "Session Speakers"
    land-partners: zh: "合作夥伴", en: "Partners"
    heading:
      agenda: zh: "議程表", en: "Agenda"
      speakers: zh: "講師介紹", en: "Speakers"

    agenda:
      time: zh: \時間, en: \Time
      speaker: zh: \講者, en: \Speaker
      topic: zh: \主題, en: \Topic
  navbar:
    * link: "registration/", zh: "報名", en: "Registration"
    * link: "agenda.html", zh: "議程", en: "Agenda"
    * link: "speakers.html", zh: "講者", en: "Speakers"
    * link: "http://datasci.tw", zh: "DataSci.tw", en: "DataSci.tw"
  speakers: 
    * id: "muyueh"
      en: 
        name: "Muyueh Lee", title: "Founder", inst: "muyueh.com"
        desc: ""
      zh: 
        name: "李慕約",     title: "創辦人",  inst: "李慕約公司"
        desc: """SheetHub.com 的共同創辦人，以 d3.js 製作資料視覺化。參與中国器官分配与共享系统研究中心 (COTRS) 與 世界衛生組織 (WHO) 的專案，針對 700 家三級甲等醫院資料庫建置視覺分析界面。其他客戶涵蓋台北市政府、天下雜誌等。曾經視覺化的領域橫跨財金、能源、交通、糧食、語言以及漢堡。

在零時政府 g0v.tw 貢獻「發電成本計算機」，其蔬菜價格的研究，獲經濟部頒選為最佳 OpenData 應用。

在各地從事資料相關教學，包含：「世界銀行 DataBootCamp / 新加坡」、「Google Squared Program 香港」、「台大新聞研究所 / 台灣」。
"""

    * id: "justin"
      en: 
        name: "Justin Arenstein", title: "Founder",    inst: "Code for Africa"
        desc: """He is an award-winning investigative journalist and digital strategist currently helping Google and the Code for Africa initiative strengthen Africa’s watchdog media by working with newsrooms to implement better forensic research and evidence-based reportage. This includes helping media adopt digital tools and data journalism strategies. Justin manages the $1m Innovate Africa and $750,000 Impact Africa prototype funds, is rolling out HacksHackers chapters across Africa, and supports newsroom-based experiments with citizen reporting, mobile news, and augmented reality platforms. Justin is a former Press Councillor in South Africa, and continues to serve on several media industry bodies and think tanks. His investigative reportage has helped put a senator, two legislature speakers and a provincial cabinet minister behind bars, and contributed to the ouster of two provincial premiers and several other cabinet ministers and state officials on charges ranging from child rape to corruption."""
      zh:
        name: "Justin Arenstein", title: "創辦人",    inst: "Code for Africa"
        desc: """獲獎調查報導記者及數位策略專家。目前與Google和Code for Africa合作，在非洲新聞室推動以實證為基礎的報導，協助新聞媒體使用數位工具、推動資料新聞的發展策略，強化非洲新聞守門員的角色。

Justin同時負責Innovate Africa基金及Impact Africa初創基金，在非洲地區推動新聞與科技結合的HacksHackers運動，並前進各大新聞室，直接在編輯台推動公民報導、行動裝置新聞、虛擬實境新聞等實驗。

在更早之前，Justin曾擔任南非媒體委員，同時服務多個新聞媒體單位及智庫。所撰寫的調查報導，曾讓數位議員及官員最終接受司法制裁。"""

    * id: "yolanda"
      en:
        name: "Yolanda Ma", title: "Consultant", inst: "UNDP Asia & Pacific"
        desc: """Award-winning digital strategist specializing in data journalism, social media and non-profit technology. She actively speaks at various events, from global media conferences to local meet-ups. She offers training on digital media to media organizations and non-profits.

She co-founds DJChina, where DJ stands for data journalism, the first website in Chinese providing knowledge and information about data journalism. She was the Assistant Project Manager, Data at Thomson Reuters until Dec 2013, where she deputized overseeing data journalism projects. ConnectedChina, the flagship project of her team, which structures and visualizes publicly-available data about China’s elite leadership, won the Data Journalism Award of 2013.

She is currently based in Bangkok, Thailand, serving as innovation consultant for the UNDP Regional Bureau of Asia Pacific, providing advisory support to country offices on communications and technology."""
      zh: 
        name: "馬金馨",     title: "創新顧問", inst: "聯合國開發計畫署亞洲總部"
        desc: """現任聯合國開發計畫署亞洲總部創新顧問，數據中文網聯合創辦人。曾任湯森路透（Thomson Reuters）資料新聞助理專案經理，協管資料新聞產品的開發與執行，專案「Connected China」曾獲2013 Data Journalism Award。前香港南華早報首任社交媒體編輯，負責專案「公民地圖」獲亞洲出版協會2011年度卓越新聞榮譽獎。亦曾兼任國際記者網首任中文站主編。喜愛詩歌、攝影、紀錄片。"""

    * id: "jimmy"
      en:
        name: "Jimmy Huang", title: "Director",   inst: "Open Culture Foundation"
        desc: """Founder of g0v projects including: "fact", "timemap", and "taiwan land stat".

Background in computer science yet has a deep feeling about environment and society. As a founder of social enterprise and cares more about things not profitable. One of the internet generation but still wish to bring online to offline."""
      zh:
        name: "黃雋", title: "董事",   inst: "財團法人開放文化基金會"
        desc: """g0v專案：政誌 / 時間地圖 / 賽豬公上太空
  雖然資訊工程出身，卻對環境社會特別有感受；
  雖然辦了個社會(?)企業，卻對不賺錢的事情特別有興趣；
  雖然身處網路的虛擬世代，卻希望總是能與實體相互有交集。"""

    * id: "cedric"
      en:
        name: "Cedric Sam", title: "Editor", inst: "South China Morning Post / HK"
        desc: """Currently works at the South China Morning Post in Hong Kong, sifting through data and creating interactive graphics. In 2007-09, Cedric worked at the CBC in Montreal, making tools for its website and interactive graphics for French television. In 2009, he relocated to Hong Kong and worked at the Journalism and Media Studies Centre (JMSC) at The University of Hong Kong until 2012. He was the main programmer behind the JMSC’s China social media data projects and its WeiboScope. 

He joined the South China Morning Post in 2013 as its first interactive data journalist. In 2015, he transferred to the art department as a graphics editor. He worked as the coder for the multimedia projects such as the award-winning Voices from Tiananmen (2014) and has been the only coder embedded in the SCMP newsroom, working on a range of other projects, front-facing and for internal use.

Cedric freelanced for clients such as The New York Times, The Canadian Press, La Presse and the CBC. In 2011, he won with La Presse the Canadian Online Publishing award for best multi-platform initiative for coverage of the last Canadian general election. His favourite dev platforms/libraries of late are the Google Maps API and D3.js. """
      zh: 
        name: "岑正倫", title: "編輯", inst: "香港南華早報"
        desc: """香港南華早報第一位資料新聞記者，目前為南華早報圖表編輯。畢業於加拿大McGill大學生化系及資工系，2012年取得香港理工大學互動設計碩士。過去曾服務加拿大蒙特婁CBC電視，製作互動圖表。2009年移居香港，在香港大學新聞暨傳媒中心工作，港大知名研究微博審查的觀察網站「微博視野」，岑正倫為初期推手之一。

2013年加入南華早報，為編輯部唯一具有撰寫程式能力的記者，曾參與社內各大數位專輯和資料新聞專案，例如2014年獲獎作品<a href=""http://multimedia.scmp.com/tiananmen"" targer=""_blank"">天安門之聲</a>。岑正倫也曾與The New York Times、The Canadian Press、 La Presse、CBC媒體合作專案。他近期最喜愛的開發平台和程式庫為Google Maps API和D3.js。"""

    * id: "kirby"
      en:
        name: "Kirby Wu", title: "Cofounder", inst: "foundi.info"
        desc: """Cofounder of infographics.tw, g0v.tw and foundi.info. Expert in web technology and data visualization.

founded in 2014, infographics.tw focuses on providing information about  data visualization in Taiwan community, including web visualization technology, data wrangling and media innovation."""
      zh: 
        name: "吳泰輝",   title: "共同創辦人", inst: "foundi.info"
        desc: """infographics.tw, g0v.tw, foundi.info 等組織的共同創辦人，亦為資料視覺化領域與網頁技術專家。曾擔任 Google Taiwan DigiCamp(2014) 技術顧問，亦曾受邀至台大、交大、世新、政大等大學之新聞相關課程演講及授課。

infographics.tw 成立於 2014 年，專注於提工中文推廣資料視覺化的技術與應用，涵蓋的領域包含網站視覺化技術、資料爬梳、資料分析以及媒體創新應用。"""

    * id: "ronny"
      en:
        name: "Ronny Wang", title: "Cofounder",  inst: "SheetHub.com"
        desc: """Cofounder of SheetHub.com. Enjoy in collecting, scraping, releasing and using data. Founder and participant of g0v projects including "News Helper", "Job Helpers", "Taiwan Company Data", "Open Campaign Finance"""
      zh:
        name: "王向榮", title: "共同創辦人",  inst: "SheetHub.com"
        desc: """SheetHub.com 共同創辦人，曾任痞客邦產品開發副理，走吧旅行社
技術研發協理。熱愛收集資料、爬資料、放資料、用資料。 在零時
政府發起或參與「新聞小幫手」、「求職小幫手」、「台灣公司
資料」、「開放政治獻金」... 等專案"""

    * id: "silva"
      en: name: "Silva Shih", title: "Not Given",  inst: "To Be Provided"
      zh: name: "史書華", title: "Not Given",  inst: "To Be Provided"

  staff:
    * id: "clkao"
      en: name: "Chia-liang Kao", title: "",  inst: ""
      zh: name: "高嘉良", title: "",  inst: ""
    * id: "TBD"
      en: name: "TBD", title: "",  inst: ""
      zh: name: "未定", title: "",  inst: ""

  features:
    * id: "global"
      zh: 
        title: "國際視野"
        desc: "來自世界銀行、南華早報、數據中文網等世界各地與台灣相關領域的講者，為各位帶來國際資料新聞的最新現況，和編輯台裡面實際的運作狀況。"
      en:
        title: "Global View"
        desc: "Speakers from World Bank, South China Morning Post, djChina and related industries in Taiwan bring you the latest update of data journalism around the world and how things are done in newsroom."
    * id: "practice"
      zh:
        title: "實作訓練"
        desc: "由國內相關領域的專家帶領大家學習與實作。資料新聞課程切分為四大主軸，從案例、資料取得與整理、到資料視覺化，著重在立即上手，確保學習到的技術，能立即應用於新聞報導中。"
      en:
        title: "Hands-on Practice"
        desc: "Local domain experts will lead attendees in hands-on crash courses including report showcase, data retrieval and wrangling, data visualization, which are all focuson on how we can immediately apply these techniques in future news reports."
    * id: "project"
      zh:
        title: "參與提案"
        desc: "資料新聞實戰營包含零時政府黑客松的介紹，鼓勵所有參與者接續後兩天的零時政府黑客松提案活動，將創意、報導與技術、社群的力量結合，激發出前所未有的媒體型態與新聞報導。"
      en:
        title: "Projects"
        desc: "We introduce and encourage all participants to join the following two-day event of g0v hackathon to experience the power of combination of innovation, journalism, community and technology."
  agenda:
    * time: "09:00 - 09:10"
      speaker: \#clkao
      topic: en: "Opening", zh: "開場"

    * time: "09:10 - 09:50"
      speaker: \#justin
      topic: en: "Keynote", zh: "Keynote"

    * time: "09:50 - 10:30"
      speaker: \#TBD
      topic: en: "intl DJ Story", zh: "intl DJ Story"

    * time: "10:30 - 11:00"
      topic: en: "Tea Break", zh: "早茶時間"

    * time: "11:00 - 12:00"
      speaker: \#jimmy
      topic: en: "Data Journalism with Time and Space", zh: "穿越時空的資料新聞呈現 - 簡介與工具介紹"

    * time: "12:00 - 13:00"
      topic: en: "Lunch Time", zh: "午餐時間"

    * time: "13:00 - 14:00"
      speaker: \#ronny
      topic: en: "Where is the Data?", zh: "資料在哪裡？"

    * time: "14:00 - 15:00"
      speaker: \#kirby
      topic: en: "Fighting with Bad Data with Tools and Tips", zh: "迎戰壞資料 - 實用工具與技巧"

    * time: "15:00 - 15:30"
      topic: en: "Tea Break", zh: "午茶時間"

    * time: "15:30 - 16:00"
      speaker: \#muyueh
      topic: en: "Chart and Data Visualization", zh: "資料視覺化"

    * time: "15:30 - 16:00"
      speaker: <[#silva #yolanda #cedric]>
      topic: en: "Panel", zh: "座談"

module.exports = base
