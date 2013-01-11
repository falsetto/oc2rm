# Oc2Rm

Converts a teeny bit of Objective-C to RubyMotion using naïve regular expressions.

You can expect Oc2Rm to save you 17(+/-17) keystrokes per Objective-C snippet–provided that you assign `pbpaste | oc2rm | pbcopy` to a global Quicksilver trigger.

## Example

There's not much to it. bin/oc2rm takes a snippet of Objective-C code over STDIN and spits out the same snippet with bits of it converted to RubyMotion code.

* `pbpaste | oc2rm | pbcopy`
