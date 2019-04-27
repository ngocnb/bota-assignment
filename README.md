# Installation

Below is the requirement to run this project:

- Ruby: 2.6.1
- Rspec

# Circular shift (Rotate bits)
## Command

To run circular shift, please use the command below:

```
ruby circular_shift.rb -n NUMBER -b INT_BITS -s STEPS -d DIRECTION
```

Command usage:
```
Usage: circular_shift [options]
    -n, --number NUMBER              the NUMBER to be circular shifted
    -b, --bits INTEGER_BITS          the INTEGER BITS of the NUMBER
    -s, --steps STEPS                the number of STEPS that the NUMBER will be circular shifted
    -d, --direction DIRECTION        the DIRECTION that the NUMBER will be circular shifted
```

Example command:

```
ruby circular_shift.rb -n 123 -b 8 -s 2 -d left
```

## Unit tests

Unit test is located in folder `spec/`.To run unit test, please use the command below:

```
# to run all tests
rspec spec

# to run only unit test for circular_shift
rspec spec spec/helpers/bit_helper_spec.rb
```