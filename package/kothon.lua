--[[ 
  This file is part of Kothon LuaLaTeX package that utilizes LuaAvroPhonetic.
  
  This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
  If a copy of the MPL was not distributed with this file,
  You can obtain one at https://mozilla.org/MPL/2.0/.
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  The bindings for LuaLaTex are part of Kothon.
    The Initial Developer of This Code is
    Mohammad Ishrak Abedin <ishrak.abedin.a1@gmail.com> <ishrakabedin@iut-dhaka.edu>
    Copyright (c) 2024 Mohammad Ishrak Abedin
    
  This Translated and Optimized Code of Avro Phonetic is LuaAvroPhonetic.
    The Initial Developer of This Code is
    Mohammad Ishrak Abedin <ishrak.abedin.a1@gmail.com> <ishrakabedin@iut-dhaka.edu>
    Copyright (c) 2024 Mohammad Ishrak Abedin

  The Original Code is jsAvroPhonetic.
    The Initial Developer of the Original Code is 
    Rifat Nabi <to.rifat@gmail.com>
    Copyright (c) OmicronLab <http://www.omicronlab.com>. All Rights Reserved.
    Contributor(s): Mehdi Hasan <mhasan@omicronlab.com>
--]]

-- Code for Trie

local Trie = {}
Trie.__index = Trie

function Trie:new(patterns)
    local instance = setmetatable({}, Trie)
    instance.root = { key = 0, pattern = nil, next = {} }
    instance:buildTrie(patterns)
    return instance
end

function Trie:buildTrie(patterns)
    self.root = { key = 0, pattern = nil, next = {} }
    for _, pattern in ipairs(patterns) do
        local currentTrie = self.root
        local find = pattern.find
        for j = 1, #find do
            local char = find:byte(j)

            if currentTrie.next[char] == nil then
                currentTrie.next[char] = { key = char, pattern = nil, next = {} }
            end
            currentTrie = currentTrie.next[char]

            if j == #find then
                currentTrie.pattern = pattern
            end
        end
    end
end

function Trie:findInTrie(str)
    local currentTrie = self.root
    for i = 1, #str do
        local char = str:byte(i)
        if currentTrie.next[char] == nil then
            break
        end
        currentTrie = currentTrie.next[char]
    end

    return currentTrie.pattern
end

-- Data for Avro Phonetic

