Install Script for TeXLive2019 to Windows on AppVeyor
==============================================================

[![Build status](https://ci.appveyor.com/api/projects/status/a8bwa69ugimoosfs?svg=true)](https://ci.appveyor.com/project/y-yu/install-tex-appveyor)

## How to use

```yml
image: Visual Studio 2015
environment:
  PATH: '%PATH%;C:\texlive\bin\win32'
install:
  - curl -O https://raw.githubusercontent.com/y-yu/install-tex-appveyor/master/install-tex.sh
  - bash ./install-tex.sh
cache:
  - 'C:\texlive\texmf-var\fonts\cache'
build_script:
  - tlmgr install collection-langjapanese
  - platex -v
```
