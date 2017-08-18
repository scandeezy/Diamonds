; For generating a Windows installer for Diamonds using NSIS (nsis.sourceforge.net)

; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Diamonds"
!define PRODUCT_VERSION "0.5"
!define PRODUCT_WEB_SITE "https://github.com/mblaine/Diamonds"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\diamonds.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\COPYING.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\diamonds.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME}"
OutFile "diamonds-${PRODUCT_VERSION}-win32-setup.exe"
InstallDir "$PROGRAMFILES\Diamonds"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails hide
ShowUnInstDetails hide

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "..\..\libfreetype-6.dll"
  File "..\..\libogg-0.dll"
  File "..\..\libpng12-0.dll"
  File "..\..\libvorbis-0.dll"
  File "..\..\libvorbisfile-3.dll"
  File "..\..\SDL_mixer.dll"
  File "..\..\SDL_ttf.dll"
  File "..\..\zlib1.dll"
  SetOutPath "$INSTDIR\data"
  File "..\..\data\background.png"
  File "..\..\data\block.png"
  File "..\..\data\bounce.ogg"
  File "..\..\data\bounce2.ogg"
  File "..\..\data\colorblock.ogg"
  File "..\..\data\colorchange.ogg"
  File "..\..\data\diamond.ogg"
  File "..\..\data\diamonds.ttf"
  File "..\..\data\diamonds.xpm"
  File "..\..\data\diamonds16.xpm"
  File "..\..\data\die.ogg"
  File "..\..\data\key.ogg"
  File "..\..\data\laughing.ogg"
  File "..\..\data\levelwon.ogg"
  File "..\..\data\lock.ogg"
  File "..\..\data\oneup.ogg"
  File "..\..\data\reverse.ogg"
  File "..\..\data\timebonus.ogg"
  File "..\..\data\Diamonds.txt"
  File "..\..\data\More_Diamonds.txt"
  File "..\..\data\logo.png"
  File "..\..\data\hud_timebonus.bmp"
  File "..\..\data\hudbackground.png"
  File "..\..\data\ball.png"
  File "..\..\data\hud.png"
  File "..\..\data\editor.xpm"
  File "..\..\data\editor16.xpm"
  SetOutPath "$INSTDIR"
  File "..\..\SDL.dll"
  File "..\..\SDL_image.dll"
  File "..\..\diamonds.exe"
  File "..\..\editor.exe"
  CreateDirectory "$SMPROGRAMS\Diamonds"
  CreateShortCut "$SMPROGRAMS\Diamonds\Diamonds.lnk" "$INSTDIR\diamonds.exe"
  CreateShortCut "$SMPROGRAMS\Diamonds\Diamonds Level Editor.lnk" "$INSTDIR\editor.exe"
  CreateShortCut "$SMPROGRAMS\Diamonds\Read Me.lnk" "$INSTDIR\README.txt"
  CreateShortCut "$SMPROGRAMS\Diamonds\License.lnk" "$INSTDIR\COPYING.txt"
  File "..\..\COPYING.txt"
  File "..\..\README.txt"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\Diamonds\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\diamonds.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\diamonds.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to remove $(^Name)?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\CHANGELOG.txt"
  Delete "$INSTDIR\README.txt"
  Delete "$INSTDIR\COPYING.txt"
  Delete "$INSTDIR\diamonds.exe"
  Delete "$INSTDIR\editor.exe"
  Delete "$INSTDIR\SDL_image.dll"
  Delete "$INSTDIR\SDL.dll"
  Delete "$INSTDIR\data\hud.png"
  Delete "$INSTDIR\data\ball.png"
  Delete "$INSTDIR\data\hudbackground.png"
  Delete "$INSTDIR\data\hud_timebonus.bmp"
  Delete "$INSTDIR\data\logo.png"
  Delete "$INSTDIR\data\More_Diamonds.txt"
  Delete "$INSTDIR\data\Diamonds.txt"
  Delete "$INSTDIR\data\timebonus.ogg"
  Delete "$INSTDIR\data\reverse.ogg"
  Delete "$INSTDIR\data\oneup.ogg"
  Delete "$INSTDIR\data\lock.ogg"
  Delete "$INSTDIR\data\levelwon.ogg"
  Delete "$INSTDIR\data\laughing.ogg"
  Delete "$INSTDIR\data\key.ogg"
  Delete "$INSTDIR\data\die.ogg"
  Delete "$INSTDIR\data\diamonds16.xpm"
  Delete "$INSTDIR\data\diamonds.xpm"
  Delete "$INSTDIR\data\diamonds.ttf"
  Delete "$INSTDIR\data\diamond.ogg"
  Delete "$INSTDIR\data\colorchange.ogg"
  Delete "$INSTDIR\data\colorblock.ogg"
  Delete "$INSTDIR\data\bounce2.ogg"
  Delete "$INSTDIR\data\bounce.ogg"
  Delete "$INSTDIR\data\block.png"
  Delete "$INSTDIR\data\background.png"
  Delete "$INSTDIR\data\editor.xpm"
  Delete "$INSTDIR\data\editor16.xpm"
  Delete "$INSTDIR\data\editor.ini"
  Delete "$INSTDIR\zlib1.dll"
  Delete "$INSTDIR\SDL_ttf.dll"
  Delete "$INSTDIR\SDL_mixer.dll"
  Delete "$INSTDIR\libvorbisfile-3.dll"
  Delete "$INSTDIR\libvorbis-0.dll"
  Delete "$INSTDIR\libpng12-0.dll"
  Delete "$INSTDIR\libogg-0.dll"
  Delete "$INSTDIR\libfreetype-6.dll"
  Delete "$INSTDIR\data\settings.ini"
  Delete "$INSTDIR\data\scores.dat"

  Delete "$SMPROGRAMS\Diamonds\Uninstall.lnk"
  Delete "$SMPROGRAMS\Diamonds\Diamonds.lnk"
  Delete "$SMPROGRAMS\Diamonds\Diamonds Level Editor.lnk"
  Delete "$SMPROGRAMS\Diamonds\Read Me.lnk"
  Delete "$SMPROGRAMS\Diamonds\License.lnk"
  Delete "$DESKTOP\Diamonds.lnk"

  RMDir "$SMPROGRAMS\Diamonds"

  RMDir "$INSTDIR\data"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd