# Oc2Rm

Converts a tiny bit of Objective-C to RubyMotion using stupidly naïve regular expressions.

## Example

There's not much to it. bin/oc2rm takes a snippet of Objective-C code over STDIN and spits out the same snippet with bits of it converted to RubyMotion code.

* `pbpaste | bin/oc2rm | pbcopy`
