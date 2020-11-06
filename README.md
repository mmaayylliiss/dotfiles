<p align="center">
  <img src="documentation-images/README-header.gif" alt="">
</p>
<p align="center">
  This is <strong>my local configuration</strong>
  <br>
  for working on web stuff on a <strong>Mac<strong>.
</p>

- - -

## 📝 Table of contents
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

The monospace font I use for coding is [**JetBrains Mono**](https://www.jetbrains.com/lp/mono/). For emoji icons I use [**JoyPixels**](https://www.joypixels.com) (replacing Apple Color Emoji system font).

<a name="sublime-text"></a>
![](documentation-images/sublime-text.gif)

Install [**Package Control**](https://packagecontrol.io/installation)

<a name="iterm"></a>
![](documentation-images/iterm.gif)

#### General > Preferences
1. ☑️ Load preferences from a custom folder or URL
2. Open `[path-to-my-dotfiles]/iterm/preferences`
3. ☑️ Save changes to folder when iTerm2 quits

#### Profiles
1. Go to *Other Actions…* > *Import JSON Profiles…*
2. Open `[path-to-my-dotfiles]/iterm/profiles/Default.json`
3. Set new *Default* profile as default
4. Delete old *Default* profile

<a name="firefox"></a>
![](documentation-images/firefox.gif)

1. Disable HTTP Cache when toolbox is open
2. Set Firefox as default browser
3. Set Desktop as destination folder in *Downloads*

<a name="google-chrome"></a>
![](documentation-images/google-chrome.gif)

1. Disable Chrome cache while DevTools is open
2. Set Desktop as destination folder in *Downloads*
3. Install the following extensions:
  - [**Neat URL**](https://chrome.google.com/webstore/detail/neat-url/jchobbjgibcahbheicfocecmhocglkco)
  - [**uBlock Origin**](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
  - [**Vue.js devtools**](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)

<a name="sketch"></a>
![](documentation-images/sketch.gif)

1. Install [**Runner**](https://sketchrunner.com) plugin
2. Install the following plugins using Runner:
  - [**Find and Replace**](https://github.com/thierryc/Sketch-Find-And-Replace)
  - [**Fontily**](https://github.com/partyka1/Fontily)
  - [**Replace Colour**](https://github.com/lewishowles/sketch-replace-colour)
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

Set a [mail signature](https://github.com/wearemd/mail-signatures) for each account

<a name="license"></a>
## 📄 License
**My dotfiles** are licensed under the [GNU General Public License v3.0](LICENSE).
