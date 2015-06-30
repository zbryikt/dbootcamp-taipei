base = do
  speakers: 
      * id:   "muyueh"
        en: name: "Muyueh Lee", title: "Founder", inst: "muyueh.com"
        zh: name: "李慕約",     title: "創辦人",  inst: "muyueh.com"

      * id:   "justin"
        en: name: "Justin Arenstein", title: "Founder",    inst: "Code for Africa"
        zh: name: "Justin Arenstein", title: "創辦人",    inst: "Code for Africa"

      * id:   "yolanda"
        en: name: "Yolanda Ma", title: "Consultant", inst: "UNDP Asia & Pacific"
        zh: name: "馬金馨",     title: "創新顧問", inst: "聯合國開發計畫署亞洲總部"

      * id: "jimmy"
        en: name: "Jimmy Huang", title: "Director",   inst: "Open Culture Foundation"
        zh: name: "黃雋", title: "董事",   inst: "財團法人開放文化基金會"

      * id: "cedric"
        en: name: "Cedric Sam", title: "Editor", inst: "South China Morning Post / HK"
        zh: name: "岑正倫", title: "編輯", inst: "香港南華早報"

      * id: "kirby"
        en: name: "Kirby Wu", title: "Cofounder", inst: "foundi.info"
        zh: name: "吳泰輝",   title: "共同創辦人", inst: "foundi.info"

      * id: "ronny"
        en: name: "Ronny Wang", title: "Cofounder",  inst: "SheetHub.com"
        zh: name: "王向榮", title: "共同創辦人",  inst: "SheetHub.com"

      * id: "default"
        en: name: "Silva Shih", title: "Not Given",  inst: "To Be Provided"
        zh: name: "史書華", title: "Not Given",  inst: "To Be Provided"

base.speakers.map -> it <<< it.en
module.exports = base
