# Creating an SVMock

This goes through the working example in `examples/class/bedrock`. Best to refer to files in that directly as you read through this. This assumes that you have an understanding of SVUnit. If you don't, you probably want to start at the [SVUnit project page](http://www.agilesoc.com/svunit) first, then come back to this.

In this example, we're unit testing a class called `bedrock`. There's one function in `bedrock` that needs to be unit tested called `yabba_dabba_do`. Specifically, we're interested in how `bedrock::yabba_dabba_do()` relies on functionality from an instance of `flintstones`. Instead of using the real version of `flintstones`, we'll use SVMock to create a `flinstones_mock` so we can directly isolate and test the interactions within `bedrock`.

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
  `SVMOCK_VFUNC0(dino)

  `SVMOCK_FUNC2(pebbles, int, /*input*/, int,    fred,  /*scalar*/, /*no-default*/,
                              /*input*/, string, wilma, [int],      /*no-default*/)

  `SVMOCK_VFUNC1(bam_bam, int, /*input*/, barney, /*scalar*/, /*no-default*/)
`SVMOCK_END
```

The `SVMOCK(mock_class, parent_class)/SVMOCK_END` macros roughly translate to class/endclass.

Each function in `flintstones` is mocked with an `SVMOCK_*` function macro. Void functions use the `SVMOCK_VFUNC<N>` macros where 'N' is the number of input arguments. The function `flintstones::dino`, for example, has no input arguments so it is mocked with `SVMOCK_VFUNC0` whereas `flintstones::bam_bam` has 1 argument so it requires the `SVMOCK_VFUNC1` macro. The first argument to the void function macros is the name of the function. Subsequent arguments are related to each input argument.

For functions that are non-void, the `SVMOCK_FUNC\<N\>` macros are used. The first argument is still the name of the function. The second argument is the return type of the function. Subsequent arguments are related to each input argument.

Tasks are mocked using the `SVMOCK_TASK\<N\> macors. The task macro syntax is the same as the void function macros.

```
`SVMOCK_VFUNC<N>(NAME,<ARG0 INPUT>,<ARG1 INPUT>,...<ARGN INPUT>)
`SVMOCK_TASK<N>(NAME,<ARG0 INPUT>,<ARG1 INPUT>,...<ARGN INPUT>)
`SVMOCK_FUNC<N>(NAME,RETURN_TYPE,<ARG0 INPUT>,<ARG1 INPUT>,...<ARGN INPUT>)
```

The <ARG INPUT> has inputs to cover all possible ways to declare a function/task argument. The syntax is:

```
|          Direction       | Type | Name |     Aggregate type    |     Default     |
|--------------------------|------|------|-----------------------|-----------------|
| [input|ref|output|inout] | type | name | [aggregate data type] | [default value] |
```

All inputs are required for each function/task argument (to maintain the order of the macro inputs). However, direction, aggregate type and default can take an empty string input in cases where they aren't necessary. To make it easier to maintain argument order, it's recommended to use comments for unnecessary inputs. For example, the arguments to pebbles are broken into macro arguments as...

| Direction |   Type  |  Name | Aggregate type |     Default    |
|-----------|---------|-------|----------------|----------------|
| /*input*/ | int     | fred  |   /*scalar*/   | /*no-default*/ |
| /*input*/ | string  | wilma |   [int]        | /*no-default*/ |

## Connecting The Mock

With `bedrock` defined as...

```
class bedrock;
  flintstones f = new();

  function void yabba_dabba_do(string wilma [int]);
    f.dino();
    f.bam_bam(f.pebbles(wilma.num(), wilma));
  endfunction
endclass
```

...to take effect, an instance of `flintstones_mock` must be created and  used in place of the original `bedrock::f`. This can be done in the bedrock_unit_test.sv where it's declared as our unit under test `uut`.

```
  `include "flintstones_mock.sv"
  ...
  bedrock uut;
  mock_flintstones mock_f = new();
  ...
  function void build();
    svunit_ut = new(name);

    uut = new();
    uut.f = mock_f;
  endfunction
```

The `flinstones_mock` has to be included for compilation, either as an include or as part of a package. In this example we're using an include (see above).

It's also required that the reseting and checking of the mock be invoked inside the unit test template. That's best done in the `setup()` and `teardown()` methods so that it's automatically done for every test.

```
  task setup();
    svunit_ut.setup();
    /* Place Setup Code Here */

    mock_f.clear();
  endtask
  ...
  task teardown();
    svunit_ut.teardown();
    /* Place Teardown Code Here */

    `FAIL_UNLESS(mock_f.check());
  endtask
