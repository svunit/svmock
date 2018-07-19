`SVMOCK(mock_flintstones, flintstones)
  `SVMOCK_VFUNC0(dino)

  `SVMOCK_FUNC2(pebbles, int, /*input*/, int,    fred,  /*scalar*/, /*no default*/,
                              /*input*/, string, wilma, [int], /*no default*/)

  `SVMOCK_VFUNC1(bam_bam, /*input*/, int, barney, /*scalar*/, /*no default*/)

  `SVMOCK_MAP_VFUNC0(dino, mr_slate)
  bit mr_slate_instead;
  function void mr_slate();
    mr_slate_instead = 1;
  endfunction

  `SVMOCK_MAP_FUNC2(pebbles, rock_quarry)
  function int rock_quarry(int fred, string wilma [int]);
    // a replacement for pebbles
  endfunction
`SVMOCK_END
