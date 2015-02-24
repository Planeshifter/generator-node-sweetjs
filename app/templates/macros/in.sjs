operator (in) 10 left { $l, $r } =>
  #{
    Array.isArray($r) ?
      !!~$r.indexOf($l) :
      !!$r[$1]
  }

export in
