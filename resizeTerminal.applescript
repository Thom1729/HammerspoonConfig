tell app "Terminal"
  repeat with windowId from 1 to (count windows)
    set number of columns of window windowId to 100
  end repeat
end tell
