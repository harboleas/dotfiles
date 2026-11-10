
hl.window_rule ({
    name = "wifi-ctl",
    match     = { class = "org.twosheds.iwgtk",},
    float     = true,
    size      = "650 600",
    move      = "monitor_w-660 50",
    animation = "slide right",
    opacity   = 0.95,
})

hl.window_rule ({
    name = "wifi-passwd",
    match     = { class = "iwgtk",},
    float     = true,
    size      = "0 0",
    move      = "cursor_x-200 cursor_y",
    opacity   = 0.95,
})

hl.window_rule ({
  name = "audio-ctl",
  match = { class = "org.pulseaudio.pavucontrol", },
  float = true,
  size = "650 600",
  move = "monitor_w-660 50",
  animation = "slide right",
  opacity = 0.95,
})

hl.window_rule ({
  name = "bluetooth-ctl",
  match = { class = "blueman-manager", },
  float = true,
  size = "600 600",
  move = "monitor_w-610 50",
  animation = "slide right",
  opacity = 0.95,
})
