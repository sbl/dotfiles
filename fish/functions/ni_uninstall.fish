# uninstall NI products
function ni_uninstall -a 'app'
  if test -n "$app"
    read -p 'echo "really uninstall $app? (y/n)"' -l confirm

    if test "y" = $confirm
      echo "… uninstalling $app …"
      trash "/Applications/Native Instruments/$app"
      trash "/Library/Preferences/com.native-instruments.$app.plist"
      trash "/Library/Audio/Plug-Ins/Components/$app.component"
      trash "/Library/Audio/Plug-Ins/VST/$app.vst"
      trash "/Library/Application Support/Native Instruments/$app"
      trash "/Library/Application Support/Native Instruments/Service Center/$app.xml"
      trash "$HOME/Library/Preferences/com.native-instruments.$app.plist"
      trash "$HOME/Library/Application Support/Native Instruments/$app"
    else
      echo "bailing"
    end


  else
    echo "no app given"
    return 1
  end

end
