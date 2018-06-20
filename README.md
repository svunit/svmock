# Using SVMock with SVUnit

In this example, we're unit testing a class called `bedrock`. There's one function in `bedrock` that needs to be unit tested called yabba_dabba_do. Specifically, we're interested in how `bedrock::yabba_dabba_do()` relies on functionality from an instance of 'flintstones`. Instead of using the real version of `flintstones`, we'll use SVMock to create a `flinstones_mock` so we can directly isolate and test the interaction within an instance of `bedrock`.

## Defining a Class

The class `flintstones` includes 3 functions used by `bedrock`: `dino`, `pebbles` and `bam_bam`... 

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

To create a mock of `flintstones`, we'll use macros defined in svmock_defines.svh as such...

```
`SVMOCK(mock_flintstones, flintstones)
  `SVMOCK_VOIDFUNCTION0(dino)
  `SVMOCK_FUNCTION2(pebbles, int, int, fred, , string, wilma, [int])
  `SVMOCK_VOIDFUNCTION1(bam_bam, int, barney, )
`SVMOCK_END
```

The `SVMOCK(mock_class, parent_class)/SVMOCK_END` macros roughly translate to class/endclass. Each function in `flintstones` is mocked with an `SVMOCK_*` function macro. Void functions use the `SVMOCK_VOIDFUNCTION<N>` macros where <N> is the number of input arguments. The function `flintstones::dino`, for example, has no input arguments so it is mocked with `SVMOCK_VOIDFUNCTOIN0` whereas `flintstones::bam_bam` has 1 argument so it requires the `SVMOCK_VOIDFUNCTION1` macro. The first argument to the void function macros is the name of the function. Subsequent arguments are related to each input argument.

For functions that are non-void, the `SVMOCK_FUNCTION<N>` macros are used. The first argument is still the name of the function. The second argument is the return type of the function. Subsequent arguments are related to each input argument.

```
`SVMOCK_VOIDFUNCTION<N>(NAME,<ARG0 INPUT>,<ARG1 INPUT>,...<ARGN INPUT>)
`SVMOCK_FUNCTION<N>(NAME,RETURN_TYPE,<ARG0 INPUT>,<ARG1 INPUT>,...<ARGN INPUT>)
```

The arg inputs require a <type>, <name> and <aggregate data type>. The aggregate data type input is required regardless of whether or not the arguement is actually an aggregate data type because Systemverilog macros are lame so for scalar data types that input would have nothing specified. For example, the `flintstones::pebbles` has 2 input arguements: `fred` and `wilma`. `fred` is a scalar data type so its arg input to the `SVMOCK_FUNCTOIN2` macro is `int, fred, ` (note the `,` after `fred` which signifies and argument with nothing specified) where type=int, name=fred, aggregate type=<blank>. `wilma`, on the other hand, is an aggregate data type (associative array of strings indexed by [int]) so all 3 macro inputs are used as `string, wilma, [int]`.

|  Function Arguments | Type   | Name  | Aggregate type |
|---------------------|--------|-------|----------------|
| int fred            | int    | fred  |                |
| string wilma [int]  | string | wilma | [int]          |

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