local Data = {
    patterns = {
        {
            find = "bhl",
            replace = "ভ্ল"
        },
        {
            find = "psh",
            replace = "পশ"
        },
        {
            find = "bdh",
            replace = "ব্ধ"
        },
        {
            find = "bj",
            replace = "ব্জ"
        },
        {
            find = "bd",
            replace = "ব্দ"
        },
        {
            find = "bb",
            replace = "ব্ব"
        },
        {
            find = "bl",
            replace = "ব্ল"
        },
        {
            find = "bh",
            replace = "ভ"
        },
        {
            find = "vl",
            replace = "ভ্ল"
        },
        {
            find = "b",
            replace = "ব"
        },
        {
            find = "v",
            replace = "ভ"
        },
        {
            find = "cNG",
            replace = "চ্ঞ"
        },
        {
            find = "cch",
            replace = "চ্ছ"
        },
        {
            find = "cc",
            replace = "চ্চ"
        },
        {
            find = "ch",
            replace = "ছ"
        },
        {
            find = "c",
            replace = "চ"
        },
        {
            find = "dhn",
            replace = "ধ্ন"
        },
        {
            find = "dhm",
            replace = "ধ্ম"
        },
        {
            find = "dgh",
            replace = "দ্ঘ"
        },
        {
            find = "ddh",
            replace = "দ্ধ"
        },
        {
            find = "dbh",
            replace = "দ্ভ"
        },
        {
            find = "dv",
            replace = "দ্ভ"
        },
        {
            find = "dm",
            replace = "দ্ম"
        },
        {
            find = "DD",
            replace = "ড্ড"
        },
        {
            find = "Dh",
            replace = "ঢ"
        },
        {
            find = "dh",
            replace = "ধ"
        },
        {
            find = "dg",
            replace = "দ্গ"
        },
        {
            find = "dd",
            replace = "দ্দ"
        },
        {
            find = "D",
            replace = "ড"
        },
        {
            find = "d",
            replace = "দ"
        },
        {
            find = "...",
            replace = "..."
        },
        {
            find = ".`",
            replace = "."
        },
        {
            find = "..",
            replace = "।।"
        },
        {
            find = ".",
            replace = "।"
        },
        {
            find = "ghn",
            replace = "ঘ্ন"
        },
        {
            find = "Ghn",
            replace = "ঘ্ন"
        },
        {
            find = "gdh",
            replace = "গ্ধ"
        },
        {
            find = "Gdh",
            replace = "গ্ধ"
        },
        {
            find = "gN",
            replace = "গ্ণ"
        },
        {
            find = "GN",
            replace = "গ্ণ"
        },
        {
            find = "gn",
            replace = "গ্ন"
        },
        {
            find = "Gn",
            replace = "গ্ন"
        },
        {
            find = "gm",
            replace = "গ্ম"
        },
        {
            find = "Gm",
            replace = "গ্ম"
        },
        {
            find = "gl",
            replace = "গ্ল"
        },
        {
            find = "Gl",
            replace = "গ্ল"
        },
        {
            find = "gg",
            replace = "জ্ঞ"
        },
        {
            find = "GG",
            replace = "জ্ঞ"
        },
        {
            find = "Gg",
            replace = "জ্ঞ"
        },
        {
            find = "gG",
            replace = "জ্ঞ"
        },
        {
            find = "gh",
            replace = "ঘ"
        },
        {
            find = "Gh",
            replace = "ঘ"
        },
        {
            find = "g",
            replace = "গ"
        },
        {
            find = "G",
            replace = "গ"
        },
        {
            find = "hN",
            replace = "হ্ণ"
        },
        {
            find = "hn",
            replace = "হ্ন"
        },
        {
            find = "hm",
            replace = "হ্ম"
        },
        {
            find = "hl",
            replace = "হ্ল"
        },
        {
            find = "h",
            replace = "হ"
        },
        {
            find = "jjh",
            replace = "জ্ঝ"
        },
        {
            find = "jNG",
            replace = "জ্ঞ"
        },
        {
            find = "jh",
            replace = "ঝ"
        },
        {
            find = "jj",
            replace = "জ্জ"
        },
        {
            find = "j",
            replace = "জ"
        },
        {
            find = "J",
            replace = "জ"
        },
        {
            find = "kkhN",
            replace = "ক্ষ্ণ"
        },
        {
            find = "kShN",
            replace = "ক্ষ্ণ"
        },
        {
            find = "kkhm",
            replace = "ক্ষ্ম"
        },
        {
            find = "kShm",
            replace = "ক্ষ্ম"
        },
        {
            find = "kxN",
            replace = "ক্ষ্ণ"
        },
        {
            find = "kxm",
            replace = "ক্ষ্ম"
        },
        {
            find = "kkh",
            replace = "ক্ষ"
        },
        {
            find = "kSh",
            replace = "ক্ষ"
        },
        {
            find = "ksh",
            replace = "কশ"
        },
        {
            find = "kx",
            replace = "ক্ষ"
        },
        {
            find = "kk",
            replace = "ক্ক"
        },
        {
            find = "kT",
            replace = "ক্ট"
        },
        {
            find = "kt",
            replace = "ক্ত"
        },
        {
            find = "kl",
            replace = "ক্ল"
        },
        {
            find = "ks",
            replace = "ক্স"
        },
        {
            find = "kh",
            replace = "খ"
        },
        {
            find = "k",
            replace = "ক"
        },
        {
            find = "lbh",
            replace = "ল্ভ"
        },
        {
            find = "ldh",
            replace = "ল্ধ"
        },
        {
            find = "lkh",
            replace = "লখ"
        },
        {
            find = "lgh",
            replace = "লঘ"
        },
        {
            find = "lph",
            replace = "লফ"
        },
        {
            find = "lk",
            replace = "ল্ক"
        },
        {
            find = "lg",
            replace = "ল্গ"
        },
        {
            find = "lT",
            replace = "ল্ট"
        },
        {
            find = "lD",
            replace = "ল্ড"
        },
        {
            find = "lp",
            replace = "ল্প"
        },
        {
            find = "lv",
            replace = "ল্ভ"
        },
        {
            find = "lm",
            replace = "ল্ম"
        },
        {
            find = "ll",
            replace = "ল্ল"
        },
        {
            find = "lb",
            replace = "ল্ব"
        },
        {
            find = "l",
            replace = "ল"
        },
        {
            find = "mth",
            replace = "ম্থ"
        },
        {
            find = "mph",
            replace = "ম্ফ"
        },
        {
            find = "mbh",
            replace = "ম্ভ"
        },
        {
            find = "mpl",
            replace = "মপ্ল"
        },
        {
            find = "mn",
            replace = "ম্ন"
        },
        {
            find = "mp",
            replace = "ম্প"
        },
        {
            find = "mv",
            replace = "ম্ভ"
        },
        {
            find = "mm",
            replace = "ম্ম"
        },
        {
            find = "ml",
            replace = "ম্ল"
        },
        {
            find = "mb",
            replace = "ম্ব"
        },
        {
            find = "mf",
            replace = "ম্ফ"
        },
        {
            find = "m",
            replace = "ম"
        },
        {
            find = "0",
            replace = "০"
        },
        {
            find = "1",
            replace = "১"
        },
        {
            find = "2",
            replace = "২"
        },
        {
            find = "3",
            replace = "৩"
        },
        {
            find = "4",
            replace = "৪"
        },
        {
            find = "5",
            replace = "৫"
        },
        {
            find = "6",
            replace = "৬"
        },
        {
            find = "7",
            replace = "৭"
        },
        {
            find = "8",
            replace = "৮"
        },
        {
            find = "9",
            replace = "৯"
        },
        {
            find = "NgkSh",
            replace = "ঙ্ক্ষ"
        },
        {
            find = "Ngkkh",
            replace = "ঙ্ক্ষ"
        },
        {
            find = "NGch",
            replace = "ঞ্ছ"
        },
        {
            find = "Nggh",
            replace = "ঙ্ঘ"
        },
        {
            find = "Ngkh",
            replace = "ঙ্খ"
        },
        {
            find = "NGjh",
            replace = "ঞ্ঝ"
        },
        {
            find = "ngOU",
            replace = "ঙ্গৌ"
        },
        {
            find = "ngOI",
            replace = "ঙ্গৈ"
        },
        {
            find = "Ngkx",
            replace = "ঙ্ক্ষ"
        },
        {
            find = "NGc",
            replace = "ঞ্চ"
        },
        {
            find = "nch",
            replace = "ঞ্ছ"
        },
        {
            find = "njh",
            replace = "ঞ্ঝ"
        },
        {
            find = "ngh",
            replace = "ঙ্ঘ"
        },
        {
            find = "Ngk",
            replace = "ঙ্ক"
        },
        {
            find = "Ngx",
            replace = "ঙ্ষ"
        },
        {
            find = "Ngg",
            replace = "ঙ্গ"
        },
        {
            find = "Ngm",
            replace = "ঙ্ম"
        },
        {
            find = "NGj",
            replace = "ঞ্জ"
        },
        {
            find = "ndh",
            replace = "ন্ধ"
        },
        {
            find = "nTh",
            replace = "ন্ঠ"
        },
        {
            find = "NTh",
            replace = "ণ্ঠ"
        },
        {
            find = "nth",
            replace = "ন্থ"
        },
        {
            find = "nkh",
            replace = "ঙ্খ"
        },
        {
            find = "ngo",
            replace = "ঙ্গ"
        },
        {
            find = "nga",
            replace = "ঙ্গা"
        },
        {
            find = "ngi",
            replace = "ঙ্গি"
        },
        {
            find = "ngI",
            replace = "ঙ্গী"
        },
        {
            find = "ngu",
            replace = "ঙ্গু"
        },
        {
            find = "ngU",
            replace = "ঙ্গূ"
        },
        {
            find = "nge",
            replace = "ঙ্গে"
        },
        {
            find = "ngO",
            replace = "ঙ্গো"
        },
        {
            find = "NDh",
            replace = "ণ্ঢ"
        },
        {
            find = "nsh",
            replace = "নশ"
        },
        {
            find = "Ngr",
            replace = "ঙর"
        },
        {
            find = "NGr",
            replace = "ঞর"
        },
        {
            find = "ngr",
            replace = "ংর"
        },
        {
            find = "nj",
            replace = "ঞ্জ"
        },
        {
            find = "Ng",
            replace = "ঙ"
        },
        {
            find = "NG",
            replace = "ঞ"
        },
        {
            find = "nk",
            replace = "ঙ্ক"
        },
        {
            find = "ng",
            replace = "ং"
        },
        {
            find = "nn",
            replace = "ন্ন"
        },
        {
            find = "NN",
            replace = "ণ্ণ"
        },
        {
            find = "Nn",
            replace = "ণ্ন"
        },
        {
            find = "nm",
            replace = "ন্ম"
        },
        {
            find = "Nm",
            replace = "ণ্ম"
        },
        {
            find = "nd",
            replace = "ন্দ"
        },
        {
            find = "nT",
            replace = "ন্ট"
        },
        {
            find = "NT",
            replace = "ণ্ট"
        },
        {
            find = "nD",
            replace = "ন্ড"
        },
        {
            find = "ND",
            replace = "ণ্ড"
        },
        {
            find = "nt",
            replace = "ন্ত"
        },
        {
            find = "ns",
            replace = "ন্স"
        },
        {
            find = "nc",
            replace = "ঞ্চ"
        },
        {
            find = "n",
            replace = "ন"
        },
        {
            find = "N",
            replace = "ণ"
        },
        {
            find = "OI`",
            replace = "ৈ"
        },
        {
            find = "OU`",
            replace = "ৌ"
        },
        {
            find = "O`",
            replace = "ো"
        },
        {
            find = "OI",
            replace = "ৈ",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        }
                    },
                    replace = "ঐ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "ঐ"
                }
            }
        },
        {
            find = "OU",
            replace = "ৌ",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        }
                    },
                    replace = "ঔ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "ঔ"
                }
            }
        },
        {
            find = "O",
            replace = "ো",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        }
                    },
                    replace = "ও"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "ও"
                }
            }
        },
        {
            find = "phl",
            replace = "ফ্ল"
        },
        {
            find = "pT",
            replace = "প্ট"
        },
        {
            find = "pt",
            replace = "প্ত"
        },
        {
            find = "pn",
            replace = "প্ন"
        },
        {
            find = "pp",
            replace = "প্প"
        },
        {
            find = "pl",
            replace = "প্ল"
        },
        {
            find = "ps",
            replace = "প্স"
        },
        {
            find = "ph",
            replace = "ফ"
        },
        {
            find = "fl",
            replace = "ফ্ল"
        },
        {
            find = "f",
            replace = "ফ"
        },
        {
            find = "p",
            replace = "প"
        },
        {
            find = "rri`",
            replace = "ৃ"
        },
        {
            find = "rri",
            replace = "ৃ",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        }
                    },
                    replace = "ঋ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "ঋ"
                }
            }
        },
        {
            find = "rrZ",
            replace = "রর‍্য"
        },
        {
            find = "rry",
            replace = "রর‍্য"
        },
        {
            find = "rZ",
            replace = "র‍্য",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "r"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "y"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "w"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "x"
                        }
                    },
                    replace = "্র্য"
                }
            }
        },
        {
            find = "ry",
            replace = "র‍্য",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "r"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "y"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "w"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "x"
                        }
                    },
                    replace = "্র্য"
                }
            }
        },
        {
            find = "rr",
            replace = "রর",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!vowel"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "r"
                        },
                        {
                            type = "suffix",
                            scope = "!punctuation"
                        }
                    },
                    replace = "র্"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "r"
                        }
                    },
                    replace = "্রর"
                }
            }
        },
        {
            find = "Rg",
            replace = "ড়্গ"
        },
        {
            find = "Rh",
            replace = "ঢ়"
        },
        {
            find = "R",
            replace = "ড়"
        },
        {
            find = "r",
            replace = "র",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "r"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "y"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "w"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "x"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "Z"
                        }
                    },
                    replace = "্র"
                }
            }
        },
        {
            find = "shch",
            replace = "শ্ছ"
        },
        {
            find = "ShTh",
            replace = "ষ্ঠ"
        },
        {
            find = "Shph",
            replace = "ষ্ফ"
        },
        {
            find = "Sch",
            replace = "শ্ছ"
        },
        {
            find = "skl",
            replace = "স্ক্ল"
        },
        {
            find = "skh",
            replace = "স্খ"
        },
        {
            find = "sth",
            replace = "স্থ"
        },
        {
            find = "sph",
            replace = "স্ফ"
        },
        {
            find = "shc",
            replace = "শ্চ"
        },
        {
            find = "sht",
            replace = "শ্ত"
        },
        {
            find = "shn",
            replace = "শ্ন"
        },
        {
            find = "shm",
            replace = "শ্ম"
        },
        {
            find = "shl",
            replace = "শ্ল"
        },
        {
            find = "Shk",
            replace = "ষ্ক"
        },
        {
            find = "ShT",
            replace = "ষ্ট"
        },
        {
            find = "ShN",
            replace = "ষ্ণ"
        },
        {
            find = "Shp",
            replace = "ষ্প"
        },
        {
            find = "Shf",
            replace = "ষ্ফ"
        },
        {
            find = "Shm",
            replace = "ষ্ম"
        },
        {
            find = "spl",
            replace = "স্প্ল"
        },
        {
            find = "sk",
            replace = "স্ক"
        },
        {
            find = "Sc",
            replace = "শ্চ"
        },
        {
            find = "sT",
            replace = "স্ট"
        },
        {
            find = "st",
            replace = "স্ত"
        },
        {
            find = "sn",
            replace = "স্ন"
        },
        {
            find = "sp",
            replace = "স্প"
        },
        {
            find = "sf",
            replace = "স্ফ"
        },
        {
            find = "sm",
            replace = "স্ম"
        },
        {
            find = "sl",
            replace = "স্ল"
        },
        {
            find = "sh",
            replace = "শ"
        },
        {
            find = "Sc",
            replace = "শ্চ"
        },
        {
            find = "St",
            replace = "শ্ত"
        },
        {
            find = "Sn",
            replace = "শ্ন"
        },
        {
            find = "Sm",
            replace = "শ্ম"
        },
        {
            find = "Sl",
            replace = "শ্ল"
        },
        {
            find = "Sh",
            replace = "ষ"
        },
        {
            find = "s",
            replace = "স"
        },
        {
            find = "S",
            replace = "শ"
        },
        {
            find = "oo`",
            replace = "ু"
        },
        {
            find = "oo",
            replace = "ু",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "উ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "উ"
                }
            }
        },
        {
            find = "o`",
            replace = ""
        },
        {
            find = "oZ",
            replace = "অ্য"
        },
        {
            find = "o",
            replace = "",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "vowel"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "o"
                        }
                    },
                    replace = "ও"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "vowel"
                        },
                        {
                            type = "prefix",
                            scope = "exact",
                            value = "o"
                        }
                    },
                    replace = "অ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "অ"
                }
            }
        },
        {
            find = "tth",
            replace = "ত্থ"
        },
        {
            find = "t``",
            replace = "ৎ"
        },
        {
            find = "TT",
            replace = "ট্ট"
        },
        {
            find = "Tm",
            replace = "ট্ম"
        },
        {
            find = "Th",
            replace = "ঠ"
        },
        {
            find = "tn",
            replace = "ত্ন"
        },
        {
            find = "tm",
            replace = "ত্ম"
        },
        {
            find = "th",
            replace = "থ"
        },
        {
            find = "tt",
            replace = "ত্ত"
        },
        {
            find = "T",
            replace = "ট"
        },
        {
            find = "t",
            replace = "ত"
        },
        {
            find = "aZ",
            replace = "অ্যা"
        },
        {
            find = "AZ",
            replace = "অ্যা"
        },
        {
            find = "a`",
            replace = "া"
        },
        {
            find = "A`",
            replace = "া"
        },
        {
            find = "a",
            replace = "া",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "আ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!exact",
                            value = "a"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "য়া"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "exact",
                            value = "a"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "আ"
                }
            }
        },
        {
            find = "i`",
            replace = "ি"
        },
        {
            find = "i",
            replace = "ি",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ই"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ই"
                }
            }
        },
        {
            find = "I`",
            replace = "ী"
        },
        {
            find = "I",
            replace = "ী",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঈ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঈ"
                }
            }
        },
        {
            find = "u`",
            replace = "ু"
        },
        {
            find = "u",
            replace = "ু",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "উ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "উ"
                }
            }
        },
        {
            find = "U`",
            replace = "ূ"
        },
        {
            find = "U",
            replace = "ূ",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঊ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঊ"
                }
            }
        },
        {
            find = "ee`",
            replace = "ী"
        },
        {
            find = "ee",
            replace = "ী",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঈ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "ঈ"
                }
            }
        },
        {
            find = "e`",
            replace = "ে"
        },
        {
            find = "e",
            replace = "ে",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "এ"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "!exact",
                            value = "`"
                        }
                    },
                    replace = "এ"
                }
            }
        },
        {
            find = "z",
            replace = "য"
        },
        {
            find = "Z",
            replace = "্য"
        },
        {
            find = "y",
            replace = "্য",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "!consonant"
                        },
                        {
                            type = "prefix",
                            scope = "!punctuation"
                        }
                    },
                    replace = "য়"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "ইয়"
                }
            }
        },
        {
            find = "Y",
            replace = "য়"
        },
        {
            find = "q",
            replace = "ক"
        },
        {
            find = "w",
            replace = "ও",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        },
                        {
                            type = "suffix",
                            scope = "vowel"
                        }
                    },
                    replace = "ওয়"
                },
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "consonant"
                        }
                    },
                    replace = "্ব"
                }
            }
        },
        {
            find = "x",
            replace = "ক্স",
            rules = {
                {
                    matches = {
                        {
                            type = "prefix",
                            scope = "punctuation"
                        }
                    },
                    replace = "এক্স"
                }
            }
        },
        {
            find = ":`",
            replace = ":"
        },
        {
            find = ":",
            replace = "ঃ"
        },
        {
            find = "^`",
            replace = "^"
        },
        {
            find = "^",
            replace = "ঁ"
        },
        {
            find = ",,",
            replace = "্‌"
        },
        {
            find = ",",
            replace = ","
        },
        {
            find = "$",
            replace = "৳"
        },
        {
            find = "`",
            replace = ""
        }
    },
    vowel = "aeiou",
    consonant = "bcdfghjklmnpqrstvwxyz",
    casesensitive = "oiudgjnrstyz"
}

