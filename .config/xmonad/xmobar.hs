Config {
    -- appearance
      font     = "xft:monospace:size=9:bold:antialias=true"
    , bgColor  = "#000000"
    , fgColor  = "#4D4D4D"
      , position = Top

    -- commands
    , commands =
         [ Run Date     "%F (%a) %T" "date" 10
         , Run Memory   ["-t","<usedratio>", "-w", "2" ] 10
         , Run MultiCpu ["-t", "<autototal>"
            , "-L", "30", "-H", "60"
            , "-h","#FF5555", "-l", "#4D4D4D"
            ] 10
         , Run StdinReader
         , Run BatteryP ["BAT0"]
                ["-t", "<acstatus>"
                , "-L", "10", "-H", "80"
                , "-l", "red", "-h", "#4D4D4D"
                , "--", "-O", "Charging", "-o", "<left>% (<timeleft>)"
                ] 10
         ]

    -- layout
    , sepChar =  "%"   -- delineator between plugin names and straight text
    , alignSep = "}{"  -- separator between left-right alignment
    , template = "%StdinReader% }{ %multicpu% / %memory% | %battery% | %date%"
    }
