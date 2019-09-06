EXTERNAL bar
INCLUDE foo

// foo
/* bar */
/* bar
 * comments are just comments, nothing else
 */

TODO: todos are a whole line
TODO : Why
 TODO: Why
# Foo
  # Foo
# foo # Bar // tags can have comments

->->
foo

-> // comments ! TODO: Why
->->
-> init
->-> init
-> init->
->ini ->
-> init -> init
-> init -> init ->->
-> init -> init ->-> init

Text -> init -> target space foo

Foo <>
Bar ->
<> glue <>
-> DONE
-> END

-> init.a_stitch

=== init ===
Foo!

= a_stitch
Some {!text} choices {~that|shuffle|and {&sometimes|repeat}}

{ foo }
This is true, this is false.
This is { true }, this is {false}

=== init ===
- (label)
* (label) I would like [One]
  Oh no.
+ (label) [Two]
  Oh no!
* [Three] -> four
* (label) {le condition} Foo [three] ->-> thiing
* * * * (label) Foo
- -  Bar
+ +  Baz
- -> label

=== done ===
Done
-> DONE

{-> foo | -> bar }

{CHOICE_COUNT() true}
{TURNS() true}
{TURNS_SINCE(-> foo) true}
{SEED_RANDOM(123)}
