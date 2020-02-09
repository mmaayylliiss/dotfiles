<p align="center">
  <img src="documentation-images/README-header.gif" alt="">
</p>
<p align="center">
  This is <strong>my local configuration</strong>
  <br>
  for working on web stuff on a Mac.
</p>

- - -

## 📝 Table of contents
- [**Prerequisites**](#prerequisites)
- [**Commands**](#commands)
- [**Software manual configuration**](#software-manual-configuration)
  - [**Font Book**](#font-book)
  - [**Sublime Text**](#sublime-text)
  - [**iTerm**](#iterm)
  - [**Firefox**](#firefox)
  - [**Google Chrome**](#google-chrome)
  - [**Sketch**](#sketch)
  - [**Adobe Creative Cloud**](#adobe-creative-cloud)
  - [**Mail**](#mail)
- [**License**](#license)

- - -

<a name="prerequisites"></a>
## ⚙️ Prerequisites
- [**Brew**](https://brew.sh)
- [**Prezto**](https://github.com/sorin-ionescu/prezto)

<a name="commands"></a>
## ⌨️ Commands
### Help
```makefile
## List available commands

make
```

<a name="software-manual-configuration"></a>
## 🔧 Software manual configuration

<a name="font-book"></a>
![](documentation-images/font-book.gif)

The monospace font I use for coding is [**JetBrains Mono**](https://www.jetbrains.com/lp/mono/).

<a name="sublime-text"></a>
![](documentation-images/sublime-text.gif)

Install [**Package Control**](https://packagecontrol.io/installation)

<a name="iterm"></a>
![](documentation-images/iterm.gif)

#### Appearance > General
- Theme: Dark (High Contrast)
- Tab bar location: Top
- Status bar location: Bottom

#### Appearance > Windows
Uncheck all

#### Appearance > Dimming
- ☑️ Dim inactive split panes
- ☑️ Dimming affects only text, not background.

#### Profiles > Default > General
Working Directory: Reuse previous session’s directory

#### Profiles > Default > Text
Font: JetBrains Mono, Regular, 18

#### Profiles > Default > Window
Settings for New Windows: Columns: 180, Rows: 42

#### Profiles > Default > Session
☑️ Status bar enabled

#### Profiles > Default > Session > Status bar enabled > Configure Status Bar > Advanced…
- Set all Colors to `000000`
- Font: JetBrains Mono, Regular, 14
- ☑️ Prefer tight packing to stable positioning

#### Profiles > Default > Session > Status bar enabled > Configure Status Bar
1. Drag and drop desired Components in Active Components dropzone
2. Activate 🌈 Auto-Rainbow

<a name="firefox"></a>
![](documentation-images/firefox.gif)

1. Disable HTTP Cache when toolbox is open
2. Set Firefox as default browser
3. Set Desktop as destination folder in *Downloads*

<a name="google-chrome"></a>
![](documentation-images/google-chrome.gif)

1. Disable Chrome cache while DevTools is open
2. Set Desktop as destination folder in *Downloads*

<a name="sketch"></a>
![](documentation-images/sketch.gif)

1. Install [**Runner**](https://sketchrunner.com) plugin
2. Install the following plugins using Runner:
  - [**Find and Replace**](https://github.com/thierryc/Sketch-Find-And-Replace)
  - [**Fontily**](https://github.com/partyka1/Fontily)
  - [**Replace Colour**](https://github.com/lewishowles/sketch-replace-colour)
  - [**Style Inventory**](https://github.com/getflourish/Sketch-Style-Inventory)
  - [**Symbol Organizer**](https://github.com/sonburn/symbol-organizer)
  - [**Unused Style Remover**](https://github.com/sonburn/unused-style-remover)

<a name="adobe-creative-cloud"></a>
![](documentation-images/adobe-creative-cloud.gif)

1. Install these apps:
  - **Photoshop**
  - **Illustrator**
  - **InDesign**
  - **Acrobat**
2. Install Photoshop [**GuideGuide**](https://guideguide.me/documentation/) extension
3. Install [Photoshop additional scripts](adobe-creative-cloud/photoshop)
4. Install [InDesign additional scripts](adobe-creative-cloud/indesign)

<a name="mail"></a>
![](documentation-images/mail.gif)

Set a [mail signature](https://github.com/wearemd/wearemd_mail_signatures) for each account

<a name="license"></a>
## 📄 License
**My dotfiles** are licensed under the [GNU General Public License v3.0](LICENSE).
