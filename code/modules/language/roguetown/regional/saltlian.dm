/datum/language/saltlian
	name = "Saltliac"
	desc = "A language that is still relatively confusing to most that do not speak it, and considered one of the hardest in Beowricke to learn as a result- the Saltliac tongue is the language of the enigmatic far eastern fiefdoms that make up the Saltlian Celestial Kingdom. Said by many to have very intricate honorifics and extremely complex grammar, no scholar in Llewyn has heard the true, perfected form of it before- and if they have, they’ve never documented it. The version spoken in Lyndhardtia by Saltlian merchants is the result of a slow bastardization of Imperial and Saltliac as a result of decades of cultural contact. Hence, the Saltliac spoken in Llewyn is actually the trading language."
	speech_verb = "says"
	whisper_verb = "whispers"
	exclaim_verb = "yells"
	key = "k"
	flags = LANGUAGE_HIDE_ICON_IF_UNDERSTOOD | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 30
	default_priority = 90
	icon_state = "asse"
	spans = list(SPAN_SALTLIAN)
	syllables = list(
		"ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu",
		"te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma",
		"mi", "mu", "me", "mo", "ya", "yu", "yo", "ra", "ri", "ru", "re", "ro", "wa",
		"wo", "n", "ga", "gi", "gu", "ge", "go", "za", "ji", "zu", "ze", "zo",
		"da", "ji", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu",
		"pe", "po", "kya", "gya", "kyu", "gyu", "kyo", "gyo", "sha", "ja", "shu",
		"ju", "sho", "jo", "nya", "nyu", "nyo", "cha", "chu", "cho", "hya", "bya", "hyu", "byu",
		"hyo", "byo", "pya", "pyu", "pyo",     "ba", "bo", "bai", "bei", "bao", "ban", "ben", "bang", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bu",
    "pa", "po", "pai", "pei", "pao", "pou", "pan", "pen", "pang", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "pu",
    "ma", "mo", "me", "mai", "mei", "mao", "mou", "man", "men", "mang", "meng", "mi", "mian", "miao", "mie", "min", "ming", "mu",
    "fa", "fo", "fei", "fou", "fan", "fen", "fang", "feng", "fu",
    "da", "de", "dai", "dei", "dao", "dou", "dan", "dang", "deng", "di", "dia", "dian", "diao", "die", "ding", "diu", "dong", "du", "duan", "dui", "dun", "duo",
    "ta", "te", "tai", "tei", "tao", "tou", "tan", "tang", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tu", "tuan", "tui", "tun", "tuo",
    "na", "ne", "nai", "nei", "nao", "nou", "nan", "nen", "nang", "neng", "ni", "nian", "niao", "nie", "nin", "ning", "niu", "nong", "nu", "nuan", "nüe", "nun", "nuo",
    "la", "le", "lai", "lei", "lao", "lou", "lan", "lang", "leng", "li", "lia", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lu", "luan", "lun", "lü", "lüe", "luo",
    "ga", "ge", "gai", "gei", "gao", "gou", "gan", "gen", "gang", "geng", "gong", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo",
    "ka", "ke", "kai", "kei", "kao", "kou", "kan", "ken", "kang", "keng", "kong", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo",
    "ha", "he", "hai", "hei", "hao", "hou", "han", "hen", "hang", "heng", "hong", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo",
    "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun",
    "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun",
    "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun",
    "zhi", "chi", "shi", "ri", "zi", "ci", "si",
    "zha", "zhe", "zhai", "zhei", "zhao", "zhou", "zhan", "zhen", "zhang", "zheng", "zhong", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo",
    "cha", "che", "chai", "chao", "chou", "chan", "chen", "chang", "cheng", "chong", "chu", "chua", "chuai", "chuan", "chuang", "chui", "chun", "chuo",
    "sha", "she", "shai", "shei", "shao", "shou", "shan", "shen", "shang", "sheng", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo",
    "re", "rao", "rou", "ran", "ren", "rang", "reng", "rong", "ru", "ruan", "rui", "run", "ruo",
    "za", "ze", "zai", "zei", "zao", "zou", "zan", "zen", "zang", "zeng", "zong", "zu", "zuan", "zui", "zun", "zuo",
    "ca", "ce", "cai", "cao", "cou", "can", "cen", "cang", "ceng", "cong", "cu", "cuan", "cui", "cun", "cuo",
    "sa", "se", "sai", "sao", "sou", "san", "sen", "sang", "seng", "song", "su", "suan", "sui", "sun", "suo",
    "ya", "yao", "ye", "yi", "yin", "ying", "you", "yu", "yuan", "yue", "yun",
    "wa", "wo", "wai", "wei", "wan", "wen", "wang", "weng", "wu",
    "er")
