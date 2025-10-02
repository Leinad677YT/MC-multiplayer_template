## TEXT DATA

    ## PREFIX
        # personal
        data modify storage zl.visual:text nutria.txt set value \
            [{text:"ɴ",color:"#1d7fdb"},{text:"ᴜ",color:"#2388e6"},{text:"ᴛ",color:"#2f8ee7"},{text:"ʀ",color:"#3895ec"},{text:"ɪ",color:"#45a1f7"},{text:"ᴀ ",color:"#4faaff"}]
        # fic
        data modify storage zl.visual:text fic.txt set value \
            [{"text":"ꜰ","color":"#114E5A"},{"text":"ɪ","color":"#126576"},{"text":"ᴄ ","color":"#137C91"}]
        data modify storage zl.visual:text ingles.txt set value \
            [{"text":"ʙ","color":"#64288F"},{"text":"ʀ","color":"#6C21A2"},{"text":"ɪ","color":"#741BB4"},{"text":"'","color":"#7C14C7"},{"text":"ɪ","color":"#840DDA"},{"text":"ꜱ","color":"#8C07EC"},{"text":"ʜ ","color":"#9400FF"}]
        # other
        data modify storage zl.visual:text vip.txt set value \
            [{"text":"ᴠ","color":"#A01790"},{"text":"ɪ","color":"#B70CA4"},{"text":"ᴘ ","color":"#CD00B7"}]
    ##

    ## SUFFIX
        data modify storage zl.visual:text donor.txt set value \
            [{"text":" ◎","color":"#ecc130",hover_event:{action:"show_text",value:{translate:"leinad.tag.donor.hover",fallback:"%s",with:[[{"text":"ꜱ","color":"#A08117"},{"text":"ᴏ","color":"#A48416"},{"text":"ᴘ","color":"#A88715"},{"text":"ᴏ","color":"#AC8A14"},{"text":"ʀ","color":"#B08D13"},{"text":"ᴛ","color":"#B48F12"},{"text":"ᴇ","color":"#B89211"},{"text":" "},{"text":"ᴍ","color":"#C0980F"},{"text":"ᴏ","color":"#C49B0E"},{"text":"ɴ","color":"#C89E0D"},{"text":"ᴇ","color":"#CCA10C"},{"text":"ᴛ","color":"#D0A40B"},{"text":"ᴀ","color":"#D4A60A"},{"text":"ʀ","color":"#D8A909"},{"text":"ɪ","color":"#DCAC08"},{"text":"ᴏ","color":"#E0AF07"}]]}}}]
    ##
##



execute if entity @a[name="ñ"] run tellraw @a [{"text":" ◎","color":"#ecc130"}]
