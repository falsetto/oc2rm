def Oc2Rm(input)
  # Convert calls to release
  input.gsub! /^\s*\[(\S+)\srelease\];\s*$\n/, ''
  input.gsub! /\[(\S+)\srelease\]/, ''
  # Convert zero-arity method calls
  input.gsub! /\[(\S+)\s(\S+)\]/, '\1.\2'
  # Convert local vars
  input.gsub! /[A-Z]\w+\s\*?(\w+)/, '\1'
  # Convert booleans
  input.gsub! 'YES', 'true'
  # Convert calls to super
  input.gsub! /super\.\S+/, 'super'
  # Convert dereference operators
  input.gsub! /\*(\w+)/, '\1'
  # Convert EOLs
  input.gsub! ';', ''
  input
end
