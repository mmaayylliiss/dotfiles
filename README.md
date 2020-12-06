<p align="center">
  <img src="documentation-images/README-header.gif" alt="">
</p>
<p align="center">
  🖥 My local configuration (macOS)
</p>

- - -

## 📝 Table of contents
- [**Commands**](#commands)
- [**Software manual configuration**](#software-manual-configuration)
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

<a name="iterm"></a>
![](documentation-images/iterm.gif)

First type `p10k configure` and answer `Yes` when asked whether to install *Meslo Nerd Font*. No need to finish `p10k` config, just install the required font and quit. Then do a few manual config in *Preferences*:

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

1. Set Firefox as default browser
2. Disable HTTP Cache when toolbox is open

<a name="google-chrome"></a>
![](documentation-images/google-chrome.gif)

1. Disable Chrome cache while DevTools is open
2. Install the following extensions:
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

Install Photoshop [**GuideGuide**](https://guideguide.me/documentation/) extension

Optional:
- Install [Photoshop additional scripts](adobe-creative-cloud/photoshop)
- Install [InDesign additional scripts](adobe-creative-cloud/indesign)

<a name="mail"></a>
![](documentation-images/mail.gif)

Set a [mail signature](https://github.com/wearemd/mail-signatures) for each account

<a name="license"></a>
## 📄 License
**Maylis Agniel dotfiles** are licensed under the [GNU General Public License v3.0](LICENSE).