-- Avro Phonetic Parser

local OmicronLab_Avro_Phonetic = {}
OmicronLab_Avro_Phonetic.__index = OmicronLab_Avro_Phonetic

-- Constructor
function OmicronLab_Avro_Phonetic:new(userdata)
    local instance = setmetatable({}, OmicronLab_Avro_Phonetic)
    instance.data = userdata or Data
    instance.trie = Trie:new(instance.data.patterns)
    return instance
end

-- Method to parse the input string
function OmicronLab_Avro_Phonetic:parse(input)
    local fixed = self:fixString(input)
    local output = {}
    local cur = 1

    while cur <= #fixed do
        local start, end_pos, prev = cur, cur + 1, cur - 1

        -- max look up is 5 characters as the largest pattern is of size 5
        local pattern = self.trie:findInTrie(fixed:sub(start, start + 4))
        if pattern ~= nil then
            end_pos = cur + #pattern.find - 1
            prev = start - 1
            local matched = false

            if pattern.rules then
                for j = 1, #pattern.rules do
                    local rule = pattern.rules[j]
                    local replace = true

                    for k = 1, #rule.matches do
                        local match = rule.matches[k]
                        local chk

                        if match.type == "suffix" then
                            chk = end_pos + 1
                        else
                            chk = prev
                        end

                        match.negative = match.negative or false
                        if match.scope:sub(1, 1) == "!" then
                            match.negative = true
                            match.scope = match.scope:sub(2)
                        end

                        match.value = match.value or ""

                        if match.scope == "punctuation" then
                            if (not (
                                        ((chk < 1 and match.type == "prefix") or
                                            (chk > #fixed and match.type == "suffix") or
                                            self:isPunctuation(fixed:sub(chk, chk))))
                                    ~= match.negative
                                ) then
                                replace = false
                                break
                            end
                        elseif match.scope == "vowel" then
                            if (not (
                                    (
                                        (chk >= 1 and match.type == "prefix") or
                                        (chk <= #fixed and match.type == "suffix")
                                    ) and
                                    self:isVowel(fixed:sub(chk, chk))
                                )) ~= match.negative then
                                replace = false
                                break
                            end
                        elseif match.scope == "consonant" then
                            if (not (
                                    (
                                        (chk >= 1 and match.type == "prefix") or
                                        (chk <= #fixed and match.type == "suffix")
                                    ) and
                                    self:isConsonant(fixed:sub(chk, chk))
                                )) ~= match.negative then
                                replace = false
                                break
                            end
                        elseif match.scope == "exact" then
                            local s, e
                            if match.type == "suffix" then
                                s = end_pos + 1
                                e = end_pos + #match.value
                            else
                                s = start - #match.value
                                e = start - 1
                            end
                            if not self:isExact(match.value, fixed, s, e, match.negative) then
                                replace = false
                                break
                            end
                        end
                    end

                    if replace then
                        table.insert(output, rule.replace)
                        cur = end_pos
                        matched = true
                        break
                    end
                end
            end

            if not matched then
                table.insert(output, pattern.replace)
                cur = end_pos
                matched = true
            end
        else
            table.insert(output, fixed:sub(cur, cur))
        end

        cur = cur + 1
    end

    return table.concat(output)
end

-- Method to fix the input string
function OmicronLab_Avro_Phonetic:fixString(input)
    local fixed = {}
    for i = 1, #input do
        local cChar = input:sub(i, i)
        if self:isCaseSensitive(cChar) then
            table.insert(fixed, cChar)
        else
            table.insert(fixed, cChar:lower())
        end
    end
    return table.concat(fixed)
end

-- Method to check if a character is a vowel
function OmicronLab_Avro_Phonetic:isVowel(c)
    return self.data.vowel:find(c:lower(), 1, true) ~= nil
end

-- Method to check if a character is a consonant
function OmicronLab_Avro_Phonetic:isConsonant(c)
    return self.data.consonant:find(c:lower(), 1, true) ~= nil
end

-- Method to check if a character is punctuation
function OmicronLab_Avro_Phonetic:isPunctuation(c)
    return not (self:isVowel(c) or self:isConsonant(c))
end

-- Method to check for an exact match
function OmicronLab_Avro_Phonetic:isExact(needle, heystack, start, end_pos, not_flag)
    return (start >= 1 and end_pos <= #heystack and heystack:sub(start, end_pos) == needle) ~= not_flag
end

-- Method to check if a character is case-sensitive
function OmicronLab_Avro_Phonetic:isCaseSensitive(c)
    return self.data.casesensitive:find(c:lower(), 1, true) ~= nil
end

-- Command Splitter

local CommandSplitter = {}
CommandSplitter.__index = CommandSplitter
CommandSplitter.MODE_TEXT = 0
CommandSplitter.MODE_CMD = 1

function CommandSplitter.IsAlpha(charCode)
    local aCode = ("a"):byte(1)
    local zCode = ("z"):byte(1)
    local ACode = ("A"):byte(1)
    local ZCode = ("Z"):byte(1)
    return (charCode >= aCode and charCode <= zCode) or (charCode >= ACode and charCode <= ZCode)
end

function CommandSplitter.Split(str)
    local begin = 1
    local slices = {}
    local slashCode = ("\\"):byte(1)
    
    local currentMode = CommandSplitter.MODE_TEXT
    
    for i = 1, #str do
        local charCode = str:byte(i)
        if (currentMode == CommandSplitter.MODE_TEXT) then
            if (charCode == slashCode) then
                if (i > 1) then table.insert(slices, { text = str:sub(begin, i - 1), mode = CommandSplitter.MODE_TEXT }) end
                currentMode = CommandSplitter.MODE_CMD
                begin = i
            end
        elseif (currentMode == CommandSplitter.MODE_CMD) then
            if (charCode == slashCode) then
                table.insert(slices, { text = str:sub(begin, i - 1), mode = CommandSplitter.MODE_CMD })
                begin = i
            elseif (not CommandSplitter.IsAlpha(charCode)) then
                table.insert(slices, { text = str:sub(begin, i - 1), mode = CommandSplitter.MODE_CMD })
                currentMode = CommandSplitter.MODE_TEXT
                begin = i
            end
        end
    end
    table.insert(slices, {  text = str:sub(begin,#str), mode = currentMode })
    return slices
end

-- LaTeX Helper Class

AvroLaTeX = {}
AvroLaTeX.__index = AvroLaTeX

function AvroLaTeX.parse(str)
    local parser = OmicronLab_Avro_Phonetic:new(nil)
    local segments = {}
    local slices = CommandSplitter.Split(str)
    for index, value in ipairs(slices) do
        if value.mode == CommandSplitter.MODE_TEXT then
            table.insert(segments, parser:parse(value.text))
        elseif value.mode == CommandSplitter.MODE_CMD then
            table.insert(segments, value.text)
        end
    end
    return table.concat(segments)
end

-- Class for Bangla Enumerate

local Enumerator = {}
Enumerator.__index = Enumerator

function Enumerator:new(formatting)
    local instance = setmetatable({}, Enumerator)
    instance.formatting = formatting or { "s", "a", "i" }
    instance.stages = {}
    instance.currentStage = 0
    return instance
end

function Enumerator:ToRoman(num, lower)
    if lower == nil then lower = true end
    -- Define a table mapping decimal values to Roman numerals
    local romanTable = {
        { 1000, "M" },
        { 900,  "CM" },
        { 500,  "D" },
        { 400,  "CD" },
        { 100,  "C" },
        { 90,   "XC" },
        { 50,   "L" },
        { 40,   "XL" },
        { 10,   "X" },
        { 9,    "IX" },
        { 5,    "V" },
        { 4,    "IV" },
        { 1,    "I" }
    }

    -- Initialize an empty string to store the result
    local roman = ""

    -- Loop through the table and construct the Roman numeral
    for _, value in ipairs(romanTable) do
        local val, symbol = value[1], value[2]
        while num >= val do
            roman = roman .. symbol
            num = num - val
        end
    end

    if (lower) then roman = roman:lower() end
    return roman
end

function Enumerator:ToAlphabet(num, lower)
    if lower == nil then lower = true end
    -- Ensure the number wraps around after 26
    local alphabetIndex = (num - 1) % 26 + 1
    -- Convert the number to the corresponding letter
    local letter = string.char(("A"):byte(1) + alphabetIndex - 1)
    if (lower) then letter = letter:lower() end
    return letter
end

function Enumerator:ToBanglaAlphabet(num, consonants)
    if consonants == nil then consonants = true end
    -- Define the Bangla alphabet as a table of characters
    local banglaAlphabet = {}
    if consonants then
        banglaAlphabet = {
            "ক", "খ", "গ", "ঘ", "ঙ",
            "চ", "ছ", "জ", "ঝ", "ঞ",
            "ট", "ঠ", "ড", "ঢ", "ণ",
            "ত", "থ", "দ", "ধ", "ন",
            "প", "ফ", "ব", "ভ", "ম",
            "য", "র", "ল", "শ", "ষ",
            "স", "হ", "ড়", "ঢ়", "য়",
            "ৎ", "ং", "ঃ", "ঁ"
        }
    else
        banglaAlphabet = {
            "অ", "আ", "ই", "ঈ", "উ", "ঊ",
            "ঋ", "এ", "ঐ", "ও", "ঔ"
        }
    end

    -- Ensure the number wraps around after the length of the Bangla alphabet
    local alphabetIndex = (num - 1) % #banglaAlphabet + 1

    return banglaAlphabet[alphabetIndex]
end

function Enumerator:ToBanglaNumerals(num)
    -- Define a mapping from English numerals to Bangla numerals
    local englishToBangla = {
        ["0"] = "০",
        ["1"] = "১",
        ["2"] = "২",
        ["3"] = "৩",
        ["4"] = "৪",
        ["5"] = "৫",
        ["6"] = "৬",
        ["7"] = "৭",
        ["8"] = "৮",
        ["9"] = "৯"
    }

    -- Initialize an empty result string
    local result = {}

    -- Iterate over each character in the input string
    for char in tostring(num):gmatch(".") do
        -- If the character is a digit, map it to the Bangla numeral
        if englishToBangla[char] then
            table.insert(result, englishToBangla[char])
        else
            -- If it's not a digit, keep the character unchanged
            table.insert(result, char)
        end
    end

    return table.concat(result)
end

function Enumerator:NextStage()
    self.currentStage = self.currentStage + 1
    self.stages[self.currentStage] = 1
end

function Enumerator:PreviousStage()
    self.stages[self.currentStage] = 0
    self.currentStage = self.currentStage - 1
end

function Enumerator:NextValue()
    local value = self.stages[self.currentStage]
    self.stages[self.currentStage] = self.stages[self.currentStage] + 1
    return value
end

function Enumerator:NextValueFormatted()
    local fIndex = ((self.currentStage - 1) % #self.formatting) + 1
    local format = self.formatting[fIndex]

    if (format == "n" or format == "N") then
        return string.format("%s.", self:NextValue())
    elseif (format == "s" or format == "S") then
        return string.format("%s.", self:ToBanglaNumerals(self:NextValue()))
    elseif (format == "a") then
        return string.format("(%s)", self:ToAlphabet(self:NextValue(), true))
    elseif (format == "A") then
        return string.format("(%s)", self:ToAlphabet(self:NextValue(), false))
    elseif (format == "b") then
        return string.format("(%s)", self:ToBanglaAlphabet(self:NextValue(), true))
    elseif (format == "B") then
        return string.format("(%s)", self:ToBanglaAlphabet(self:NextValue(), false))
    elseif (format == "i") then
        return string.format("%s.", self:ToRoman(self:NextValue(), true))
    elseif (format == "I") then
        return string.format("%s.", self:ToRoman(self:NextValue(), false))
    else
        return ("O)")
    end
end

function Enumerator:Reset()
    self.stages = {}
    self.currentStage = 0
end

function Enumerator:GetCurrentStage()
    return self.currentStage
end

-- Initializion of Bangla enum
BNenum = Enumerator:new({ "s", "b", "B" })
