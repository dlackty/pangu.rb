# pangu.rb

[![Build Status](https://travis-ci.org/dlackty/pangu.rb.svg?branch=master)](https://travis-ci.org/dlackty/pangu.rb)
[![Coverage Status](https://coveralls.io/repos/dlackty/pangu.rb/badge.svg)](https://coveralls.io/r/dlackty/pangu.rb)

Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean), half-width English, digit and symbol characters.

* JavaScript version: [pangu.js](https://github.com/vinta/paranoid-auto-spacing)
* Node.js version: [pangu.node](https://github.com/huei90/pangu.node)
* Python version: [pangu.py](https://github.com/vinta/pangu.py)
* Java version: [pangu.java](https://github.com/vinta/pangu.java)


## Installation

```bash
gem install pangu
```

## Usage

```ruby
require "pangu"

Pangu.spacing("請問Jackie的鼻子有幾個？123個！")
=> "請問 Jackie 的鼻子有幾個？123 個！"
Pangu.spacing("主要成份：眼鏡95%、水3%、垃圾2%。")                                                                                                                                        
=> "主要成份：眼鏡 95%、水 3%、垃圾 2%。"
Pangu.spacing("新阿姆斯特朗炫風噴射阿姆斯特朗砲")
=> "新阿姆斯特朗炫風噴射阿姆斯特朗砲"
```

## License

Copyright (c) 2015 Richard Lee. See LICENSE.txt for details.