```

# Using The Mock

Currently, users can set expectations for how many times a function has been called as well as the arguments it is invoked with. You can also override function return values.

## Expect Functions Are Invoked

In our first unit test, we simply want to verify that the function `dino()` is invoked in `bedrock::yabba_dabba_do`. We can do that with an EXPECT_CALL.

```
  `SVTEST(dino_called_once)
    `EXPECT_CALL(mock_f, dino).exactly(1); // dino should be called exactly once

    uut.yabba_dabba_do(betty);
  `SVTEST_END
```
Since we expect `dino()` to be called exactly once, we use `exactly(1)`. Other options for an EXPECT_CALL that verifies whether or not a function has been called are `at_least(<N>)`, `at_most(<N>)` and `between(<N>, <M>)`.

| EXPECT_CALL method | Check                                                  |
|--------------------|--------------------------------------------------------|
| `exactly(N)`       | function is called exactly 'N' times                   |
| `at_least(N)`      | function is called at least 'N' times                  |
| `at_most(N)`       | function is called at most 'N' times                   |
| `between(N, M)`    | function is called at least 'N' and at most 'M' times  |

## Expect Function Arguments

We can also use a `flintstones_mock` EXPECT_CALL to check functions are called with specific arguments. For example, we can expect that `f.pebbles` is invoked from `yabba_dabba_do` with arguments derived from its input argument. Setting expectations for arguments is done with a `with_args` EXPECT_CALL.

```
  `SVTEST(pebbles_called_with_betty)
    `EXPECT_CALL(mock_f, pebbles).with_args(betty.num(), betty); // expect yabba_dabba_do invokes pebbles(betty.num(), betty)

    uut.yabba_dabba_do(betty);
  `SVTEST_END
```

Inputs to `with_args` are identical to the inputs of the function being checked. In this case, we're checking inputs to `pebbles` which are `(int , string [int])` so `with_args` has the same `(int , string [int])` inputs. Currently, all inputs must be specified.

## Overriding Return Values

The mock can be used to override return values of functions. In a third test, we want to confirm `bam_bam()` is invoked with the return value of `pebbles()` without concerning ourselves with the actual functionality of pebbles or it's realistic return value. We can use ON_CALL to to override the return value of `pebbles()`, then use EXPECT_CALL to verify that the value we specify is indeed used as input to `bam_bam()`.

```
  `SVTEST(bam_bam_called_with_pebbles)
    `ON_CALL(mock_f, pebbles).returns(99);         // Override pebbles return value
    `EXPECT_CALL(mock_f, bam_bam).with_args(99);   // expect bam_bam is called with the override value

    uut.yabba_dabba_do(betty);
  `SVTEST_END
```

## Overriding A Method

If simply overriding a return value isn't enough or you need to replace functionality of a method, you can override that mocked method with something entirely new. For example, the functionality of `dino()` could replaced by calling `mr_slate()` instead. To do this, we need to define `mr_slate()` then map it to `dino()` with an SVMOCK_MAP_FUNC in `flintstones_mock`.

```
  `SVMOCK_MAP_VFUNC0(dino, mr_slate)
  bit mr_slate_instead;
  function void mr_slate();
    mr_slate_instead = 1;
  endfunction
```

Once `mr_slate()` is mapped to `dino()`, we can then override `dino()` in our 4th unit test using a `will_by_default` ON_CALL. Notice that `will_by_default` takes a string input which is the name of the newly mapped function.

```
  `SVTEST(mr_slate_instead_of_dino)
    `ON_CALL(mock_f, dino).will_by_default("mr_slate");
  
    uut.yabba_dabba_do(betty);
  
    `FAIL_UNLESS(mock_f.mr_slate_instead)
  `SVTEST_END
```

Important to note that the signature of `mr_slate()` is exactly the same as the signature for `dino()` (i.e. neither function has input arguments). For another example, if we were to map `pebbles()` to a new function called `rock_quarry()`, `rock_quarry()` would require similar `fred` and `wilma` input arguments.

```
  `SVMOCK_FUNC2(pebbles, int, int, fred, , string, wilma, [int])
  ...
  `SVMOCK_MAP_FUNC2(pebbles, rock_quarry)
  function int rock_quarry(int fred, string wilma [int]);
    // a replacement for pebbles
  endfunction
```

There's a different macro available for each possible method type.

```
`SVMOCK_MAP_VFUNC<N>(OLD_FUNCTION, NEW_FUNCTION)
`SVMOCK_MAP_TASK<N>(OLD_FUNCTION, NEW_FUNCTION)
`SVMOCK_MAP_FUNC<N>(OLD_FUNCTION, NEW_FUNCTION)
```

# Initialization and Checking

To ensure the mock state is reset for each test, the `clear()` function for the mock should be called in the `setup()` method of the unit test template. Similarly, for the checking to be invoked it's necessary to call the `check()` function in the mock. `check()` will return 1 (true) when expectations are met, 0 (false) otherwise). It's recommended you can call `check()` in the teardown method so it's automatically invoked at the end of each test.

# Future Development

We're at the tip of the ice berg here so there's more to come.

# Feedback

Feel free to send comments and/or critique to neil.johnson@agilesoc.com. Optionally, you can file issues at https://github.com/nosnhojn/svmock/issues.
