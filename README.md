# Using SVMock with SVUnit

## Defining a Class

blah blah blah

```
class flintstones;
  function new(); endfunction

  virtual function void dino();
    // all the code for dino
  endfunction

  virtual function int pebbles(int fred, string wilma [int]);
    return 12;
  endfunction

  virtual function void bam_bam(int barney);
    // nothing to do
  endfunction
endclass
```

## Mocking a Class

blah blah blah

```
`SVMOCK(mock_flintstones, flintstones)
  `SVMOCK_VOIDFUNCTION0(dino)
  `SVMOCK_FUNCTION2(pebbles, int, int, fred, , string, wilma, [int])
  `SVMOCK_VOIDFUNCTION1(bam_bam, int, barney, )
`SVMOCK_END
```

## Using the Mock

blah blah blah

```
class bedrock;
  flintstones f = new();

  function void yabba_dabba_do(string wilma [int]);
    f.dino();
    f.bam_bam(f.pebbles(wilma.num(), wilma));
  endfunction
endclass
```

blah blah blah

```
  bedrock uut;
  mock_flintstones mock_f = new();
  ...
  function void build();
    svunit_ut = new(name);

    uut = new();
    uut.f = mock_f;
  endfunction
```

## Setting Expectations

### Expect Functions Are Invoked

### Expect Function Arguments

## Overriding Return Values
