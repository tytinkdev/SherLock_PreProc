#!/usr/bin/awk -f
BEGIN { FS="\t"; OFS="," } { 
  if (FILENAME ~ /T4/){ 
    rebuilt=0 
    for(i=1; i<=NF; ++i) { 
      if ($i ~ /Hz/){ 
        $i = ($i + 0) 
        if ($i > 100) {$i*=.001} 
      } 
      if ($i ~ /,/ && $i !~ /^".*"$/) { 
        gsub("\"", "\"\"", $i) 
        $i = "\"" $i "\"" 
        rebuilt=1 
      } 
    } 
    if (!rebuilt) { $1=$1 } 
    print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26 
  } 
  else if (FILENAME ~ /Mor/) { 
    rebuilt=0 
    for(i=1; i<=NF; ++i) 
      if ($i ~ /,/ && $i !~ /^".*"$/) { 
        gsub("\"", "\"\"", $i) 
        $i = "\"" $i "\"" 
        rebuilt=1 
      } 
    if (!rebuilt) { $1=$1 } 
    print $1,$2,$3,$4,$5,$6,$7,$8 
  } 
} 